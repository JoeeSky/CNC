 package org.nfmedia.crms.service;


import java.util.List;
import java.util.Map;


import org.nfmedia.crms.dao.DictDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author: hongwei
 * @CreateDate: 2014-11-16 下午12:40:10 
 */
@SuppressWarnings("rawtypes")
@Service
public class DictService {

	@Autowired
	private DictDao dictDao;
	
	public List getDictsByWordGroup(String wordGroup){
		return dictDao.getDictsByWordGroup(wordGroup);
	}
	
	public String getDictByGroupAndName(String wordGroup, String name){
		return dictDao.getDictByGroupAndName(wordGroup, name);
	}
	
	public Map<String,String> getDictsMap(String wordGroup){
		return dictDao.getDictsMap(wordGroup);
	}
}
