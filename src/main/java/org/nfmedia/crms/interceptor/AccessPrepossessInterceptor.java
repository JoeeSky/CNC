package org.nfmedia.crms.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.domain.Menu;
import org.nfmedia.crms.domain.Request;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.service.DictService;
import org.nfmedia.crms.service.MenuService;
import org.nfmedia.crms.service.RequestService;
import org.nfmedia.crms.service.UserService;
import org.nfmedia.crms.util.LoginUtil;
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
	private RequestService requestService;
	private MenuService menuService;
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

		String suffix = null;
		String prefix = null;
		int dot = uri.lastIndexOf('.');
		if(dot != -1){
			suffix = uri.substring(dot+1, uri.length());
			prefix = uri.substring(0, dot);
		}else{
			prefix = uri;
			suffix="";
		}
		
		
		logger.info("进入AccessPrepossessInterceptor："+returnURL);
		ActionContext ctx = ActionContext.getContext();
		
		//判断该页面是否需要进行权限检查
		Request request=requestService.getRequestByUrl(prefix);
		if(request==null){
			if(suffix.equals("ajax")){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("state", -1);
				jsonObject.put("info", "页面未注册");
				sentMsg(jsonObject.toString());
				return null;
			}
			else{
				ctx.put("messageCode", "pageNotRegister");
				return "noAccess";
			}
		}
		
		//仅让不需要权限且不使用sitemesh的外部页面直接通过
		if(suffix.equals("do") && request.getFunctionId()==Integer.parseInt(dictService.getDictByGroupAndName("system", "freeAccessFunctionId"))) 
			return arg0.invoke();
		
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
					
				
			//检查有无权限访问该页面或请求
			if(!LoginUtil.getFunctionSet().contains(request.getFunctionId())){
				if(suffix.equals("ajax")){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("state", -1);
					jsonObject.put("info", "无权限访问");
					sentMsg(jsonObject.toString());
					return null;
				}
				else{
					ctx.put("messageCode", "noAccess");
					return "noAccess";
				}
			}
			
			//对页面请求的处理
			if(request.getIsPage()){
				//添加面包屑
				String[] breadCrumbs=request.getBreadCrumb().split(",");
				List<Object[]> breadCrumb = new ArrayList<Object[]>();
				for(String title : breadCrumbs)
					breadCrumb.add(new Object[]{title,"javascript:void(0);"});
				ctx.put("breadCrumb",breadCrumb);
				
				//生成菜单
				List<Object[]> menuMap=menuService.getMenuMap();
				Set<Integer> functionSet=(Set<Integer>) ctx.getSession().get("functionSet");
				Integer curMenuId=-1;
				Integer curParentId=-1;
				boolean flag=false;
				//for(Object[] top : menuMap){
				Iterator<Object[]> iterOut = menuMap.iterator(); 
				while(iterOut.hasNext()){
					Object[] top= iterOut.next();
					Menu topMenu= (Menu) top[0];
					if(!functionSet.contains(topMenu.getFunctionId())){
						iterOut.remove();
						continue;
					}
					if(!flag && topMenu.getUrl().equals(returnURL)) {
						curMenuId=topMenu.getId();
						curParentId=topMenu.getParentId();
					}
					
					List<Menu> subLs=(List<Menu>) top[1];
					Iterator<Menu> iter = subLs.iterator();  
					while(iter.hasNext()){
						Menu subMenu = iter.next();  
						if(!functionSet.contains(subMenu.getFunctionId())) iter.remove(); 
						else if(!flag && subMenu.getUrl().equals(returnURL)) {
							curMenuId=subMenu.getId();
							curParentId=subMenu.getParentId();
						}
					}
				}
				
				if(curParentId==-1) curParentId=(Integer)ctx.getSession().get("curParentId");
				else ctx.getSession().put("curParentId", curParentId);
				ctx.put("curMenuId", curMenuId);
				ctx.put("curParentId", curParentId);
				ctx.put("menuTree", menuMap);
				
				//显示姓名
				ctx.put("name", user.getName());
				
			}
			
			return arg0.invoke();
		}
	}
	
	

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setRequestService(RequestService requestService) {
		this.requestService = requestService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
}
