package org.nfmedia.crms.dao;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Cnc;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class CncDao extends BaseDao<Cnc>{
	private static final String GET_CNC_BY_NAME = "from Cnc c where c.name = :name";
	
	public Cnc getCncByName(final String name){
		return getHibernateTemplate().execute(new HibernateCallback<Cnc>() {
			@Override
			public Cnc doInHibernate(Session session)
					throws HibernateException, SQLException {
				return (Cnc) session.createQuery(GET_CNC_BY_NAME).setString("name", name).setReadOnly(true).uniqueResult();
			}
		});
	}
	
}
