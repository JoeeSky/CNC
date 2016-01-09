package org.nfmedia.crms.action;

import java.util.Map;

import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.Resource;
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
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		User user = userService.loadUserByAccount(account);
		if(user != null){ //找到对应账户
			UserState state = user.getState();
			if(state == UserState.DELETE){ //账户已删除
				ctx.put("error", getText("userDeleted"));
				return ERROR;
			}
			if(user.getPassword().equals(password)){ //账户密码匹配
				ctx.getSession().put(CommonConstant.SESSION_ID, user.getId());
				String homePage = ((Resource)(user.getRole().getResources().get(0))).getUrl();
				ctx.getSession().put(CommonConstant.SESSION_HOMEPAGE, homePage);
				if(returnURL == null){
					returnURL = homePage;
				}
				return SUCCESS;
			}else{ //账户密码不匹配
				ctx.put("error",getText("loginFailed"));
				return ERROR;
			}
		}else{ //账户不存在
			ctx.put("error",getText("userNotExist"));
			return ERROR;
		}
	}

	public String login() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer id = (Integer) session.get(CommonConstant.SESSION_ID);
		if(id != null){
			if(getReturnURL() == null){
				String homePage = (String) session.get(CommonConstant.SESSION_HOMEPAGE);
				if(homePage == null){
					homePage = userService.getUserHomePageByID(id);
					session.put(CommonConstant.SESSION_HOMEPAGE, homePage);
				}
				setReturnURL(homePage);
			}
			return SUCCESS;
		}else{
			return LOGIN;
		}
	}
	
	public String logout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		session.clear();
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
