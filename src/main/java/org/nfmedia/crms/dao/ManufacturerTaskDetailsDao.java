package org.nfmedia.crms.dao;


import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.ManufacturerTaskDetails;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class ManufacturerTaskDetailsDao extends BaseDao<ManufacturerTaskDetails> {

}
