package org.nfmedia.crms.dao;


import java.util.List;

import org.nfmedia.crms.domain.Request;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class RequestDao extends BaseDao<Request> {
	
	public PageUtil getRequestsList(String sidx,String sord,int pageNo,int pageSize,String filter){
		String defaultFilter="";
		if(filter.equals("")) filter=defaultFilter;
		return pagedQuery("select r.id,r.url,r.functionId,r.breadCrumb,r.status from Request r "+filter+" order by r."+sidx+" "+sord,
				pageNo, pageSize);
	}
	
	public Request getRequestByUrl(String url){
		List<Request> ls=find("from Request r where r.url='"+url+"'");
		if(ls.size()==0) return null;
		else return ls.get(0);
	}


}



