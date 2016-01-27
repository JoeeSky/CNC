package org.nfmedia.crms.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class FunctionDao extends BaseDao<Function> {
	/*public List getRolesAsOption(){
		return createQuery("select r.id,r.name from Role r where r.enable=true order by r.sortOrder").list();
	}*/
	
	public PageUtil getModelsList(int pageNo,int pageSize,String filter){
		/*String defaultFilter="";
		if(filter.equals("")) filter=defaultFilter;*/
		//"select f.id,f.name from Function f order by f.parentId, f.sortOrder asc"
		//计算分页页数
		PageUtil page=pagedQuery("select f.id, f.name, '', f.status, f.sortOrder from Function f where f.parentId = 0 order by f.sortOrder asc",
				pageNo, pageSize);
		List<Object[]> data = page.getResult();
		Map<String,List<Function>> mm =new HashMap<String,List<Function>>();
		
		//获取模块功能的序号集合，如{1,2,3}
		String ids="";
		for(Object[] objs : data) ids+= objs[0]+",";
		if(!ids.equals("")) ids=ids.substring(0, ids.length()-1);
		ids="("+ids+")";
		
		//计算每个模块下的功能
		List<Object[]> func=createQuery("select f.parentId, f.name from Function f where f.parentId in "+ids+" order by f.parentId, f.sortOrder, f.id asc ").list();
		Map<Integer,String> funcMap=new HashMap<Integer,String>();
		int curParentId=0;
		String curFunc="";
		for(Object[] objs : func){
			if((Integer)objs[0]!= curParentId){
				if(!curFunc.equals("")) curFunc=curFunc.substring(0, curFunc.length()-1);
				funcMap.put(curParentId, curFunc);
				curParentId=(Integer)objs[0];
				curFunc="";
			}
			curFunc+=objs[1]+"，";
		}
		if(!curFunc.equals("")) curFunc=curFunc.substring(0, curFunc.length()-1);
		funcMap.put(curParentId, curFunc);
		
		//把计算出的功能放入data
		for(Object[] objs : data) objs[2]= funcMap.get(objs[0]);
		
		return page;
	}
	
	/*获取功能的树状结构，结构形如[{"model":"用户",[func1,func2...]},
	{"model":"公司",[func5,func6...]}]*/
	public List<Object[]> getAllModels(){
		List<Function> funcs=createQuery("from Function f where f.parentId<>0 order by f.parentId, f.sortOrder, f.id asc").list();
		Map<Integer,List<Function>> funcMap=new HashMap<Integer,List<Function>>();
		int curParentId=0;
		List<Function> curModel=null;
		for(Function func : funcs){
			if(func.getParentId()!= curParentId){				
				funcMap.put(curParentId, curModel);
				curParentId=func.getParentId();
				curModel=new ArrayList<Function>();
			}
			curModel.add(func);
		}
		funcMap.put(curParentId, curModel);
		
		//把功能列表和模块名对应，放入list
		List<Object[]> models=createQuery("select f.id, f.name from Function f where f.parentId = 0 order by f.sortOrder, f.id asc").list();
		List<Object[]> result= new ArrayList<Object[]>();
		for(Object[] objs : models){
			Object[] curM =new Object[2];
			curM[0]=objs[1];
			curM[1]=funcMap.get(objs[0]);
			result.add(curM);
		}
		
		return result;	
	}


}



