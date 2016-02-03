package org.nfmedia.crms.domain;

public class ProgramTaskResult {
	public int id;
	public String sn;
	public ProgramTask task;
	public String description;
	public int type;
	public String fileName;
	public String filePath;
	public boolean isDown;
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
	public ProgramTask getTask() {
		return task;
	}
	public void setTask(ProgramTask task) {
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public boolean getIsDown() {
		return isDown;
	}
	public void setIsDown(boolean isDown) {
		this.isDown = isDown;
	}
	
	


}