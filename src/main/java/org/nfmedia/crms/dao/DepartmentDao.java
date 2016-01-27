package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Department;
//import org.nfmedia.crms.domain.PersonLevel;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午3:56:37 
 */
@SuppressWarnings("rawtypes")
@Repository
public class DepartmentDao extends BaseDao<Department> {
	
	private static final String GET_DEPARTMENT_LIST ="select d.id,d.name,d.parentDepartment from Department d where d.id = ?";
	
	private static final String GET_DEPARTMENT_NAME="select d.id,d.name,d.parentDepartment from Department d ";
	
	private static final String GET_DEPARTMENT="select p.id,p.name,p.parentDepartment from Department p";
	
	private static final String GET_DEPARTMENT_PARENTDEPARTMENT="select p.id from Department p";
	
	public static final String GET_DEPARTMENT_NAME2="select d.name from Department d"; 
	
	public static final String  GET_CHILD_DEPARTMENT ="select d.name from Department d where d.parentDepartment.name=";
	
	public PageUtil getDepartmentList(String sidx,String sord,int pageNo,int pageSize){
		return pagedQuery(GET_DEPARTMENT_LIST+" order by d."+sidx+" "+sord, pageNo, pageSize);
	}

	public List getAllDepartments(){
		return getHibernateTemplate().execute(new HibernateCallback<List>() {

			@Override
			public List doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("select d.id,d.name from Department d").list();
			}
			
		});
	}
	
	public Department getDepartmentList(final Integer id){
		return getHibernateTemplate().execute(new HibernateCallback<Department>(){

			@Override
			public Department doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				return (Department) arg0.createQuery(GET_DEPARTMENT_LIST).setInteger(0, id).setReadOnly(true).uniqueResult();
			}
		});
	}
	
	public List getSelectParentDepartment(){
		return find(GET_DEPARTMENT_PARENTDEPARTMENT);
	}
	
	public List getSelectName(){
		return find(GET_DEPARTMENT_NAME);
	}
	
	public List getqueryDepartment(){
		return  find(GET_DEPARTMENT_NAME2);
	}

	public List getChildDepartment(String department) {
		return find(GET_CHILD_DEPARTMENT+"'"+department+"'");
	}
	 
}
