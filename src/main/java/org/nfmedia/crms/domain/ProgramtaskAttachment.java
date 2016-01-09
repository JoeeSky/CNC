package org.nfmedia.crms.domain;

public class ProgramtaskAttachment {
	public int id;
	public String sn;
	public Programtask task;
	public int type;
	public String file_name;
	public String file_path;

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

	public Programtask getTask() {
		return task;
	}

	public void setTask(Programtask task) {
		this.task = task;
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

}