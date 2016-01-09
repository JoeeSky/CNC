package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:15:24 
 */
@SuppressWarnings("rawtypes")
@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public List getAllRoles(){
		return roleDao.getAllRoles();
	}
}
