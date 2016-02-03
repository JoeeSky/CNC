package org.nfmedia.crms.dao;


import java.util.List;

import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-16 上午11:29:34 
 */
@Repository
public class UserDao extends BaseDao<User> { 

	private static final String GET_USER_BY_ACCOUNT = "from User u where u.account = :account";
	
	//获取用户列表，但不包括超级管理员账户和管理员账户
	//private static final String GET_USERS_LIST = "select u.id,u.account,u.name,u.department.name,u.role.name from User u left join u.department left join u.role where u.state!=? and u.role.id!=1 and u.role.id!=2";
	private static final String GET_USER_NAME ="select u.name from User u";
	private static final String GET_USER_RIGHT="select u.role.id from User u left join u.role where u.id=";
	private static final String GET_USER_NAME_BY_ID="select u.name,u.role.id from User u where  u.id=";
	
	public User getUserByAccount(String account){
		List<User> users = find("from User u where u.account = '" + account +"'");
		User user=null;
		if(users.size()>0){
			user= users.get(0);
			//user.setPassword("");
		}
		return user;
	}
	
	public boolean checkPsw(int id, String password){
		List<User> users = find("from User u where u.id = " + id + " and u.password = '" + password +"'");
		return users.size()>0;
	}
	
	public PageUtil getUsersList(String sidx,String sord,int pageNo,int pageSize,String filter){
		String defaultFilter=" where u.status = 'U'";
		if(!filter.equals("")) defaultFilter+=" and ("+filter+")";
		return pagedQuery("select u.id,u.account,u.name,u.role.name from User u"+defaultFilter+" order by u."+sidx+" "+sord,
				pageNo, pageSize);
	}
	
	/*public List getqueryUser(String str) {
		return   find(GET_USER_NAME+str);
	}*/

	
	
	public List checkUserRight(Integer id) {
		return find(GET_USER_RIGHT+id);
	}

	public List getLoginUserName(Integer id) {
		return find(GET_USER_NAME_BY_ID+id);
	}

}
