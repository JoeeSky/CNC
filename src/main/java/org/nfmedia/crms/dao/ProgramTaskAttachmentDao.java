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

	public static final String GET_PROGRAMTASK_ATTACHMENT_LIST_BY_TASK_ID="select p.id,p.type,p.fileName,p.filePath from ProgramTaskAttachment p left join p.task where p.task.id = ";
	public List getProgramTaskAttachmentListByTaskId(
			int id) {
		return find(GET_PROGRAMTASK_ATTACHMENT_LIST_BY_TASK_ID + id);
	}

}
