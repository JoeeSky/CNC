package org.nfmedia.crms.dao;

import java.util.List;

import org.nfmedia.crms.domain.Status;
import org.springframework.stereotype.Repository;

@Repository
public class StatusDao extends BaseDao<Status>{
	public static final String GET_STATUS_LIST="select s.name from Status s";

	public List getStatusList() {
		return find(GET_STATUS_LIST);
	}

}
