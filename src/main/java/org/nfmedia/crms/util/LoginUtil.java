package org.nfmedia.crms.util;


import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

public class LoginUtil {
	
	public static Set<Integer> getFunctionSet(){
		return (Set<Integer>) getSession().get("functionSet");
	}
	
	
	public static Map<String,Set<String>> getFunctionTree(){
		return (Map<String,Set<String>>) getSession().get("functionTree");
	}
	
	public static boolean isGranted(String modelName,String functionName){
		return getFunctionTree().get(modelName).contains(functionName);
	}
	
	public static Map<String,Set<String>> getMenuTree(){
		return (Map<String,Set<String>>) getSession().get("menuTree");
	}
	
	public static String getHomePage(){
		return (String) getSession().get("home");
	}
	
	private static Map<String, Object> getSession() {	
		return ActionContext.getContext().getSession();
	}
	
}
