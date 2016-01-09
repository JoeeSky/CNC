package org.nfmedia.crms.domain;

import java.util.Date;

public class DemanderLog {
	public int id;
	public User user;
	public String log_desc;
	public String event_table;
	public Date log_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getLog_desc() {
		return log_desc;
	}
	public void setLog_desc(String log_desc) {
		this.log_desc = log_desc;
	}
	public String getEvent_table() {
		return event_table;
	}
	public void setEvent_table(String event_table) {
		this.event_table = event_table;
	}
	public Date getLog_time() {
		return log_time;
	}
	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}

}