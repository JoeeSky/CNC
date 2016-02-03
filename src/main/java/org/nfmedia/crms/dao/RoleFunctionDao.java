package org.nfmedia.crms.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.nfmedia.crms.domain.Function;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.domain.RoleFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class RoleFunctionDao extends BaseDao<RoleFunction> {
	@Autowired
	private FunctionDao functionDao;
	/*public PageUtil getModelsList(int pageNo,int pageSize,String filter){
		String defaultFilter="";
		if(filter.equals("")) filter=defaultFilter;
		//"select f.id,f.name from Function f order by f.parentId, f.sortOrder asc"
		//计算分页页数
		PageUtil page=pagedQuery("select f.id, f.name, '', f.enable, f.sortOrder from Function f where f.parentId = 0 order by f.sortOrder asc",
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
	}*/
	
	/*获取某个角色的功能，结果形如
	 * [{"model":"user",[{"id":"1","name":"增加",status},{"id":"2","name":"查询"}]},
	 * {"model":"role",[{"id":"5","name":"增加"},{"id":"6","name":"查询"}]}]*/
	/*public List<Object> getGrantedFunction(int roleId){
		//计算某角色拥有的功能
		//List<Object[]> func=createQuery("select rf.function.parentId, rf.function.id, rf.function.name, rf.role.id from RoleFunction rf right join rf.function where rf.function.parentId<>0 order by rf.function.parentId, rf.function.sortOrder, rf.function.id asc").list();
		List<Object[]> func=createQuery("select f.parentId, f.id, f.name, f.rf.role.id from RoleFunction rf right join rf.function where rf.function.parentId<>0 order by rf.function.parentId, rf.function.sortOrder, rf.function.id asc").list();
		Map<Integer,List<Object>> funcMap=new HashMap<Integer,List<Object>>();
		int curParentId=0;
		List<Object> curModel=null;
		for(Object[] objs : func){
			if((Integer)objs[0]!= curParentId){				
				funcMap.put(curParentId, curModel);
				curParentId=(Integer)objs[0];
				curModel=new ArrayList<Object>();
			}
			Object[] curFunc = new Object[3];
			curFunc[0]= objs[1];
			curFunc[1]= objs[2];
			curFunc[2]= objs[3]!=null && ((Integer) objs[3])==roleId;
			curModel.add(curFunc);
		}
		funcMap.put(curParentId, curModel);
		
		//把功能列表和模块名对应，放入list
		List<Object[]> models=createQuery("select f.id, f.name from Function f where f.parentId = 0 order by f.sortOrder, f.id asc").list();
		List<Object> result= new ArrayList<Object>();
		for(Object[] objs : models){
			Object[] curM =new Object[2];
			curM[0]=objs[1];
			curM[1]=funcMap.get(objs[0]);
			result.add(curM);
		}
		
		return result;	
	}*/
	
	//获取某个角色拥有的功能集合，用id表示
	public Set<Integer> getFunctionsByRole(int roleId){
		List<Integer> ls=createQuery("select rf.function.id from RoleFunction rf where rf.role.id = ?",roleId).list();
		Set<Integer> result = new HashSet<Integer>();
		for(Integer id : ls) result.add(id);
		return result;
	}
	
	/*根据角色获取功能的树状结构，结构形如[{functionParent1,[func1,func2...]},
	{functionParent2,[func5,func6...]}]*/
	public List<Object[]> getGrantedFunction(int roleId){
		List<Object[]> result= functionDao.getFunctionMap();
		Set<Integer> functionSet = getFunctionsByRole(roleId);
		for(Object[] obj : result)
			for(Function func : (List<Function>)obj[1])
				if(func.getStatus().equals("U") && !(functionSet.contains(func.getId()))){
					getSession().evict(func);
					func.setStatus("A");
				}
		return result;		
	}
	
	public List<RoleFunction> load(int roleId, int functionId){
		return find("from RoleFunction rf where rf.role.id = ? and rf.function.id =?",roleId, functionId);
	}
	
	public void grant(int roleId, int functionId, boolean grant){
		if(grant){
			if(load(roleId, functionId).size()==0){
				RoleFunction rf=new RoleFunction();
				Role role = new Role();
				Function function =new Function();
				role.setId(roleId);
				function.setId(functionId);
				rf.setRole(role);
				rf.setFunction(function);
				rf.setIdentify(false);
				save(rf);
			}				
		} else{
			createQuery("delete RoleFunction rf where rf.role.id = ? and rf.function.id =?",roleId, functionId).executeUpdate();
		}
	}

}



