package org.nfmedia.crms.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 处理404
 * @author: hongwei
 * @CreateDate: 2014-11-21 下午12:08:36 
 */
@SuppressWarnings("serial")
public class PageNotFoundAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		return "404";
	}

	
}
