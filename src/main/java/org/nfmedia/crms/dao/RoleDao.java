package org.nfmedia.crms.dao;

import java.util.List;


import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.stereotype.Repository;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-2 下午6:10:44 
 */
@SuppressWarnings("rawtypes")
@Repository
public class RoleDao extends BaseDao<Role> {
	public List getRolesAsOption(){
		return createQuery("select r.id,r.name from Role r where r.enable=true order by r.sortOrder").list();
	}
	
	public PageUtil getRolesList(String sidx,String sord,int pageNo,int pageSize,String filter){
		String defaultFilter="";
		if(filter.equals("")) filter=defaultFilter;
		return pagedQuery("select r.id,r.name,r.companyType,r.enable,r.sortOrder from Role r "+filter+" order by r."+sidx+" "+sord,
				pageNo, pageSize);
	}


}



