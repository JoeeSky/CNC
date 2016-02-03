package org.nfmedia.crms.domain;

import java.util.Date;

public class ManufacturerTask {
	public int id;
	public String sn;
	public String taskName;
	public Demander demander;
	public User demanderUser;
	public Date issueTime;
	public Date modifyTime;
	public String description;
	public Manufacturer manufacturer;
	public User manufacturerUser;
	public Status status;
	public Status resultStatus;
	public String filePath;
	
	public ManufacturerTask() {
		super();
	}
	
	public ManufacturerTask(String taskName, Demander demander,
			User demanderUser, Date issueTime, Date modifyTime,
			String description, String filePath) {
		super();
		this.taskName = taskName;
		this.demander = demander;
		this.demanderUser = demanderUser;
		this.issueTime = issueTime;
		this.modifyTime = modifyTime;
		this.description = description;
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
	public Manufacturer getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}
	public User getManufacturerUser() {
		return manufacturerUser;
	}
	public void setManufacturerUser(User manufacturerUser) {
		this.manufacturerUser = manufacturerUser;
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