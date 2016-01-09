package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.Resource;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.DepartmentService;
import org.nfmedia.crms.service.RoleService;
import org.nfmedia.crms.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class UserAction extends ActionSupport {

	private Integer tid;
	private User user;
	private String account;
	private String oldPassword;
	private String newPassword;
	private String repeatedNewPassword;
	private String id;
	private UserService userService;
	private DepartmentService departmentService;
	private RoleService roleService;
	private String oper;
	private String filePath; 
	
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
	public String viewProfile() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		List breadCrumb = new ArrayList(2);
		breadCrumb.add(new Object[]{"个人中心","javascript:void(0);"});
		ctx.put("breadCrumb",breadCrumb);
		user = userService.loadUserByID((Integer)ctx.getSession().get(CommonConstant.SESSION_ID));
		return SUCCESS;
	}
	
	public String updateInitPassword()throws Exception{
		Map session = ActionContext.getContext().getSession();
		userService.updateInitPassword((Integer) session.get(CommonConstant.SESSION_ID), newPassword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String updateMyInfo() throws Exception{
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
	}
	
	public String viewListPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"用户列表","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}

	public String viewAddPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("用户管理");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"用户管理","javascript:void(0);"});
			breadCrumb.add(new Object[]{"添加用户","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		
		ctx.put("departments", departmentService.getAllDeparments());
		ctx.put("roles", roleService.getAllRoles());
		
		return SUCCESS;
	}
	
	public String viewUpdatePage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
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
		breadCrumb.add(new Object[]{"修改用户信息","javascript:void(0);"});
		ctx.put("breadCrumb",breadCrumb);
		user = userService.loadUserByID(tid);
		ctx.put("departments", departmentService.getAllDeparments());
		ctx.put("roles", roleService.getAllRoles());
		return SUCCESS;
	}
	
	public String viewInfoPage() throws Exception{
		/*ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
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
		return SUCCESS;
	}
	
	public String add() throws Exception{
		userService.addUser(user);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String batchImportUser() throws Exception{
		userService.importUser(filePath);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;	
	}
	
	public String update() throws Exception{
		userService.updateUser(user);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String edit() throws Exception{
		if(oper.equals("del"))
			delete();
		return null;
	}
	
	public String delete() throws Exception{
		String[] ids = id.split(",");
		for(int i=0,size=ids.length;i<size;i++){
			Integer id = new Integer(ids[i]);
			userService.deleteUserByID(id);
		}
		return null;
	}
	
	public String checkAccount() throws Exception{
		User uu = userService.loadUserByAccount(account);
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

	public String queryRole()throws Exception{
		List result=null;
		result=userService.getqueryRole();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", result);
		sentMsg(jsonObject.toString());
		return null;
	}
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
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

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	
}
