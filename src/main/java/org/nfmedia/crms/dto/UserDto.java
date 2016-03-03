package org.nfmedia.crms.dto;

import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.domain.User;

public class UserDto{

	private Integer id;
	private String account;
	private String password;
	private String name;
	private String status;
	private String cellphone;
	private String email;
    private Integer roleId;
	private Integer companyId;
	private String companyType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCompanyType() {
		return companyType;
	}
	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	public void fromUser(User user){
		this.id = user.getId();
		this.account = user.getAccount();
		this.password = user.getPassword();
		this.name = user.getName();
		this.status = user.getStatus();
		this.cellphone = user.getCellphone();
		this.email = user.getEmail();
		this.roleId = user.getRole().getId();
		this.companyId = user.getCompanyId();
		this.companyType = user.getCompanyType();
	}
	
	public User toUser(){
		User user = new User();
		user.setId(id);
		user.setAccount(account);
		user.setPassword(password);
		user.setName(name);
		user.setStatus(status);
		user.setCellphone(cellphone);
		user.setEmail(email);
		Role role=new Role();
		role.setId(roleId);
		user.setRole(role);
		user.setCompanyId(companyId);
		user.setCompanyType(companyType);
		return user;
	}
}