package org.nfmedia.crms.dao;


import java.util.List;


import org.nfmedia.crms.domain.Dict;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.stereotype.Repository;

@SuppressWarnings("rawtypes")
@Repository
public class DictDao extends BaseDao<Dict> { 

	public List getDictsByWordGroup(String wordGroup){
		return createQuery("select d.name,d.value from Dict d where d.wordGroup = ?",wordGroup).list();
	}
	
	public String getDictByGroupAndName(String wordGroup, String name){
		List<Dict> dicts=find("from Dict d where d.wordGroup = ? and d.name = ?",wordGroup,name);	
		return (dicts.size()==0) ? "undefined" : dicts.get(0).getValue();
	}

}
