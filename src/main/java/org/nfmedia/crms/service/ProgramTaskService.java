package org.nfmedia.crms.service;

import java.util.Date;
import java.util.List;


import org.nfmedia.crms.dao.ProgramTaskDao;
import org.nfmedia.crms.dao.UserDao;
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
import org.nfmedia.crms.dao.ManufacturerTaskDao;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.StatusDao;
import org.nfmedia.crms.domain.Demander;



@Service
public class ProgramTaskService {
	@Autowired
	private ProgramTaskDao programTaskDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private StatusDao statusDao;
	@Autowired
	private DemanderDao demanderDao;
	@Autowired
	private ManufacturerTaskDao manufacturerTaskDao;
	
	public List getProgramTaskList() {
		return programTaskDao.getProgramTaskList();
	}
	public List getProgramTaskListByKeyWord(String searchString) {
		return programTaskDao.getProgramTaskListByKeyWord(searchString);
	}

	public List getProgramTaskResultList() {
		return programTaskDao.getProgramTaskResultList();
	}
	
	public List getProgramTaskResultListByKeyWord(String searchString) {
		return programTaskDao.getProgramTaskResultListByKeyWord(searchString);
		
	}

	public void deleteProgramTaskCnc(Integer id) {
		ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setCnc(null);
		programTask.setStatus(null);
		programTaskDao.update(programTask);
		
	}

	public void deleteProgramTask(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		programTaskDao.remove(programTask);
	}

	public void makeSureComplete(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setStatus(statusDao.load(2));
		programTaskDao.update(programTask);
	}

	public void accept(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		//programTask.setStatus(statusDao.load(2));
		programTask.setStatus(statusDao.load(2));
		programTask.setResultStatus(statusDao.load(4));
		programTaskDao.update(programTask);	
	}

	public void refuse(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setStatus(statusDao.load(3));
		//programTask.status=statusDao.load(3);
		programTaskDao.update(programTask);	
	}
	public void add(String taskName, Integer demanderId, Integer demanderUserId, String description, String filePath) {
		//ProgramTask programTask = programTaskDao.load(1);
		Demander demander = demanderDao.load(demanderId);
		User demanderUser =  userDao.load(demanderUserId);
		ProgramTask programTask = new ProgramTask(taskName,demander, demanderUser,new Date(),new Date(),description,filePath);
		programTaskDao.save(programTask);
	}
	public List getProgramTaskIdByFilePath(String taskName) {
		return programTaskDao.getProgramTaskIdByFilePath(taskName);
	}
	public ProgramTask loadprogramTaskById(int id) {
		return programTaskDao.load(id);
	}
	

	
}
