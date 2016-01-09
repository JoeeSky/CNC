package org.nfmedia.crms.action;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import org.nfmedia.crms.domain.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class ProgramTaskPageAction extends ActionSupport {
	
	public String viewUploadProgramTaskPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("G代码");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"G代码","javascript:void(0);"});
			breadCrumb.add(new Object[]{"上传G代码任务","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}
	
	public String viewProgramTaskListPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("G代码");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"G代码","javascript:void(0);"});
			breadCrumb.add(new Object[]{"G代码任务列表","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}
	
	public String viewAcceptProgramTaskPage() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		TreeMap<String, List<Resource>> resourcesMap = (TreeMap<String, List<Resource>>) ctx.get("resourcesMap");
		List breadCrumb = new ArrayList(5);
		List<Resource> lr = resourcesMap.get("G代码");
		if(lr.size() == 1){
			Resource resource = lr.get(0);
			Object[] item = new Object[]{resource.getName(),resource.getUrl()};
			breadCrumb.add(item);
		}else{
			breadCrumb.add(new Object[]{"G代码","javascript:void(0);"});
			breadCrumb.add(new Object[]{"接收G代码任务","javascript:void(0);"});
		}
		ctx.put("breadCrumb",breadCrumb);
		return SUCCESS;
	}

}
