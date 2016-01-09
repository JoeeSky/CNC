package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.util.Page;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-16 上午11:29:34 
 */
@Repository
public class UserDao extends BaseDao<User> { 

	private static final String GET_USER_BY_ACCOUNT = "from User u where u.account = :account";
	
	//获取用户列表，但不包括超级管理员账户和管理员账户
	private static final String GET_USERS_LIST = "select u.id,u.account,u.name,u.department.name,u.role.name from User u left join u.department left join u.role where u.state!=? and u.role.id!=1 and u.role.id!=2";
	private static final String GET_USER_NAME ="select u.name from User u";
	private static final String GET_DEPARTMENT_BY_ID="select u.department.name from User u where u.id=";
	private static final String GET_USER_RIGHT="select u.role.id from User u left join u.role where u.id=";
	/*private static final String GET_USERS_LIST_BY_KEYWORD = "select u.id,u.account,u.name,u.department.name,u.role.name from User u " +
			"left join u.department left join u.role where u.state!=? and u.role.id!=1 and u.role.id!=2" +
			" and (u.account like ? or u.name like ? or u.department.name like ? or u.role.name like ?)";*/
	private static final String GET_CREATUSER_BY_DEPARTMENT="select u.name from User u where u.state<>'D' and (u.role.id=3 or u.role.id=4) and u.department.name=";
	private static final String GET_USER_NAME_BY_ID="select u.name,u.role.id from User u where  u.id=";
	public User getUserByAccount(final String account){
		return getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session)
					throws HibernateException, SQLException {
				return (User) session.createQuery(GET_USER_BY_ACCOUNT).setString("account", account).setReadOnly(true).uniqueResult();
			}
			
		});
	}
	
	public Page getUsersList(String sidx,String sord,int pageNo,int pageSize){
		return pagedQuery(GET_USERS_LIST+" order by u."+sidx+" "+sord, pageNo, pageSize,UserState.DELETE);
	}
	
	public Page getUsersListByKeyword(String keyword,String sidx,String sord,int pageNo,int pageSize){
		return pagedQuery(GET_USERS_LIST+keyword+" order by u."+sidx+" "+sord, pageNo, pageSize,UserState.DELETE);
		//return pagedQuery(GET_USERS_LIST_BY_KEYWORD+" order by u."+sidx+" "+sord, pageNo, pageSize, UserState.DELETE,"%"+keyword+"%","%"+keyword+"%","%"+keyword+"%","%"+keyword+"%");
	}

	public List getqueryUser(String str) {
		return   find(GET_USER_NAME+str);
	}

	public List getvisitChartsByDepartment(Integer id) {
		return find(GET_DEPARTMENT_BY_ID+id);
	}

	public  List getquerycreatUserRights(String str) {
		return find(GET_CREATUSER_BY_DEPARTMENT+"'"+str+"'");
	}

	public List checkUserRight(Integer id) {
		return find(GET_USER_RIGHT+id);
	}

	public List getLoginUserName(Integer id) {
		return find(GET_USER_NAME_BY_ID+id);
	}

}
