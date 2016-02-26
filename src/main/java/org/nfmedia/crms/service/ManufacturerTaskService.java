package org.nfmedia.crms.service;

import java.util.Date;
import java.util.List;



import org.nfmedia.crms.dao.ProgramTaskDao;
import org.nfmedia.crms.dao.UserDao;
import org.nfmedia.crms.domain.Manufacturer;
import org.nfmedia.crms.domain.ManufacturerTask;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.ProgramTask;
import org.nfmedia.crms.domain.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import jxl.Workbook;

import org.apache.poi.hssf.model.Sheet;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.dao.DemanderDao;
import org.nfmedia.crms.dao.ManufacturerDao;
import org.nfmedia.crms.dao.ManufacturerTaskDao;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.StatusDao;
import org.nfmedia.crms.domain.Demander;
import org.nfmedia.crms.util.PageUtil;


@Service
public class ManufacturerTaskService {
	@Autowired
	private ManufacturerTaskDao manufacturerTaskDao; 
	@Autowired
	private ProgramTaskDao programTaskDao; 
	@Autowired
	private StatusDao statusDao;
	@Autowired
	private DemanderDao demanderDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ManufacturerDao manufacturerDao;
	
	public PageUtil getManufacturerTaskList(String sidx, String sord, int page, int rows) {
		return manufacturerTaskDao.getManufacturerTaskList(sidx, sord, page,rows);		
	}
	public PageUtil getManufacturerTaskResultList(String sidx, String sord, int page, int rows) {
		return manufacturerTaskDao.getManufacturerTaskResultList(sidx, sord, page,rows);
	}
	public PageUtil getManufacturerTaskListByKeyword(String keyword,String sidx, String sord, int page, int rows) {
		return manufacturerTaskDao.getManufacturerTaskListByKeyword(keyword,sidx, sord, page, rows);
	}
	public PageUtil getManufacturerTaskResultListByKeyword(String keyword,String sidx, String sord, int page, int rows) {
		return manufacturerTaskDao.getManufacturerTaskResultListByKeyword(keyword,sidx, sord, page, rows);
	}
	public void deleteProgramTaskManufacturer(int id) {
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		manufacturerTask.setManufacturer(null);
		manufacturerTask.setStatus(null);
		manufacturerTaskDao.update(manufacturerTask);
	}
	public void delectManufacturerTask(int tid) {
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(tid);
		manufacturerTaskDao.remove(manufacturerTask);
	}
	public void manufacturerTaskComplete(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		//manufacturerTask.resultStatus=statusDao.load(5);
		manufacturerTask.setResultStatus(statusDao.load(5));
		manufacturerTaskDao.update(manufacturerTask);	
	}
	public void acceptManufacturerTask(int id) {
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		//manufacturerTask.status=statusDao.load(2);
		manufacturerTask.setStatus(statusDao.load(2));
		manufacturerTask.setResultStatus(statusDao.load(4));
		manufacturerTaskDao.update(manufacturerTask);
	}
	public void refuseManufacturerTask(int id) {
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		//manufacturerTask.status=statusDao.load(3);
		manufacturerTask.setStatus(statusDao.load(3));
		manufacturerTaskDao.update(manufacturerTask);
	}
	public void add(String taskName, Integer demanderId,
			Integer demanderUserId, String description, String filePath) {
		Demander demander = demanderDao.load(demanderId);
		User demanderUser =  userDao.load(demanderUserId);
		ManufacturerTask manufacturerTask = new ManufacturerTask(taskName,demander, demanderUser,new Date(),new Date(),description,filePath);
		manufacturerTaskDao.save(manufacturerTask);
		
	}
	public List getManufacturerTaskIdByTaskName(String taskName) {
		return manufacturerTaskDao.getManufacturerTaskIdByTaskName(taskName);
	}
	public void SelectManufacturer(int manufacturerTaskId, int manufacturerId) {
		ManufacturerTask manufacturerTask=manufacturerTaskDao.load(manufacturerTaskId);
		Manufacturer manufacturer = manufacturerDao.load(manufacturerId);
		manufacturerTask.setManufacturer(manufacturer);
		manufacturerTask.setStatus(statusDao.load(1));
		manufacturerTaskDao.update(manufacturerTask);
		
	}

}
