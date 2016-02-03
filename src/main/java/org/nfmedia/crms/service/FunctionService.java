package org.nfmedia.crms.service;

import java.util.List;
import java.util.Map;

import org.nfmedia.crms.dao.FunctionDao;
import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:15:24 
 */
@SuppressWarnings("rawtypes")
@Service
public class FunctionService {

	@Autowired
	private FunctionDao functionDao;
	
	public Function loadFunctionByID(int id){
		return functionDao.load(id);
	}
	
	/*public List getAllRoles(){
		return roleDao.getRolesAsOption();
	}*/
	
	public PageUtil getModelsList(int pageNo,int pageSize,String filter){
		return functionDao.getModelsList(pageNo, pageSize, filter);
	}
	
	public List<Function> getFunctionPath(int functionId){
		return 	functionDao.getFunctionPath(functionId);
	}
	
	public List<Function> getAllModels(){
		return functionDao.getAllModels();
	}
	
	public List<Object[]> getFunctionMap(){
		return functionDao.getFunctionMap();
	}
	
	public Map<Integer,Function> getAllFunctions(){
		return functionDao.getAllFunctions();
	}
	
	/*public List<Function> getFunctionByModelId(int modelId){
		return functionDao.getFunctionByModelId(modelId);
	}*/
	
	/*public void addRole(Role role){
		roleDao.save(role);
	}
	
	public void updateRole(Role role){
		roleDao.update(role);
	}*/
	
	public void deleteFunctionByID(Integer id){
		Function func=new Function();
		func.setId(id);
		functionDao.remove(func);
	}
}
