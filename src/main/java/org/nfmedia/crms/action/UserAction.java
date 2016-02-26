package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.CncService;
import org.nfmedia.crms.service.DemanderService;
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.ManufacturerService;
import org.nfmedia.crms.service.RoleService;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.LoginUtil;
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
	private String companyType;
	
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
	private CncService cncService;
	private DemanderService demanderService;
	private ManufacturerService manufacturerService;
	
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
		ActionContext ctx = ActionContext.getContext();
		ctx.put("roles", roleService.getAllRoles());
		return SUCCESS;
	}
	
	public String listAjax() throws Exception{
		/*ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Page>> resourcesMap = (TreeMap<String, List<Page>>) ctx.get("resourcesMap");
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
		
		user = userService.loadUserByID(tid);
		ctx.put("roles", roleService.getAllRoles());
		ctx.put("companyType", dictService.getDictsByWordGroup("companyType"));
		ctx.put("userStatus", dictService.getDictsByWordGroup("userStatus"));
		
		List<Object[]> ls=new ArrayList<Object[]>();
		if(user.getCompanyType().equals("cnc")) ls=cncService.getCncList();
		else if(user.getCompanyType().equals("demander")) ls=demanderService.getDemanderList();
		else if(user.getCompanyType().equals("manufacturer")) ls=manufacturerService.getManufacturerList();
		
		ctx.put("companyList", ls);
		
		return SUCCESS;
	}
	
	public String update() throws Exception{
		userService.updateUser(user);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updatePasswordInput() throws Exception{
		return SUCCESS;
	}
	
	public String updatePassword() throws Exception{
		userService.updatePassword(user.getId(),user.getPassword());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateInitPasswordInput() throws Exception{
		return SUCCESS;
	}
	
	public String updateInitPassword() throws Exception{
		JSONObject jsonObject = new JSONObject();
		if(newPassword.equals(repeatedNewPassword)){
			userService.updateInitPassword(user.getId(), newPassword);
			jsonObject.put("info", true);
		}
		else{
			jsonObject.put("info", false);
			jsonObject.put("msg", "修改失败，两次输入的密码不同");
		}
		
		
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateMyPasswordInput() throws Exception{
		return SUCCESS;
	}
	
	public String updateMyPassword() throws Exception{
		JSONObject jsonObject = new JSONObject();
		if(!userService.checkPsw(LoginUtil.getUserId(), oldPassword)){
			jsonObject.put("info", false);
			jsonObject.put("msg", "修改失败，原密码不正确");
		}
		else if(!newPassword.equals(repeatedNewPassword)){
			jsonObject.put("info", false);
			jsonObject.put("msg", "修改失败，两次输入的密码不同");
		}
		else {
			userService.updatePassword(LoginUtil.getUserId(), newPassword);
			jsonObject.put("info", true);
		}
		
		
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
	
	public String companyListAjax() throws Exception{
		JSONArray rows = new JSONArray();
		List<Object[]> ls=new ArrayList<Object[]>();
		if(companyType.equals("cnc")) ls=cncService.getCncList();
		else if(companyType.equals("demander")) ls=demanderService.getDemanderList();
		else if(companyType.equals("manufacturer")) ls=manufacturerService.getManufacturerList();
		
		for(Object[] objs :ls){
			JSONObject row=new JSONObject();
			row.put("id", (Integer)objs[0]);
			row.put("name", (String)objs[1]);
			rows.put(row);
		}
		
		sentMsg(rows.toString());
		
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
	
	*/


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
		
		String companyName="";
		if(user.getCompanyType().equals("cnc")) companyName=cncService.loadCncByID(user.getCompanyId()).getName();
		else if(user.getCompanyType().equals("demander")) companyName=demanderService.loadDemanderByID(user.getCompanyId()).getName();
		else if(user.getCompanyType().equals("manufacturer")) companyName=manufacturerService.loadManufacturerByID(user.getCompanyId()).getName();
		ctx.put("companyName", companyName );
		
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

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
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

	public void setCncService(CncService cncService) {
		this.cncService = cncService;
	}

	public void setDemanderService(DemanderService demanderService) {
		this.demanderService = demanderService;
	}

	public void setManufacturerService(ManufacturerService manufacturerService) {
		this.manufacturerService = manufacturerService;
	}
	
	
}
