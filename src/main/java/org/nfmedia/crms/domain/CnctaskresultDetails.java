package org.nfmedia.crms.domain;

public class CnctaskresultDetails {
	public int id;
	public String sn;
	public Cnctaskresult task;
	public String description;
	public int type;
	public String file_name;
	public String file_path;
	public boolean isdown;

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

	public Cnctaskresult getTask() {
		return task;
	}

	public void setTask(Cnctaskresult task) {
		this.task = task;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public boolean getIsdown() {
		return isdown;
	}

	public void setIsdown(boolean isdown) {
		this.isdown = isdown;
	}


}