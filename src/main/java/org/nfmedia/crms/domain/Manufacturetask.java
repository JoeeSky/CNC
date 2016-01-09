package org.nfmedia.crms.domain;

import java.util.Date;

public class Manufacturetask {
	public int id;
	public String sn;
	public String task_name;
	public Demander demander;
	public User demander_user;
	public Date issue_time;
	public Date modify_time;
	public String description;
	public Manufacturer manufacturer;
	public int status;

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

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public Demander getDemander() {
		return demander;
	}

	public void setDemander(Demander demander) {
		this.demander = demander;
	}

	public User getDemander_user() {
		return demander_user;
	}

	public void setDemander_user(User demander_user) {
		this.demander_user = demander_user;
	}

	public Date getIssue_time() {
		return issue_time;
	}

	public void setIssue_time(Date issue_time) {
		this.issue_time = issue_time;
	}

	public Date getModify_time() {
		return modify_time;
	}

	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


}