package org.nfmedia.crms.action;


import java.util.Map;
import java.util.Set;


import org.nfmedia.crms.util.LoginUtil;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-25 上午12:33:31 
 */
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class TestAction extends ActionSupport {
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String testSession() throws Exception {
		Set<Integer> functionSet=LoginUtil.getFunctionSet();
		System.out.print("functionSet:");
		for(Integer id : functionSet) System.out.print(id+",");
		
		Map<String,Set<String>> functionTree=LoginUtil.getFunctionTree();
		System.out.println("functionTree:");
		for(String key : functionTree.keySet()){
			System.out.print(key+":");
			for(String name : functionTree.get(key)) System.out.print(name+",");
			System.out.println("");
		}
		return SUCCESS;
	}
	
	public String testNoLogin() throws Exception {
		return SUCCESS;
	}
}
