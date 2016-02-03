package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.dao.StatusDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatusService {
	@Autowired
	private StatusDao statusDao;
	public List getStatusList(){
		return statusDao.getStatusList();
	}

}
