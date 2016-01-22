package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Manufacturer;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class ManufacturerDao extends BaseDao<Manufacturer>{
	private static final String GET_MANUFACTURER_BY_NAME = "from Manufacturer m where m.name = :name";
	public static final String GET_MANUFACTURER_LIST="select m.id, m.name,m.description,m.pinyin, m.address, m.contact, m.email, m.mobile, m.tel, m.verifystatus, m.url from Manufacturer m ";

	public Manufacturer getManufacturerByName(final String name){
		return getHibernateTemplate().execute(new HibernateCallback<Manufacturer>() {
			@Override
			public Manufacturer doInHibernate(Session session)
					throws HibernateException, SQLException {
				return (Manufacturer) session.createQuery(GET_MANUFACTURER_BY_NAME).setString("name", name).setReadOnly(true).uniqueResult();
			}
		});
	}
	
	public List getManufacturerList() {
		return find(GET_MANUFACTURER_LIST);
	}
	
	public List getManufacturerListByCondition(String searchString) {
		return find(GET_MANUFACTURER_LIST + searchString);
	}
}
