 package org.nfmedia.crms.service;


import java.util.ArrayList;
import java.util.List;


import org.nfmedia.crms.dao.DictDao;
import org.nfmedia.crms.domain.Dict;
import org.nfmedia.crms.util.PageUtil;
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
}
