package org.nfmedia.crms.action;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import org.nfmedia.crms.domain.ProgramTask;
import org.nfmedia.crms.domain.ProgramTaskAttachment;
import org.nfmedia.crms.domain.Resource;
import org.nfmedia.crms.service.ProgramTaskAttachmentService;
import org.nfmedia.crms.service.ProgramTaskService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class ProgramTaskPageAction extends ActionSupport {
	private int tid;
	private ProgramTask programTask;
	private ProgramTaskService programTaskService;
	private ProgramTaskAttachment programTaskAttachment;
	private ProgramTaskAttachmentService programTaskAttachmentService;
	
	public String viewUploadProgramTaskPage() throws Exception{
		return SUCCESS;
	}
	
	public String viewProgramTaskListPage() throws Exception{
		return SUCCESS;
	}
	
	public String viewAcceptProgramTaskPage() throws Exception{
		return SUCCESS;
	}
	
	public String viewProgramTaskUpdatePage() throws Exception{
		programTask = programTaskService.loadprogramTaskById(tid);
		return SUCCESS;
	}
	
	public String viewProgramTaskInfoPage() throws Exception{
		programTask = programTaskService.loadprogramTaskById(tid);
		//programTaskAttachment = programTaskAttachmentService.loadprogramTaskAttachmentById(tid);
		return SUCCESS;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public ProgramTask getProgramTask() {
		return programTask;
	}

	public void setProgramTask(ProgramTask programTask) {
		this.programTask = programTask;
	}

	public ProgramTaskAttachment getProgramTaskAttachment() {
		return programTaskAttachment;
	}

	public void setProgramTaskAttachment(ProgramTaskAttachment programTaskAttachment) {
		this.programTaskAttachment = programTaskAttachment;
	}

	public void setProgramTaskService(ProgramTaskService programTaskService) {
		this.programTaskService = programTaskService;
	}

	public void setProgramTaskAttachmentService(
			ProgramTaskAttachmentService programTaskAttachmentService) {
		this.programTaskAttachmentService = programTaskAttachmentService;
	}
	
	

}
