package org.nfmedia.crms.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 权限操作类
 * @author: hongwei
 * @CreateDate: 2015-1-8 下午8:32:27 
 */
@SuppressWarnings("serial")
public class CompetenceUtil {

	private static final Map<String,Integer> descMap = new HashMap<String,Integer>(){
		{
			put("brandManage/brandUpdateDo", 0);
			put("brandManage/editBrand", 1); //删除
			put("clientManage/followClient", 2);
			put("clientManage/releaseAlwaysClient", 3);
		}
	};
	
	public static boolean getCompetence(String desc,long c){
		Integer cInteger = descMap.get(desc);
		if(cInteger == null) //descMap中未列出的，表明不需要权限，直接返回true
			return true;
		return getBit(c, cInteger);
	}
	
	private static boolean getBit(Long c,int n){
		if(n<0||n>=64){ 
			return false;
		}
		c = c >>> n;
		return c%2L != 0;
	}
	
	public static void main(String[] args) {
		Long c = -2L;
		c = c>>>0;
		System.out.println(c%2L != 0);
	}

}
