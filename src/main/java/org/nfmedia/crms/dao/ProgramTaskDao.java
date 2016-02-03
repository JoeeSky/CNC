package org.nfmedia.crms.dao;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.ProgramTask;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class ProgramTaskDao extends BaseDao<ProgramTask> {
	//public static final String GET_PROGRAM_TASK_LIST="select p.id, p.taskName,p.issueTime,p.demander.name,p.cnc.name,p.status from ProgramTask p left join p.demander left join p.program left join p.user";
	
	public static final String GET_PROGRAM_TASK_LIST="select p.id, p.taskName,p.issueTime,p.demanderUser.name,p.cnc.name,p.status.name,p.resultStatus.name from ProgramTask p left join p.demanderUser left join p.cnc  left join p.status left join p.resultStatus";
	public static final String GET_PROGRAM_TASK_RESULT_LIST="select p.id,p.taskName,p.issueTime,p.demander.name,p.cncUser.name,p.status.name,p.resultStatus.name from ProgramTask p left join p.demander left join p.cncUser left join p.status left join  p.resultStatus ";
	public static final String GET_PROGRAM_TASK_ID_BY_FILE_PATH="select p.id from ProgramTask p where p.taskName = ";
	public List getProgramTaskList () {
		return find(GET_PROGRAM_TASK_LIST);
	}

	public List getProgramTaskResultList() {
		return find(GET_PROGRAM_TASK_RESULT_LIST);
	}


	public List getProgramTaskListByKeyWord(String searchString) {
		return find(GET_PROGRAM_TASK_LIST + searchString);
	}

	public List getProgramTaskResultListByKeyWord(String searchString) {
		return find(GET_PROGRAM_TASK_RESULT_LIST + searchString);
	}

	public List getProgramTaskIdByFilePath(String taskName) {
		return find(GET_PROGRAM_TASK_ID_BY_FILE_PATH+"'"+taskName+"'");
	}

}
