package org.nfmedia.crms.domain;

public class ProgramTaskAttachment {
	public int id;
	public String sn;
	public ProgramTask task;
	public String type;
	public String fileName;
	public String filePath;
	
	public ProgramTaskAttachment(ProgramTask task, String type, String fileName,
			String filePath) {
		super();
		this.task = task;
		this.type = type;
		this.fileName = fileName;
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
	public ProgramTask getTask() {
		return task;
	}
	public void setTask(ProgramTask task) {
		this.task = task;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
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

	

}