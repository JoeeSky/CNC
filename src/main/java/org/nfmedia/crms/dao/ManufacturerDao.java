package org.nfmedia.crms.dao;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Manufacturer;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class ManufacturerDao extends BaseDao<Manufacturer>{
	private static final String GET_MANUFACTURER_BY_NAME = "from Manufacturer m where m.name = :name";
	
	public Manufacturer getManufacturerByName(final String name){
		return getHibernateTemplate().execute(new HibernateCallback<Manufacturer>() {
			@Override
			public Manufacturer doInHibernate(Session session)
					throws HibernateException, SQLException {
				return (Manufacturer) session.createQuery(GET_MANUFACTURER_BY_NAME).setString("name", name).setReadOnly(true).uniqueResult();
			}
		});
	}
	
}
