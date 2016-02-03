package org.nfmedia.crms.service;


import java.util.List;
import java.util.Set;

import org.nfmedia.crms.dao.MenuDao;
import org.nfmedia.crms.domain.Menu;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:15:24 
 */
@SuppressWarnings("rawtypes")
@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;
	
	public Menu loadMenuByID(int id){
		return menuDao.load(id);
	}
	
	public PageUtil getMenusList(int pageNo,int pageSize,String filter){
		return menuDao.getMenusList(pageNo, pageSize,filter);
	}
	
	public List<Menu> getTopMenus(){
		return menuDao.getTopMenus();
	}
	
	public List<Object[]> getMenuMap(){
		return menuDao.getMenuMap();
	}
	
	public Menu getHomePage(Set<Integer> functions){
		return menuDao.getHomePage(functions);
	}
	
	public void addMenu(Menu menu){
		menuDao.save(menu);
	}
	
	public void updateMenu(Menu menu){
		menuDao.update(menu);
	}
	
	public void deleteMenuByID(Integer id){
		Menu menu=new Menu();
		menu.setId(id);
		menuDao.remove(menu);
	}
	
	
}
