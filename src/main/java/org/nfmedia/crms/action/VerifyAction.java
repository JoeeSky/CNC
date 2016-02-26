package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.Demander;
import org.nfmedia.crms.domain.Manufacturer;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.CncService;
import org.nfmedia.crms.service.DemanderService;
import org.nfmedia.crms.service.ManufacturerService;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.LoginUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","rawtypes","unchecked"})
public class VerifyAction extends ActionSupport{
	
	private Cnc cnc;
	private Demander demander;
	private Manufacturer manufacturer;
	private User user;
	
	private CncService cncService;
	private DemanderService demanderService;
	private ManufacturerService manufacturerService;
	private UserService userService;
	
	private boolean status;
	private String type;
	private boolean _search;
	private String searchString;
	private String companyType;
	private Integer verifyStatus;
	private Integer id;
	
	private String returnURL;

	
	private void sentMsg(String content) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}
	
	public String getCompanyListByCondition()throws Exception{
		List result=null;
		result=demanderService.getDemanderList();
		if(_search){
			if(type.equals("demander")){
				result=demanderService.getDemanderListByCondition(searchString);				
			}else if(type.equals("cnc")){
				result=cncService.getCncListByCondition(searchString);
			}else if(type.equals("manufacturer")){
				result=manufacturerService.getManufacturerListByCondition(searchString);
			}
		}else if(type!=null){
			if(type.equals("demander")){
				result=demanderService.getDemanderList();				
			}else if(type.equals("cnc")){
				result=cncService.getCncList();
			}else if(type.equals("manufacturer")){
				result=manufacturerService.getManufacturerList();
			}
		}
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0,size=result.size();i<size;i++){
			Object[] row = (Object[])result.get(i);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("id", row[0]); //加入id
			JSONArray jsonArray2 = new JSONArray(); //求取cell
			jsonArray2.put(row[1]);//cnc公司名
			jsonArray2.put(row[2]);//描述
			jsonArray2.put(row[4]);//地址
			jsonArray2.put(row[5]);//联系人
			jsonArray2.put(row[6]);//邮箱
			jsonArray2.put(row[7]);//手机
			if(row[9].equals(0)){
				jsonArray2.put("未审核");//审核状态
			}else if(row[9].equals(1)){
				jsonArray2.put("审核通过");
			}else{
				jsonArray2.put("审核未通过");
			}
			jsonObject2.put("cell", jsonArray2); //加入cell
			jsonArray.put(jsonObject2);	
		}
		jsonObject.put("rows", jsonArray); //加入rows
		sentMsg(jsonObject.toString());		
		
		return null;
	}
	
	public String updateCncVerifyStatus()throws Exception{
		//Map session = ActionContext.getContext().getSession();
		cnc = cncService.loadCncByID(id);
//		User user = new User();
//		
//		if(verifyStatus==1){
//			user.setAccount(cnc.getPinyin());
//			user.setPassword("123456");
//			user.setName(cnc.getName());
//			user.setStatus("U");
//			user.setCellphone(cnc.getMobile());
//			user.setEmail(cnc.getEmail());
//			Role role = new Role();
//			role.setId(1);
//			user.setRole(role);
//			user.setCompanyId(cnc.getId());
//			user.setCompanyType(cnc.getDescription());
//			userService.addUser(user);
//		}
		cncService.updateVerifyStatus(id, verifyStatus);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateDemanderVerifyStatus()throws Exception{
		//Map session = ActionContext.getContext().getSession();
//		demander = demanderService.loadDemanderByID(id);
//		User user = new User();
//		
//		if(verifyStatus==1){
//			user.setAccount(demander.getPinyin());
//			user.setPassword("123456");
//			user.setName(demander.getName());
//			user.setStatus("U");
//			user.setCellphone(demander.getMobile());
//			user.setEmail(demander.getEmail());
//			Role role = new Role();
//			role.setId(1);
//			user.setRole(role);
//			user.setCompanyId(demander.getId());
//			user.setCompanyType(demander.getDescription());
//			userService.addUser(user);
//		}
		
		demanderService.updateVerifyStatus(id, verifyStatus);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateManufacturerVerifyStatus()throws Exception{
		//Map session = ActionContext.getContext().getSession();
//		manufacturer = manufacturerService.loadManufacturerByID(id);
//		User user = new User();
//		
//		if(verifyStatus==1){
//			user.setAccount(manufacturer.getPinyin());
//			user.setPassword("123456");
//			user.setName(manufacturer.getName());
//			user.setStatus("U");
//			user.setCellphone(manufacturer.getMobile());
//			user.setEmail(manufacturer.getEmail());
//			Role role = new Role();
//			role.setId(1);
//			user.setRole(role);
//			user.setCompanyId(manufacturer.getId());
//			user.setCompanyType(manufacturer.getDescription());
//			userService.addUser(user);
//		}
		
		manufacturerService.updateVerifyStatus(id, verifyStatus);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String editCncInfoPage() throws Exception{
		//cnc = cncService.loadCncByID(id);
		user = LoginUtil.getUser();
		id=user.getCompanyId();
		cnc = cncService.loadCncByID(id);
		return SUCCESS;
	}
	
	public String editDemanderInfoPage() throws Exception{
		user = LoginUtil.getUser();
		id=user.getCompanyId();
		demander = demanderService.loadDemanderByID(id);
		return SUCCESS;
	}
	
	public String editManufacturerInfoPage() throws Exception{
		user = LoginUtil.getUser();
		id=user.getCompanyId();
		manufacturer = manufacturerService.loadManufacturerByID(id);
		return SUCCESS;
	}
	
	public String viewCncInfoPage() throws Exception{
		cnc = cncService.loadCncByID(id);
		return SUCCESS;
	}
	
	public String viewDemanderInfoPage() throws Exception{
		demander = demanderService.loadDemanderByID(id);
		return SUCCESS;
	}
	
	public String viewManufacturerInfoPage() throws Exception{
		manufacturer = manufacturerService.loadManufacturerByID(id);
		return SUCCESS;
	}
	
	public String editCncInfo() throws Exception{
		cncService.editCncInfo(cnc);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String editDemanderInfo() throws Exception{
		demanderService.editDemanderInfo(demander);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String editManufacturerInfo() throws Exception{
		manufacturerService.editManufacturerInfo(manufacturer);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String editCompany(){
		user = LoginUtil.getUser();
		String companyType = user.getCompanyType();
		if(companyType.equals("demander"))
		{
			returnURL = "demanderInfo";
		}else if(companyType.equals("cnc")){
			returnURL = "cncInfo";
		}else if(companyType.equals("manufacturer")){
			returnURL = "manufacturerInfo";
		}
		return SUCCESS;
	}
	
	public CncService getCncService() {
		return cncService;
	}

	public void setCncService(CncService cncService) {
		this.cncService = cncService;
	}


	public DemanderService getDemanderService() {
		return demanderService;
	}


	public void setDemanderService(DemanderService demanderService) {
		this.demanderService = demanderService;
	}

	public ManufacturerService getManufacturerService() {
		return manufacturerService;
	}

	public void setManufacturerService(ManufacturerService manufacturerService) {
		this.manufacturerService = manufacturerService;
	}

	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean is_search() {
		return _search;
	}

	public void set_search(boolean _search) {
		this._search = _search;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public Integer getVerifyStatus() {
		return verifyStatus;
	}

	public void setVerifyStatus(Integer verifyStatus) {
		this.verifyStatus = verifyStatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Cnc getCnc() {
		return cnc;
	}

	public void setCnc(Cnc cnc) {
		this.cnc = cnc;
	}

	public Demander getDemander() {
		return demander;
	}

	public void setDemander(Demander demander) {
		this.demander = demander;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getReturnURL() {
		return returnURL;
	}

	public void setReturnURL(String returnURL) {
		this.returnURL = returnURL;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}
