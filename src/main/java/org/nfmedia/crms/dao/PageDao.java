package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Page;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class PageDao extends BaseDao<Page> {
	public List getPageByCompanyType(String companyType){
		return  find("from Page p where companyTypes like '%"+companyType+"%' order by sortOrder");
	}
}



