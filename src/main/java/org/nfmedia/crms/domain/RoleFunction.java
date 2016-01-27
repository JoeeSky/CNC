package org.nfmedia.crms.domain;


public class RoleFunction{

	// Fields
	private Integer id;
	private Role role;
	private Function function;
	private Boolean identify;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Function getFunction() {
		return function;
	}
	public void setFunction(Function function) {
		this.function = function;
	}
	public Boolean getIdentify() {
		return identify;
	}
	public void setIdentify(Boolean identify) {
		this.identify = identify;
	}
	
}