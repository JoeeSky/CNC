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
import org.nfmedia.crms.dao.ManufacturerTaskDao;
import org.nfmedia.crms.dao.ManufacturerTaskDetailsDao;
import org.nfmedia.crms.dao.ProgramTaskAttachmentDao;
import org.nfmedia.crms.dao.ProgramTaskDao;
import org.nfmedia.crms.domain.ManufacturerTask;
import org.nfmedia.crms.domain.ManufacturerTaskDetails;
import org.nfmedia.crms.domain.ProgramTask;
import org.nfmedia.crms.domain.ProgramTaskAttachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.util.logging.Logger;

@Service
public class ManufacturerTaskDetailsService {
	@Autowired
	private ManufacturerTaskDetailsDao manufacturerTaskDetailsDao;
	@Autowired
	private ManufacturerTaskDao manufacturerTaskDao;

	public void add(int manufacturerTaskId, String fileType,String uploadFileName, String taskFilePath) {
		ManufacturerTask manufaturerTask = manufacturerTaskDao.load(manufacturerTaskId);
		ManufacturerTaskDetails manufacturerTaskDetails = new ManufacturerTaskDetails(manufaturerTask,fileType,uploadFileName,taskFilePath);
		manufacturerTaskDetailsDao.save(manufacturerTaskDetails);
	}
}
