 package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.dao.DepartmentDao;
import org.nfmedia.crms.domain.Department;
//import org.nfmedia.crms.domain.PersonLevel;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午4:05:41 
 */
@SuppressWarnings("rawtypes")
@Service
public class DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;
	
	public List getAllDeparments(){
		return departmentDao.getAllDepartments();
	}
	
	public PageUtil getDepartmentList(String sidx,String sord,int pageNo,int pageSize){
		return departmentDao.getDepartmentList( sidx, sord, pageNo, pageSize);
	}
	
	public void deleteDepartmentByID(Long id){
		Department department = departmentDao.load(id);
		departmentDao.remove(department);
	}
	
	public List getSelectName(){
		return departmentDao.getSelectName();
	}
	
	public List getSelectParentDepartment(){
		return departmentDao.getSelectParentDepartment();
	}
	
	public void updateDepartment(Long id,Long parentDepartment,String name){
		Department department = departmentDao.load(id);
		if(parentDepartment!=null){
			department.setParentDepartment(departmentDao.load(parentDepartment));
		}else{
			department.setParentDepartment(null);
		}
		department.setName(name);
		departmentDao.update(department);
	}
	
	public void addDepartment(Long parentDepartment,String name){
		Department department = new Department();
		if(parentDepartment!=null){
			department.setParentDepartment(departmentDao.load(parentDepartment));
		}else{
			department.setParentDepartment(null);
		}
		department.setName(name);
		departmentDao.save(department);
	}
}
