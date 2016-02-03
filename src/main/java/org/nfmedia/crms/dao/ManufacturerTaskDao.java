package org.nfmedia.crms.dao;

import java.util.List;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.nfmedia.crms.domain.ManufacturerTask;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository
public class ManufacturerTaskDao extends BaseDao<ManufacturerTask>{
	public static final String GET_MANUFACTURER_TASK_LIST="select m.id,m.taskName,m.modifyTime,m.demanderUser.name,m.manufacturer.name,m.status.name,m.resultStatus.name from ManufacturerTask m left join m.demanderUser left join m.manufacturer left join m.status left join m.resultStatus ";
	public static final String GET_MANUFACTURER_TASK_RESULT_LIST="select m.id,m.taskName,m.modifyTime,m.demander.name,m.manufacturerUser.name,m.status.name,m.resultStatus.name from ManufacturerTask m left join m.demander left join m.manufacturerUser left join m.status left join m.resultStatus";
	public static final String GET_MANUFACTURER_TASK_ID_BY_TASKNAME=" select m.id from ManufacturerTask m where m.taskName = ";
	public List getManufacturerTaskList(){
		return find(GET_MANUFACTURER_TASK_LIST);
	}

	public List getManufacturerTaskResultList() {
		return find(GET_MANUFACTURER_TASK_RESULT_LIST);
	}

	public List getManufacturerTaskListByKeyword(String keyword) {
		return find(GET_MANUFACTURER_TASK_LIST+keyword);
	}

	public List getManufacturerTaskResultListByKeyword(String keyword) {
		return find(GET_MANUFACTURER_TASK_RESULT_LIST+keyword);
	}

	public List getManufacturerTaskIdByTaskName(String taskName) {
		return find(GET_MANUFACTURER_TASK_ID_BY_TASKNAME+"'"+taskName+"'");
	}


}
