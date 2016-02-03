package org.nfmedia.crms.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.nfmedia.crms.domain.Menu;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class MenuDao extends BaseDao<Menu> {
	
	public PageUtil getMenusList(int pageNo,int pageSize,String filter){
		String defaultFilter="";
		if(filter.equals("")) filter=defaultFilter;
		return pagedQuery("select m.id,m.parentId,m.title,m.sortOrder from Menu m order by m.parentId, m.sortOrder asc",
				pageNo, pageSize);
	}

	
	public List<Menu> getTopMenus(){
		return find("from Menu m where m.parentId = 0 order by m.sortOrder, m.id asc");
	}
	
	/*获取功能的树状结构，结构形如[{menuParent1,[menu1,menu2...]},
	{menuParent2,[menu5,menu6...]}]*/
	public List<Object[]> getMenuMap(){
		//获取功能列表，按父id分类，放入funcMap中
		List<Menu> menus=createQuery("from Menu m where m.parentId<>0 order by m.parentId, m.sortOrder, m.id asc").list();
		Map<Integer,List<Menu>> menuMap=new HashMap<Integer,List<Menu>>();
		int curParentId=0;
		List<Menu> curTopMenu=null;
		for(Menu menu : menus){
			if(menu.getParentId()!= curParentId){				
				menuMap.put(curParentId, curTopMenu);
				curParentId=menu.getParentId();
				curTopMenu=new ArrayList<Menu>();
			}
			curTopMenu.add(menu);
		}
		menuMap.put(curParentId, curTopMenu);
		
		//把功能列表和模块名对应，放入list
		List<Menu> topMenus=getTopMenus();
		Iterator<Menu> iter = topMenus.iterator();  
		while(iter.hasNext()){
			Menu topMenu = iter.next();  
			if(topMenu.getId()==0){
				iter.remove();
				break;
			}
		}
		
		List<Object[]> result= new ArrayList<Object[]>();
		for(Menu topMenu : topMenus){
			Object[] curM =new Object[2];
			curM[0]=topMenu;
			curM[1]=menuMap.get(topMenu.getId());
			if(curM[1]==null) curM[1]=new ArrayList<Menu>();
			result.add(curM);
		}	
		return result;	
	}
	
	public Menu getHomePage(Set<Integer> functions){
		String functionIds="";
		for(Integer id: functions) functionIds+=id+",";
		if(!functionIds.equals("")) functionIds=functionIds.substring(0, functionIds.length()-1);
		List<Menu> ls=find("from Menu m where m.functionId in ("+functionIds+") and m.url <> ''");
		return ls.size()==0 ? null: ls.get(0);		
	}
}



