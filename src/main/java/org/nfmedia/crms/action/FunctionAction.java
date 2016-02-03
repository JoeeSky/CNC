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
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.FunctionService;
import org.nfmedia.crms.util.PageToJson;
import org.nfmedia.crms.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class FunctionAction extends ActionSupport {

	private Integer tid;
	private Function function;
	
	private int page;
/*	private String sidx;
	private String sord;*/
	private int rows;
	
	/*private boolean _search;
	private String searchField;
	private String searchString;
	private String searchOper;*/
	
	private String id;
	
	private FunctionService functionService;
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
		function = functionService.loadFunctionByID(tid);
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
		result = functionService.getModelsList(page, rows, "");
		/*if(_search == false){
			result = roleService.getRolesList(sidx, sord, page, rows, "");
		}else{
			result = roleService.getRolesList(sidx, sord, page, rows, searchString);
		}*/
		
		//把数据封装成jqgrid需要的格式
		JSONArray rows = new JSONArray();
		Map<String,String> funcStatusDict=dictService.getDictsMap("funcStatus");
		List data = result.getResult();
		for(int i=0,size=data.size();i<size;i++){
			Object[] obj = (Object[])data.get(i);		
			JSONObject row = new JSONObject();
			row.put("id", obj[0]); //加入id
			
			JSONArray cell = new JSONArray(); //求取cell
			//idCell用于在账号一列显示用户信息页(info)的链接
			JSONObject idCell = new JSONObject();
			idCell.put("id", obj[0]);
			idCell.put("name", obj[1]);
			cell.put(idCell); //模块名
			cell.put(obj[2]); //功能列表
			cell.put(funcStatusDict.get(obj[3].toString())); //已启用
			cell.put(obj[4]); //排序
			row.put("cell", cell); //加入cell
			
			rows.put(row);		
		}
		
		JSONObject json = PageToJson.toJsonWithoutData(result); //产生行数等信息
		json.put("rows", rows); //加入rows
		sentMsg(json.toString());
		return null;
	}
	
	/*public String addInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Page> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Page resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"添加用户","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("enable", dictService.getDictsByWordGroup("enable"));
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
		TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Page> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Page resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"用户列表","userManage/userList"});
		}
		breadCrumb.add(new Object[]{"修改用户信息","javascript:void(0);"});
		ctx.put("breadCrumb",breadCrumb);
		role = roleService.loadRoleByID(tid);
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("enable", dictService.getDictsByWordGroup("enable"));
		return SUCCESS;
	}
	
	public String update() throws Exception{
		roleService.updateRole(role);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}*/
	
	
	
	public String edit() throws Exception{
		String[] ids = id.split(",");
		for(int i=0,size=ids.length;i<size;i++){
			Integer id = new Integer(ids[i]);
			functionService.deleteFunctionByID(id);	
		}
		return null;
	}
	


	public String info() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		function = functionService.loadFunctionByID(tid);
		ctx.put("status", dictService.getDictByGroupAndName("funcStatus", function.getStatus()) );
		return SUCCESS;
	}

	


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
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


	public Function getFunction() {
		return function;
	}

	public void setFunction(Function function) {
		this.function = function;
	}

	public FunctionService getFunctionService() {
		return functionService;
	}

	public void setFunctionService(FunctionService functionService) {
		this.functionService = functionService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	
	
}
