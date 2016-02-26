package org.nfmedia.crms.service;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import jxl.Workbook;

import org.apache.poi.hssf.model.Sheet;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.nfmedia.crms.dao.ProgramTaskAttachmentDao;
import org.nfmedia.crms.dao.ProgramTaskDao;
import org.nfmedia.crms.domain.ProgramTask;
import org.nfmedia.crms.domain.ProgramTaskAttachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.util.logging.Logger;

@Service
public class ProgramTaskAttachmentService {
	
	@Autowired
	private ProgramTaskAttachmentDao programTaskAttachmentDao;
	@Autowired
	private ProgramTaskDao programTaskDao;

	public void add(int programTaskId, String fileType,String uploadFileName, String taskFilePath) {
		ProgramTask programTask = programTaskDao.load(programTaskId);
		ProgramTaskAttachment programTaskAttachment = new ProgramTaskAttachment(programTask,fileType,uploadFileName,taskFilePath);
		programTaskAttachmentDao.save(programTaskAttachment);
	}

	public ProgramTaskAttachment loadprogramTaskAttachmentById(int id) {
		return programTaskAttachmentDao.load(id);
	}

	public List getFileListByTaskId(int taskId) {
		return programTaskAttachmentDao.getProgramTaskAttachmentListByTaskId(taskId);
	}
	
	

}
