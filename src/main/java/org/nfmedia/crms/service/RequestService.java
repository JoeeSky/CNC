package org.nfmedia.crms.service;

import org.nfmedia.crms.dao.RequestDao;
import org.nfmedia.crms.domain.Request;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:15:24 
 */
@SuppressWarnings("rawtypes")
@Service
public class RequestService {

	@Autowired
	private RequestDao requestDao;
	
	public Request loadRequestByID(int id){
		return requestDao.load(id);
	}
	
	public Request getRequestByUrl(String url){
		return requestDao.getRequestByUrl(url);
	}
	
	public PageUtil getRequestsList(String sidx,String sord,int pageNo,int pageSize,String filter){
		return requestDao.getRequestsList(sidx, sord, pageNo, pageSize, filter);
	}
	
	public void addRequest(Request request){
		requestDao.save(request);
	}
	
	public void updateRequest(Request request){
		requestDao.update(request);
	}
	
	public void deleteRequestByID(Integer id){
		Request r=new Request();
		r.setId(id);
		requestDao.remove(r);
	}
}
