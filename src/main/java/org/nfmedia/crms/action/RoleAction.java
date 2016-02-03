package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.RoleService;
import org.nfmedia.crms.util.PageToJson;
import org.nfmedia.crms.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class RoleAction extends ActionSupport {

	private Integer tid;
	private Role role;
	
	private int page;
	private String sidx;
	private String sord;
	private int rows;
	private String grantJson;
	
	/*private boolean _search;
	private String searchField;
	private String searchString;
	private String searchOper;*/
	
	private String id;
	
	private RoleService roleService;
	private DictService dictService;
	
	private void sentMsg(String content) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}
	
	/**
	 * 显示用户详细信息
	 */
	@Override
	public String execute() throws Exception {
		role = roleService.loadRoleByID(tid);
		return SUCCESS;
	}
	
	/**
	 * 显示个人中心页面 
	 * @author: hongwei
	 * @CreateDate: 2014-12-2 上午12:45:50 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		return SUCCESS;
	}
	
	public String listAjax() throws Exception{
		PageUtil result = null;
		result = roleService.getRolesList(sidx, sord, page, rows, "");
		/*if(_search == false){
			result = roleService.getRolesList(sidx, sord, page, rows, "");
		}else{
			result = roleService.getRolesList(sidx, sord, page, rows, searchString);
		}*/
		
		//把数据封装成jqgrid需要的格式
		JSONArray rows = new JSONArray();
		List data = result.getResult();
		Map<String,String> companyTypeDict=dictService.getDictsMap("companyType");
		Map<String,String> yesNoDict=dictService.getDictsMap("yesNo");
		for(int i=0,size=data.size();i<size;i++){
			Object[] obj = (Object[])data.get(i);		
			JSONObject row = new JSONObject();
			row.put("id", obj[0]); //加入id
			
			JSONArray cell = new JSONArray(); //求取cell
			//idCell用于在账号一列显示用户信息页(info)的链接
			JSONObject idCell = new JSONObject();
			idCell.put("id", obj[0]);
			idCell.put("name", obj[1]);
			cell.put(idCell); //角色名
			cell.put(companyTypeDict.get(obj[2].toString())); //公司类型
			cell.put(yesNoDict.get(obj[3].toString())); //已启用
			cell.put(obj[4]); //排序
			row.put("cell", cell); //加入cell
			
			rows.put(row);		
		}
		
		JSONObject json = PageToJson.toJsonWithoutData(result); //产生行数等信息
		json.put("rows", rows); //加入rows
		sentMsg(json.toString());
		return null;
	}
	
	public String addInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("enable", dictService.getDictsByWordGroup("yesNo"));
		return SUCCESS;
	}
	
	public String add() throws Exception{
		roleService.addRole(role);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		
		role = roleService.loadRoleByID(tid);
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("enable", dictService.getDictsByWordGroup("yesNo"));
		return SUCCESS;
	}
	
	public String update() throws Exception{
		roleService.updateRole(role);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	
	
	public String edit() throws Exception{
		String[] ids = id.split(",");
		for(int i=0,size=ids.length;i<size;i++){
			Integer id = new Integer(ids[i]);
			roleService.deleteRoleByID(id);
		}
		return null;
	}
	


	public String info() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		role = roleService.loadRoleByID(tid);
		ctx.put("companyType", dictService.getDictByGroupAndName("companyType", role.getCompanyType()) );
		return SUCCESS;
	}
	
	public String grantInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		
		List<Object[]> result=roleService.getGrantedFunction(tid);
		JSONObject jsonObject = new JSONObject();
		for(Object[] obj : result)
			for(Function func : (List<Function>)obj[1])
				if(!func.getStatus().equals("N")){
					jsonObject.put(func.getId().toString(), func.getStatus().equals("U"));
				}
		grantJson=jsonObject.toString();
		ctx.put("funcs",result);
		return SUCCESS;
	}
	
	public String grant() throws Exception{
		roleService.grant(tid,grantJson);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
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

	/*public boolean is_search() {
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
	}*/

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrantJson() {
		return grantJson;
	}

	public void setGrantJson(String grantJson) {
		this.grantJson = grantJson;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	
	
}
