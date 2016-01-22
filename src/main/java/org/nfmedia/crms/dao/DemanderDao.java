package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Demander;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class DemanderDao extends BaseDao<Demander>{
	private static final String GET_DEMANDER_BY_NAME = "from Demander d where d.name = :name";
	public static final String GET_DEMANDER_LIST="select d.id, d.name,d.description,d.pinyin, d.address, d.contact, d.email, d.mobile, d.tel, d.verifystatus, d.url from Demander d ";

	public Demander getDemanderByName(final String name){
		return getHibernateTemplate().execute(new HibernateCallback<Demander>() {
			@Override
			public Demander doInHibernate(Session session)
					throws HibernateException, SQLException {
				return (Demander) session.createQuery(GET_DEMANDER_BY_NAME).setString("name", name).setReadOnly(true).uniqueResult();
			}
		});
	}
	
	public List getDemanderList() {
		return find(GET_DEMANDER_LIST);
	}
	
	public List getDemanderListByCondition(String searchString) {
		return find(GET_DEMANDER_LIST + searchString);
	}
}
