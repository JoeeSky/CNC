package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Role;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class RoleDao extends BaseDao<Role> {
	private static final String GET_ROLE = "select r.name from Role r where  r.name<>'超级管理员' and r.name<>'管理员' ";
	public List getAllRoles(){
		return getHibernateTemplate().execute(new HibernateCallback<List>() {

			@Override
			public List doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("select r.id,r.name from Role r where r.id != 1").list();
			}
			
		});
	}
	
	public List getqueryRole(){
		return find(GET_ROLE);
	}


}



