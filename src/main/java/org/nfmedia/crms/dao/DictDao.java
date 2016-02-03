package org.nfmedia.crms.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.nfmedia.crms.domain.Dict;
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
	
	public Map<String,String> getDictsMap(String wordGroup){
		List<Dict> ls=find("from Dict d where d.wordGroup = '"+wordGroup+"'");
		Map<String,String> result=new HashMap<String,String>();
		for(Dict dict:ls){
			result.put(dict.getName(), dict.getValue());
		}
		return result;
	}
}
