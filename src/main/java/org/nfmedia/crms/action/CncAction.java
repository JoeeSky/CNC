package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.Resource;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.CncService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","rawtypes","unchecked"})
public class CncAction extends ActionSupport{
	private Integer id;
	private String name;
	private String description;
	private String pinyin;
	private String address;
	private String contact;
	private String email;
	private String mobile;
	private String tel;
	private Integer verifystatus;
	private String logo;
	private String url;
	
	private Cnc cnc;
	private CncService cncService;
	
	private void sentMsg(String content) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}
	
	public String viewAddPage() throws Exception{
		return SUCCESS;
	}
	
	public String add() throws Exception{
		cncService.addCnc(cnc);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String checkName() throws Exception{
		Cnc cc = cncService.loadCncByName(name);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", cc == null);
		sentMsg(jsonObject.toString());
		return null;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getVerifystatus() {
		return verifystatus;
	}

	public void setVerifystatus(Integer verifystatus) {
		this.verifystatus = verifystatus;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Cnc getCnc() {
		return cnc;
	}

	public void setCnc(Cnc cnc) {
		this.cnc = cnc;
	}

	public CncService getCncService() {
		return cncService;
	}

	public void setCncService(CncService cncService) {
		this.cncService = cncService;
	}
	
	
}
