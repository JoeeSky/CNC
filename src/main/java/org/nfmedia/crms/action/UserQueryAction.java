package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.PageUtil;
import org.nfmedia.crms.util.PageToJson;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 上午10:30:22 
 */
@SuppressWarnings({"serial","rawtypes"})
public class UserQueryAction extends ActionSupport {

	private int page;
	private String sidx;
	private String sord;
	private int rows;
	
	private boolean _search;
	private String searchField;
	private String searchString;
	private String searchOper;
	
	private UserService userService;
	
	private void sentMsg(String content) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}
	
	//@Override
	public String execute() throws Exception {
		PageUtil result = null;
		if(_search == false){
			result = userService.getUsersList(sidx, sord, page, rows);
		}else{
			result = userService.getUsersListByKeyword(searchString, sidx, sord, page, rows);
		}
		
		JSONObject jsonObject = PageToJson.toJsonWithoutData(result);
		JSONArray jsonArray = new JSONArray();
		List data = result.getResult();
		for(int i=0,size=data.size();i<size;i++){
			Object[] row = (Object[])data.get(i);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("id", row[0]); //加入id
			
			JSONArray jsonArray2 = new JSONArray(); //求取cell
			
			JSONObject jsonObject5 = new JSONObject();
			jsonObject5.put("id", row[0]);
			jsonObject5.put("account", row[1]);
			jsonArray2.put(jsonObject5); //账号
			jsonArray2.put(row[2]); //姓名
			jsonArray2.put(row[3]); //部门
			jsonArray2.put(row[4]); //角色
			
			jsonObject2.put("cell", jsonArray2); //加入cell
			
			jsonArray.put(jsonObject2);
			
		}
		jsonObject.put("rows", jsonArray); //加入rows
		
		sentMsg(jsonObject.toString());
		return null;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public boolean is_search() {
		return _search;
	}

	public void set_search(boolean _search) {
		this._search = _search;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getSearchOper() {
		return searchOper;
	}

	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	
	
}
