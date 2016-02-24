package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.domain.Menu;
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.FunctionService;
import org.nfmedia.crms.service.MenuService;
import org.nfmedia.crms.util.PageToJson;
import org.nfmedia.crms.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class MenuAction extends ActionSupport {

	private Integer tid;
	private Menu menu;
	
	private int page;
	private String sidx;
	private String sord;
	private int rows;
	
	private boolean _search;
	private String searchField;
	private String searchString;
	private String searchOper;
	
	private String id;
	
	private MenuService menuService;
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
		menu = menuService.loadMenuByID(tid);
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
		if(_search == false){
			result = menuService.getMenusList(page, rows, "");
		}else{
			result = menuService.getMenusList(page, rows, searchString);
		}
		
		//把数据封装成jqgrid需要的格式
		JSONArray rows = new JSONArray();
		List data = result.getResult();
		for(int i=0,size=data.size();i<size;i++){		
			Object[] obj = (Object[])data.get(i);	
			
			Integer curId= (Integer) obj[0];
			if(curId==0) continue;
			
			JSONObject row = new JSONObject();
			row.put("id", obj[0]); //加入id
			
			JSONArray cell = new JSONArray(); //求取cell
			//idCell用于在账号一列显示用户信息页(info)的链接
			JSONObject idCell = new JSONObject();
			idCell.put("id", obj[0]);
			idCell.put("title", obj[2]);
			cell.put(idCell); //菜单标题
			cell.put(obj[1]); //parentId
			cell.put(obj[3]); //排序值
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
		
		//功能树，用于在在初始化时生成第一级下拉列表
		List<Object[]> map= functionService.getFunctionMap(); 
		ctx.put("model",map);
		
		//生成功能树的json版，存在js中，用于动态更改二级下拉列表
		JSONObject optionJson= new JSONObject();
		for(Object[] model : map){
			JSONArray ls= new JSONArray();
			for(Function func : (List<Function>) model[1]){
				JSONObject f= new JSONObject();
				f.put(func.getId().toString(), func.getName());
				ls.put(f);
			}
			Function modelP=(Function)model[0];
			optionJson.put(modelP.getName(), ls);
		}
		ctx.put("optionJson", optionJson.toString());
		
		
		ctx.put("topMenus", menuService.getTopMenus());
		return SUCCESS;
	}
	
	public String add() throws Exception{
		menuService.addMenu(menu);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		jsonObject.put("id", menu.getId());
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String copy() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		
		menu = menuService.loadMenuByID(tid);
		
		//功能树，用于在在初始化时生成第一级下拉列表
		List<Object[]> map= functionService.getFunctionMap(); 
		ctx.put("model",map);
		
		//生成功能树的json版，存在js中，用于动态更改二级下拉列表
		JSONObject optionJson= new JSONObject();
		for(Object[] model : map){
			JSONArray ls= new JSONArray();
			for(Function func : (List<Function>) model[1]){
				JSONObject f= new JSONObject();
				f.put(func.getId().toString(), func.getName());
				ls.put(f);
			}
			Function modelP=(Function)model[0];
			optionJson.put(modelP.getName(), ls);
		}
		ctx.put("optionJson", optionJson.toString());
		
		//初始化第一级菜单的初始化选中项
		String modelName=functionService.getFunctionPath(menu.getFunctionId()).get(0).getName();
		ctx.put("modelName", modelName);
		
		//用于在在初始化时生成第二级下拉列表
		List<Function> funcs=null;
		for(Object[] obj : map){
			Function modelP=(Function)obj[0];
			if(modelP.getName().equals(modelName)){
				funcs= (List<Function>) obj[1];
				break;
			}
		}
		ctx.put("funcs", funcs);
		
		
		ctx.put("topMenus", menuService.getTopMenus());
		return SUCCESS;
	}
	
	public String updateInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		
		menu = menuService.loadMenuByID(tid);
		
		//功能树，用于在在初始化时生成第一级下拉列表
		List<Object[]> map= functionService.getFunctionMap(); 
		ctx.put("model",map);
		
		//生成功能树的json版，存在js中，用于动态更改二级下拉列表
		JSONObject optionJson= new JSONObject();
		for(Object[] model : map){
			JSONArray ls= new JSONArray();
			for(Function func : (List<Function>) model[1]){
				JSONObject f= new JSONObject();
				f.put(func.getId().toString(), func.getName());
				ls.put(f);
			}
			Function modelP=(Function)model[0];
			optionJson.put(modelP.getName(), ls);
		}
		ctx.put("optionJson", optionJson.toString());
		
		//初始化第一级菜单的初始化选中项
		String modelName=functionService.getFunctionPath(menu.getFunctionId()).get(0).getName();
		ctx.put("modelName", modelName);
		
		//用于在在初始化时生成第二级下拉列表
		List<Function> funcs=null;
		for(Object[] obj : map){
			Function modelP=(Function)obj[0];
			if(modelP.getName().equals(modelName)){
				funcs= (List<Function>) obj[1];
				break;
			}
		}
		ctx.put("funcs", funcs);
		
		
		ctx.put("topMenus", menuService.getTopMenus());
		return SUCCESS;
	}
	
	public String update() throws Exception{
		menuService.updateMenu(menu);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		jsonObject.put("id", menu.getId());
		sentMsg(jsonObject.toString());
		return null;
	}
	
	
	public String edit() throws Exception{
		String[] ids = id.split(",");
		for(int i=0,size=ids.length;i<size;i++){
			Integer id = new Integer(ids[i]);
			menuService.deleteMenuByID(id);
		}
		return null;
	}
	


	public String info() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		menu = menuService.loadMenuByID(tid);
		Boolean isTop=menu.getParentId()==0;
		ctx.put("isTop", dictService.getDictByGroupAndName("yesNo",isTop.toString()));
		
		Menu parent= menuService.loadMenuByID(menu.getParentId());
		ctx.put("parent", parent.getTitle());
		
		List<Function> funcPath= functionService.getFunctionPath(menu.getFunctionId());
		ctx.put("functionPath", funcPath.get(0).getName()+" / "+funcPath.get(1).getName());
		
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

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setFunctionService(FunctionService functionService) {
		this.functionService = functionService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	
	
}
