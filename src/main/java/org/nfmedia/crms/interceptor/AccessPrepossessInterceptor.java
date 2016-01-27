package org.nfmedia.crms.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.CollationKey;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.domain.Page;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.CompetenceUtil;
import org.springframework.util.Assert;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 访问前的拦截器，处理权限，获取用户名，资源列表
 * @author: hongwei
 * @CreateDate: 2014-11-17 下午2:09:56 
 */
@SuppressWarnings({ "serial", "unchecked"})
public class AccessPrepossessInterceptor extends AbstractInterceptor {

	private static final Log logger = LogFactory.getLog(AccessPrepossessInterceptor.class);
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
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		//获取去掉应用名的uri
		HttpServletRequest sq = ServletActionContext.getRequest();
		String uri = sq.getRequestURI();
		uri = uri.substring(sq.getContextPath().length()+1);
		String queryString = sq.getQueryString();
		String returnURL = uri+(queryString == null ? "" : "?"+queryString);

		logger.info("进入AccessPrepossessInterceptor："+returnURL);
		
		ActionContext ctx = ActionContext.getContext();
		Integer userID = (Integer) ctx.getSession().get(CommonConstant.SESSION_ID);
		//首先检查是否登录
		if(userID == null){ //未登录的情况a
			ctx.put("messageCode", "notLogin");
			ctx.put("returnURL",returnURL);
			return "redirectLogin";
		}else{ //已登录的情况
			User user = userService.loadUserByID(userID);
			Assert.notNull(user);
			
			/*UserState state = user.getState();
			if(state == UserState.DELETE){ //账户已删除
				ctx.put("messageCode", "deleted");
				ctx.put("returnURL", returnURL);
				ctx.getSession().clear(); //清除session
				return "redirectLogin";
			}*/
			
			//权限控制，获取用户名，资源列表。根据uri类型来分别处理
			String suffix = null;
			String prefix = null;
			int dot = uri.lastIndexOf('.');
			if(dot != -1){
				suffix = uri.substring(dot+1, uri.length());
				prefix = uri.substring(0, dot);
			}else{
				prefix = uri;
			}
			if(suffix == null || suffix.equals("action")){
				List<Page> resourcesList = userService.getUserPages(user.getId());
				if(prefix.endsWith("Action")){ //不需要验证权限，通过
					addResourcesMapToActionContext(resourcesList, ctx);
				}else if(prefix.endsWith("Do")){ //需要competence权限，同时获取ResourcesMap
					/*boolean flag = validCompetence(user.getRole().getCompetence(), prefix);
					if(flag == false){ //无访问权限
						ctx.put("messageCode", "noAccess");
						return "noAccess";
					}*/
					addResourcesMapToActionContext(resourcesList, ctx);
				}else{
					//resourcesList权限验证，获取resourcesMap和激活信息
					boolean flag = getResourcesMapAndActiveMessage(resourcesList, prefix, ctx);
					if(flag == false){ //无访问权限
						ctx.put("messageCode", "noAccess");
						return "noAccess";
					}
				}
					ctx.put("name", user.getName());
					//ctx.put("roleName", user.getRole().getName());
					//ctx.put("roleCompetence", user.getRole().getCompetence());
					/*if(state == UserState.FIRST_LOGIN){ //首次登陆
						ctx.put("firstLogin", true);
					}*/
			}else if( suffix.equals("ajax")){
				/*boolean flag = validCompetence(user.getRole().getCompetence(), prefix);
				if(flag == false){ *///无访问权限
					//ctx.put("messageCode", "noAccess");
					//return "noAccess";
					/*JSONObject jsonObject = new JSONObject();
					jsonObject.put("state", -1);
					jsonObject.put("info", "无访问权限");
					sentMsg(jsonObject.toString());
					return null;*/
				//}
			}
			return arg0.invoke();
		}
	}
	
	private void addResourcesMapToActionContext(final List<Page> resourcesList, ActionContext ctx){
		TreeMap<String, List<Page>> resourcesMap = new TreeMap<String, List<Page>>(new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				if(o1 == null || o2 == null)
					return 0;
				Collator collator = Collator.getInstance();
				CollationKey ck1 = collator.getCollationKey(String.valueOf(o1));
				CollationKey ck2 = collator.getCollationKey(String.valueOf(o2));
				return -ck1.compareTo(ck2);
			}
			
		});
		for(int i=0, size=resourcesList.size(); i<size; i++){
			Page resource = resourcesList.get(i);
			String parentName = resource.getParentName();
			List<Page> resources = resourcesMap.get(parentName);
			if(resources == null){
				resources = new ArrayList<Page>(10);
				resources.add(resource);
				resourcesMap.put(parentName, resources);
			}else{
				resources.add(resource);
			}
		}
		ctx.put("resourcesMap", resourcesMap);
	}
	
	//resourcesList权限验证，获取resourcesMap和激活信息(curParentName和curIndex)
	private boolean getResourcesMapAndActiveMessage(final List<Page> resourcesList, String uri, ActionContext ctx){
		TreeMap<String, List<Page>> resourcesMap = new TreeMap<String, List<Page>>(new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				if(o1 == null || o2 == null)
					return 0;
				Collator collator = Collator.getInstance();
				CollationKey ck1 = collator.getCollationKey(String.valueOf(o1));
				CollationKey ck2 = collator.getCollationKey(String.valueOf(o2));
				return -ck1.compareTo(ck2);
			}
			
		});
		boolean canAccess = false;
		boolean curUrl;
		for(int i=0, size=resourcesList.size(); i<size; i++){
			curUrl = false;
			Page resource = resourcesList.get(i);
			if(canAccess == false){
				if(resource.getUrl().equals(uri)){
					canAccess = true;
					curUrl = true;
				}
			}
			String parentName = resource.getParentName();
			List<Page> resources = resourcesMap.get(parentName);
			if(curUrl == true){
				ctx.put("curParentName", parentName);
			}
			if(resources == null){
				resources = new ArrayList<Page>(10);
				resources.add(resource);
				resourcesMap.put(parentName, resources);
				if(curUrl == true)
					ctx.put("curIndex", 0);
			}else{
				if(curUrl == true)
					ctx.put("curIndex", resources.size());
				resources.add(resource);
			}
		}
		ctx.put("resourcesMap", resourcesMap);
		return canAccess;
	}
	
	private boolean validCompetence(final long competence, final String uri){
		return CompetenceUtil.getCompetence(uri, competence);
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
