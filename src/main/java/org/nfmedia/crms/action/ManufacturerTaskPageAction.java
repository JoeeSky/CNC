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
		return SUCCESS;
	}
	
	public String viewManufacturerTaskListPage() throws Exception{
		return SUCCESS;
	}
	
	public String viewAcceptManufacturerTaskPage() throws Exception{
		return SUCCESS;
	}
	
	

}
