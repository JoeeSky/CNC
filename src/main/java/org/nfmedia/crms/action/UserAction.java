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
import org.json.JSONException;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.Page;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.RoleService;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.PageToJson;
import org.nfmedia.crms.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class UserAction extends ActionSupport {
	
	//tid是get参数中的id，由于jqgrid默认的删除功能占用id的名字，所以要改名为tid
	private Integer tid;
	private User user;
	
	private String account;
	private String oldPassword;
	private String newPassword;
	private String repeatedNewPassword;
	
	private int page;
	private String sidx;
	private String sord;
	private int rows;
	
	private boolean _search;
	private String searchField;
	private String searchString;
	private String searchOper;
	
	private String id;
	
	private UserService userService;
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
		user = userService.loadUserByID(tid);
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
		ActionContext ctx = ActionContext.getContext();
		/*TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Page> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Page resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"用户列表","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);*/
		
		PageUtil result = null;
		if(_search == false){
			result = userService.getUsersList(sidx, sord, page, rows, "");
		}else{
			result = userService.getUsersList(sidx, sord, page, rows, searchString);
		}
		
		//把数据封装成jqgrid需要的格式
		JSONArray rows = new JSONArray();
		List data = result.getResult();
		for(int i=0,size=data.size();i<size;i++){
			Object[] obj = (Object[])data.get(i);		
			JSONObject row = new JSONObject();
			row.put("id", obj[0]); //加入id
			
			JSONArray cell = new JSONArray(); //求取cell
			//idCell用于在账号一列显示用户信息页(info)的链接
			JSONObject idCell = new JSONObject();
			idCell.put("id", obj[0]);
			idCell.put("account", obj[1]);
			cell.put(idCell); //账号
			cell.put(obj[2]); //姓名
			cell.put(obj[3]); //角色			
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
		/*TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
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
		ctx.put("breadCrumb",breadCrumb);*/
		
		ctx.put("roles", roleService.getAllRoles());
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("userStatus", dictService.getDictsByWordGroup("userStatus"));
		return SUCCESS;
	}
	
	public String add() throws Exception{
		userService.addUser(user);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateInput() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		/*TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
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
		ctx.put("breadCrumb",breadCrumb);*/
		user = userService.loadUserByID(tid);
		ctx.put("roles", roleService.getAllRoles());
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("userStatus", dictService.getDictsByWordGroup("userStatus"));
		return SUCCESS;
	}
	
	public String update() throws Exception{
		userService.updateUser(user);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateInitPassword()throws Exception{
		Map session = ActionContext.getContext().getSession();
		userService.updateInitPassword((Integer) session.get(CommonConstant.SESSION_ID), newPassword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String edit() throws Exception{
		String[] ids = id.split(",");
		for(int i=0,size=ids.length;i<size;i++){
			Integer id = new Integer(ids[i]);
			userService.deleteUserByID(id);
		}
		return null;
	}
	
	/*public String updateMyInfo() throws Exception{
		JSONObject jsonObject = new JSONObject();
		Map session = ActionContext.getContext().getSession();
		Integer userId = (Integer) session.get(CommonConstant.SESSION_ID);
		if(userId == null){
			jsonObject.put("state", false);
			jsonObject.put("info", "保存失败，您尚未登陆！");
		}else{
			user.setId(userId);
			userService.updateUser(user);
			jsonObject.put("state", true);
		}
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateMyPassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		JSONObject jsonObject = new JSONObject();
		int result = userService.updatePassword((Integer) session.get(CommonConstant.SESSION_ID), oldPassword, newPassword, repeatedNewPassword);
		jsonObject.put("state", result==0);
		jsonObject.put("info", CommonConstant.UPDATE_MY_MESSAGE[result]);
		sentMsg(jsonObject.toString());
		return null;
	}*/


	public String info() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		/*TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"用户列表","userManage/userList"});
		}
		breadCrumb.add(new Object[]{"用户详细信息","javascript:void(0);"});
		ctx.put("breadCrumb",breadCrumb);*/
		user = userService.loadUserByID(tid);
		ctx.put("companyType", dictService.getDictByGroupAndName("companyType", user.getCompanyType()) );
		ctx.put("userStatus", dictService.getDictByGroupAndName("userStatus", user.getStatus()) );
		return SUCCESS;
	}

	
	public String checkAccount() throws Exception{
		User uu = userService.getUserByAccount(account);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", uu == null);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String resetPassword()throws Exception{
		userService.resetPassword(tid, CommonConstant.INITIAL_PASSWORD);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}

	/*public String queryRole()throws Exception{
		List result=null;
		result=userService.getqueryRole();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", result);
		sentMsg(jsonObject.toString());
		return null;
	}*/
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getRepeatedNewPassword() {
		return repeatedNewPassword;
	}

	public void setRepeatedNewPassword(String repeatedNewPassword) {
		this.repeatedNewPassword = repeatedNewPassword;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
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

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	
	
}
