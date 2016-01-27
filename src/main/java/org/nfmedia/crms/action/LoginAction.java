package org.nfmedia.crms.action;

import java.util.HashMap;
import java.util.Map;

import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.Page;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.UserService;

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
	
	/**
	 * 登录检查
	 */
	@Override
	//登录身份验证
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		boolean flag =true;
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
			ctx.getSession().put(CommonConstant.SESSION_ID, user.getId());
			String homePage = userService.getUserHomePageByID(user.getId());
			ctx.getSession().put(CommonConstant.SESSION_HOMEPAGE, homePage);
			if(returnURL == null){
				returnURL = homePage;
			}
			
			return SUCCESS;
		}
	}
	
	//登录页面
	public String login() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer id = (Integer) session.get(CommonConstant.SESSION_ID);
		if(id != null){
			if(getReturnURL() == null){
				String homePage = (String) session.get(CommonConstant.SESSION_HOMEPAGE);
				/*if(homePage == null){
					homePage= userService.getUserHomePageByID(id);
					session.put(CommonConstant.SESSION_HOMEPAGE, homePage);
				}*/
				returnURL=homePage;
			}
			return SUCCESS;
		}else{
			return LOGIN;
		}
	}
	
	public String logout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		//session.clear();
		session.remove(CommonConstant.SESSION_ID);
		session.remove(CommonConstant.SESSION_HOMEPAGE);
		return SUCCESS;
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
	
	
}
