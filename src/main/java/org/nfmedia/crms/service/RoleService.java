package org.nfmedia.crms.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.json.JSONException;
import org.json.JSONObject;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.RoleFunctionDao;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.util.PageUtil;
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
	@Autowired
	private RoleFunctionDao roleFunctionDao;
	public Role getRoleByID(int id){
		return roleDao.get(id);
	}
	
	public Role loadRoleByID(int id){
		return roleDao.load(id);
	}
	
	public List getAllRoles(){
		return roleDao.getRolesAsOption();
	}
	
	public PageUtil getRolesList(String sidx,String sord,int pageNo,int pageSize,String filter){
		return roleDao.getRolesList(sidx, sord, pageNo, pageSize,filter);
	}
	
	public void addRole(Role role){
		roleDao.save(role);
	}
	
	public void updateRole(Role role){
		roleDao.update(role);
	}
	
	public void deleteRoleByID(Integer id){
		Role r=new Role();
		r.setId(id);
		roleDao.remove(r);
	}
	
	public List<Object[]> getGrantedFunction(int roleId){
		return roleFunctionDao.getGrantedFunction(roleId);
	}
	
	public void grant(int roleId,String json) throws JSONException{
		JSONObject obj= new JSONObject(json);
		Iterator iter = obj.keys();  
        while (iter.hasNext()) { 
        	String key = (String) iter.next();
        	roleFunctionDao.grant(roleId, Integer.parseInt(key), obj.getBoolean(key));
        }
	}
	
	public Set<Integer> getFunctionsByRole(int roleId){
		return roleFunctionDao.getFunctionsByRole(roleId);
	}
}
