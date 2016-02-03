package org.nfmedia.crms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.nfmedia.crms.domain.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","rawtypes","unchecked"})
public class ManufacturerTaskPageAction extends ActionSupport {
	
	private void sentMsg(String content) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}
	
	public String viewUploadManufacturerTaskPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("机加工");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"机加工","javascript:void(0);"});
			breadCrumb.add(new Object[]{"上传机加工任务","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}
	
	public String viewManufacturerTaskListPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("机加工");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"机加工","javascript:void(0);"});
			breadCrumb.add(new Object[]{"机加工任务列表","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}
	
	public String viewAcceptManufacturerTaskPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("机加工");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"机加工","javascript:void(0);"});
			breadCrumb.add(new Object[]{"接收机加工任务","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}
	
	

}
