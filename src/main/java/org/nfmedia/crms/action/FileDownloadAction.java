package org.nfmedia.crms.action;

import java.io.InputStream;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.nfmedia.crms.cons.CommonConstant;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 文件下载
 * @author: hongwei
 * @CreateDate: 2014-12-14 下午9:16:48 
 */
@SuppressWarnings({"serial","rawtypes"})
public class FileDownloadAction extends ActionSupport {

	private String inputPath;

	public String getInputPath() {
		return inputPath;
	}

	/**
	 * @param inputPath the inputPath to set
	 */
	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	
	public InputStream getTargetFile() throws Exception{
		return ServletActionContext.getServletContext().getResourceAsStream(CommonConstant.SAVE_PATH+"/"+inputPath);
	}

	@Override
	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		Integer id = (Integer) session.get(CommonConstant.SESSION_ID);
		if(id!=null){
			return SUCCESS;
		}else {
			return LOGIN;
		}
	}

	
}
