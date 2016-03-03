package org.nfmedia.crms.util;


import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.dto.UserDto;

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
	
	public static String getHomePage(){
		return (String) getSession().get("home");
	}
	
	public static Integer getUserId(){
		return (Integer) getSession().get("id");
	}
	
	public static User getUser(){
		String json=(String) getSession().get("userMsg");
		UserDto userDto= (UserDto)JSONObject.toBean(JSONObject.fromObject(json),UserDto.class);		
		return userDto.toUser(); 
	}
	
	private static Map<String, Object> getSession() {	
		return ActionContext.getContext().getSession();
	}
	
}
