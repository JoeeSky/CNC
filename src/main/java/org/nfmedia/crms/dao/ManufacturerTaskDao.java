package org.nfmedia.crms.dao;

import java.util.List;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.ManufacturerTask;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;


@Repository
public class ManufacturerTaskDao extends BaseDao<ManufacturerTask>{
	public static final String GET_MANUFACTURER_TASK_LIST="select m.id,m.taskName,m.modifyTime,m.demanderUser.name,m.manufacturer.name,m.status.name,m.resultStatus.name from ManufacturerTask m left join m.demanderUser left join m.manufacturer left join m.status left join m.resultStatus ";
	public static final String GET_MANUFACTURER_TASK_RESULT_LIST="select m.id,m.taskName,m.modifyTime,m.demander.name,m.manufacturerUser.name,m.status.name,m.resultStatus.name from ManufacturerTask m left join m.demander left join m.manufacturerUser left join m.status left join m.resultStatus";
	public static final String GET_MANUFACTURER_TASK_ID_BY_TASKNAME=" select m.id from ManufacturerTask m where m.taskName = ";
	public PageUtil getManufacturerTaskList(String sidx,String sord,int pageNo,int pageSize){
		return pagedQuery(GET_MANUFACTURER_TASK_LIST +" order by m."+sidx+" "+sord, pageNo, pageSize);
		//return pagedQuery(GET_MANUFACTURER_TASK_LIST+" order by m."+sidx+" "+sord, pageNo, pageSize);
	}

	public PageUtil getManufacturerTaskResultList(String sidx,String sord,int pageNo,int pageSize) {
		return pagedQuery(GET_MANUFACTURER_TASK_RESULT_LIST+" order by m."+sidx+" "+sord, pageNo, pageSize);
	}

	public PageUtil getManufacturerTaskListByKeyword(String keyword,String sidx,String sord,int pageNo,int pageSize) {
		return pagedQuery(GET_MANUFACTURER_TASK_LIST+keyword+" order by m."+sidx+" "+sord, pageNo, pageSize);
	}

	public PageUtil getManufacturerTaskResultListByKeyword(String keyword,String sidx,String sord,int pageNo,int pageSize) {
		return pagedQuery(GET_MANUFACTURER_TASK_RESULT_LIST+keyword+" order by m."+sidx+" "+sord, pageNo, pageSize);
	}

	public List getManufacturerTaskIdByTaskName(String taskName) {
		return find(GET_MANUFACTURER_TASK_ID_BY_TASKNAME+"'"+taskName+"'");
	}


}
