package org.nfmedia.crms.util;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * @author: hongwei
 * @CreateDate: 2014-11-21 下午5:04:27 
 */
public class PageToJson {
	
 public static JSONObject toJsonWithoutData(PageUtil page) throws JSONException{
	 JSONObject jsonObject = new JSONObject();
	 jsonObject.put("total", page.getTotalPageCount());
	 jsonObject.put("page",page.getCurrentPageNo());
	 jsonObject.put("records", page.getTotalCount());
	 return jsonObject;
 }
 
 public static void main(String[] args){
	
 }
}
