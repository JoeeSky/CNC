package org.nfmedia.crms.domain;

import java.util.Date;


@SuppressWarnings({ "serial" })
public class ProgramTask {
	public int id;
	public String sn;
	public String taskName;//任务名；
	public Demander demander;//任务发布公司；
	public User demanderUser;//任务发布公司发布人；
	public Date issueTime;//任务发布时间；
	public Date modifyTime;//任务最新修改时间；
	public String description;//任务描述
	public Date resultUploadTime;//结果上传时间；
	public Date resultModifyTime;//结果最新修改时间；
	public String resultDescription;//结果描述；
	public Cnc cnc;
	public User cncUser;
	public Status status;//任务状态；
	public Status resultStatus;//任务结果状态；
	public String filePath;//文件夹位置
	
	
	
	
	public ProgramTask() {
		super();
	}


	public ProgramTask(String taskName, Demander demander, User demanderUser,Date issueTime, Date modifyTime, String description, String filePath) {
		super();
		this.taskName = taskName;
		this.demander = demander;
		this.demanderUser = demanderUser;
		this.issueTime = issueTime;
		this.modifyTime = modifyTime;
		this.description = description;
		this.filePath = filePath;
	}
	
	
	public ProgramTask(int id, String sn, String taskName, Demander demander,
			User demanderUser, Date issueTime, Date modifyTime,
			String description, Date resultUploadTime, Date resultModifyTime,
			String resultDescription, Cnc cnc, User cncUser, Status status,
			Status resultStatus, String filePath) {
		super();
		this.id = id;
		this.sn = sn;
		this.taskName = taskName;
		this.demander = demander;
		this.demanderUser = demanderUser;
		this.issueTime = issueTime;
		this.modifyTime = modifyTime;
		this.description = description;
		this.resultUploadTime = resultUploadTime;
		this.resultModifyTime = resultModifyTime;
		this.resultDescription = resultDescription;
		this.cnc = cnc;
		this.cncUser = cncUser;
		this.status = status;
		this.resultStatus = resultStatus;
		this.filePath = filePath;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public Demander getDemander() {
		return demander;
	}
	public void setDemander(Demander demander) {
		this.demander = demander;
	}
	public User getDemanderUser() {
		return demanderUser;
	}
	public void setDemanderUser(User demanderUser) {
		this.demanderUser = demanderUser;
	}
	public Date getIssueTime() {
		return issueTime;
	}
	public void setIssueTime(Date issueTime) {
		this.issueTime = issueTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getResultUploadTime() {
		return resultUploadTime;
	}
	public void setResultUploadTime(Date resultUploadTime) {
		this.resultUploadTime = resultUploadTime;
	}
	public Date getResultModifyTime() {
		return resultModifyTime;
	}
	public void setResultModifyTime(Date resultModifyTime) {
		this.resultModifyTime = resultModifyTime;
	}
	public String getResultDescription() {
		return resultDescription;
	}
	public void setResultDescription(String resultDescription) {
		this.resultDescription = resultDescription;
	}
	public Cnc getCnc() {
		return cnc;
	}
	public void setCnc(Cnc cnc) {
		this.cnc = cnc;
	}
	public User getCncUser() {
		return cncUser;
	}
	public void setCncUser(User cncUser) {
		this.cncUser = cncUser;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Status getResultStatus() {
		return resultStatus;
	}
	public void setResultStatus(Status resultStatus) {
		this.resultStatus = resultStatus;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	
	
	



}