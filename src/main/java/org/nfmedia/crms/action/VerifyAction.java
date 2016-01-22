package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.Resource;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.CncService;
import org.nfmedia.crms.service.DemanderService;
import org.nfmedia.crms.service.ManufacturerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","rawtypes","unchecked"})
public class VerifyAction extends ActionSupport{
	
	private CncService cncService;
	private DemanderService demanderService;
	private ManufacturerService manufacturerService;
	
	private boolean status;
	private String type;
	private boolean _search;
	private String searchString;
	
	
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
	
	
	
}