package org.nfmedia.crms.service;

import java.util.Date;
import java.util.List;


import org.nfmedia.crms.dao.ProgramTaskDao;
import org.nfmedia.crms.dao.UserDao;
import org.nfmedia.crms.domain.ManufacturerTask;
import org.nfmedia.crms.domain.ProgramTaskAttachment;
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
import org.nfmedia.crms.dao.CncDao;
import org.nfmedia.crms.dao.DemanderDao;
import org.nfmedia.crms.dao.ManufacturerTaskDao;
import org.nfmedia.crms.dao.ProgramTaskAttachmentDao;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.StatusDao;
import org.nfmedia.crms.domain.Demander;
import org.nfmedia.crms.util.PageUtil;



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
	@Autowired
	private CncDao cncDao;
	@Autowired
	private ProgramTaskAttachmentDao programTaskAttachmentDao;
	
	public PageUtil getProgramTaskList(String sidx, String sord, int page, int rows) {
		return programTaskDao.getProgramTaskList(sidx, sord, page,rows);
	}
	public PageUtil getProgramTaskListByKeyWord(String keyword,String sidx, String sord, int page, int rows) {
		return programTaskDao.getProgramTaskListByKeyWord(keyword,sidx, sord, page, rows);
	}

	public PageUtil getProgramTaskResultList(String sidx, String sord, int page, int rows) {
		return programTaskDao.getProgramTaskResultList(sidx, sord, page,rows);
	}
	
	public PageUtil getProgramTaskResultListByKeyWord(String keyword,String sidx, String sord, int page, int rows) {
		return programTaskDao.getProgramTaskResultListByKeyWord(keyword,sidx, sord, page, rows);
		
	}

	public void deleteProgramTaskCnc(Integer id) {
	//	ManufacturerTask manufacturerTask = manufacturerTaskDao.load(id);
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setCnc(null);
		programTask.setStatus(null);
		programTaskDao.update(programTask);
		
	}

	public void deleteProgramTask(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		List programTaskAttachmentList = programTaskAttachmentDao.getProgramTaskAttachmentListByTaskId(id);
		
		for( int i=0;i< programTaskAttachmentList.size();i++){
			Object[] programTaskAttachment = (Object[]) programTaskAttachmentList.get(i);
			programTaskAttachmentDao.remove(programTaskAttachmentDao.load((Integer)programTaskAttachment[0]));
		}
		/*ProgramTaskAttachment programTaskAttachment = programTaskAttachmentDao.load(19);
		List<ProgramTaskAttachment> programTaskAttachmentList = programTaskAttachmentDao.loadAll();
		for(int i=0;i< programTaskAttachmentList.size();i++){
			int n = programTaskAttachmentList.get(i).getTask().getId();
			if(programTaskAttachmentList.get(i).getTask().getId()==id){
				programTaskAttachmentDao.remove(programTaskAttachmentList.get(i));
			}
		}*/
		programTaskDao.remove(programTask);
	}

	public void makeSureComplete(int id) {
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setResultStatus(statusDao.load(5));
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
	public void SelectCnc(int id, int cncId) {
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setCnc(cncDao.load(cncId));
		programTask.setStatus(statusDao.load(1));
		programTaskDao.save(programTask);
	}
	public void updataProgramTask(int id, String description) {
		ProgramTask programTask=programTaskDao.load(id);
		programTask.setDescription(description);
		programTaskDao.save(programTask);
	}
	

	
}
