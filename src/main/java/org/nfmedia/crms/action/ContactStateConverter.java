package org.nfmedia.crms.action;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;
import org.nfmedia.crms.cons.ContactState;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-9 下午1:27:57 
 */
@SuppressWarnings("rawtypes")
public class ContactStateConverter extends StrutsTypeConverter {

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		if(ContactState.class == arg2){
			return ContactState.getInstanceBySymbol(arg1[0].charAt(0));
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@Override
	public String convertToString(Map arg0, Object arg1) {
		if(arg1 instanceof ContactState){
			return ((ContactState)arg1).getSymbol().toString();
		}
		return arg1.toString();
	}

}
