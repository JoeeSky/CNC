package org.nfmedia.crms.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.domain.Menu;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.dto.UserDto;
import org.nfmedia.crms.service.MenuService;
import org.nfmedia.crms.service.RoleService;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.LoginUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-16 下午10:46:24 
 */
@SuppressWarnings({ "serial", "rawtypes", "unchecked" })
public class LoginAction extends ActionSupport {

	private String account;
	private String password;
	private String returnURL;
	
	private UserService userService;
	private RoleService roleService;
	private MenuService menuService;
	
	/**
	 * 登录检查
	 */
	@Override
	//登录身份验证
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		User user = userService.getUserByAccount(account);
		if(user == null){
			ctx.put("error", getText("不存在该用户"));
			return ERROR;
		}
		else if(!userService.checkPsw(user.getId(), password)){
			ctx.put("error", getText("密码不正确"));
			return ERROR;
		}
		else if(user.getStatus().equals("N")){
			ctx.put("error", getText("该用户已被禁用"));
			return ERROR;
		}
		else{	//成功验证身份
			
			/*数据写到session*/
			getSession().put(CommonConstant.SESSION_ID, user.getId());
			initUser(user);
			initFunctionSet();
			initFunctionTree();
			initHomePage();
			/**/
			if(user.getStatus().equals("F"))
				returnURL="userManage/updateInitPasswordInput?tid="+user.getId();
			if(returnURL == null){
				returnURL = LoginUtil.getHomePage();
			}
			
			return SUCCESS;
		}
	}
	
	//登录页面
	public String login() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer id = (Integer) session.get(CommonConstant.SESSION_ID);
		if(id != null){
			if(returnURL == null){
				returnURL=LoginUtil.getHomePage();
			}
			return SUCCESS;
		}else{
			return LOGIN;
		}
	}
	
	public String logout() throws Exception{
		//session.clear();
		getSession().remove(CommonConstant.SESSION_ID);
		delUser();
		delFunctionSet();
		delFunctionTree();
		delHomePage();
		return SUCCESS;
	}
	
	private Map<String, Object> getSession() {	
		return ActionContext.getContext().getSession();
	}
	
	private void initUser(User user){
		UserDto userDto=new UserDto();
		userDto.fromUser(user);
		getSession().put("userMsg", JSONObject.fromObject(userDto).toString());
	}
	
	private void delUser(){
		getSession().remove("userMsg");
	}
	
	private void initFunctionSet(){
		User user=userService.loadUserByID((Integer)getSession().get("id"));
		Set<Integer> functionSet=roleService.getFunctionsByRole(user.getRole().getId());
		getSession().put("functionSet", functionSet);
	}
	
	private void delFunctionSet(){
		getSession().remove("functionSet");
	}
	
	private void initFunctionTree(){
		User user=userService.loadUserByID((Integer)getSession().get("id"));
		List<Object[]> ls= roleService.getGrantedFunction(user.getRole().getId());
		Map<String,Set<String>> functionTree=new HashMap<String,Set<String>>();
		for(Object[] model : ls){
			Function modelObj=(Function)model[0];
			List<Function> subLs= (List<Function>) model[1];
			Set<String> subFunction=new HashSet<String>();
			for(Function func:subLs){
				if(func.getStatus().equals("U")) subFunction.add(func.getName());
			}
			functionTree.put(modelObj.getName() , subFunction);
		}
		getSession().put("functionTree", functionTree);
	}
	
	private void delFunctionTree(){
		getSession().remove("functionTree");
	}
	
	private void initHomePage(){
		Menu homepage = menuService.getHomePage(LoginUtil.getFunctionSet());
		getSession().put("home", homepage.getUrl());
	}
	
	private void delHomePage(){
		getSession().remove("home");
	}
	
	public void validateExecute() {
		if(account == null || account.trim().equals(""))
			addFieldError("account", getText("account.required"));
		if(password == null || password.trim().equals(""))
			addFieldError("password", getText("password.required"));
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getReturnURL() {
		return returnURL;
	}

	public void setReturnURL(String returnURL) {
		this.returnURL = returnURL;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
}
