package org.nfmedia.crms.dao;

import org.nfmedia.crms.domain.ProgramTaskAttachment;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.User;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;
@Repository
public class ProgramTaskAttachmentDao extends BaseDao<ProgramTaskAttachment>{

}
