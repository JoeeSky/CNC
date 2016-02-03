 package org.nfmedia.crms.service;

import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.UserDao;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author: hongwei
 * @CreateDate: 2014-11-16 下午12:40:10 
 */
@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	
	public User loadUserByID(int id){
		return userDao.load(id);
	}
	
	public User getUserByID(int id){
		return userDao.get(id);
	}
	
	public User getUserByAccount(String account){
		User user = userDao.getUserByAccount(account);
		return user;
	}
	
	public boolean checkPsw(int id, String password){		
		return userDao.checkPsw(id, password);
	}
	
	/**
	 * 获取登录成功后的首页
	 */
	
	/*public User getUserByAccount(String account){
		User user = userDao.getUserByAccount(account);
		if(user != null){
			userDao.initialize(user.getRole());
			userDao.initialize(user.getRole().getResources());
		}
		return user;
	}*/
	
	/*public User loadUserByAccount(String account){
		User user = userDao.getUserByAccount(account);
		return user;
	}*/
	
	/*public User getUserByID(Integer id){
		User user = userDao.get(id);
		if(user != null){
			userDao.initialize(user.getRole());
			userDao.initialize(user.getRole().getResources());
		}
		return user;
	}
	
	public User getUserTempByID(Integer id){
		User user = userDao.get(id);
		User result = null;
		if(user!=null){
			result = new User(null, null, user.getName(), user.getCellphone(), user.getEmail(), null, null, null);
			result.setId(user.getId());
			if(user.getDepartment()!=null){
				Department department = new Department(user.getDepartment().getName());
				result.setDepartment(department);
			}
		}
		return result;
	}*/
	
	

	
	public PageUtil getUsersList(String sidx,String sord,int pageNo,int pageSize, String filter){
		return userDao.getUsersList(sidx, sord, pageNo, pageSize, filter);
	}
	
	
	
	public void updateUser(User user){
		User ori =userDao.load(user.getId());
		if(user.getCellphone()!=null) ori.setCellphone(user.getCellphone());
		if(user.getCompanyId()!=null) ori.setCompanyId(user.getCompanyId());
		if(user.getCompanyType()!=null) ori.setCompanyType(user.getCompanyType());
		if(user.getEmail()!=null) ori.setEmail(user.getEmail());
		if(user.getName()!=null) ori.setName(user.getName());
		if(user.getRole()!=null) ori.setRole(user.getRole());
		if(user.getStatus()!=null) ori.setStatus(user.getStatus());
		userDao.update(ori);
	}
	
	public int updatePassword(Integer id,String oldPassword,String newPassword,String repeatedNewPassword){
		if(id == null){
			return 1;
		}
		User user = userDao.load(id);
		if(!user.getPassword().equals(oldPassword))
			return 2;
		if(!newPassword.equals(repeatedNewPassword))
			return 3;
		user.setPassword(newPassword);
		userDao.update(user);
		return 0;
	}
	
	public void updateInitPassword(Integer id,String password){
		User user = userDao.load(id);
		user.setPassword(password);
		//user.setState(UserState.NORMAL);
		userDao.update(user);
	}
	
	public void resetPassword(Integer id,String password){
		User user = userDao.load(id);
		user.setPassword(password);
		//user.setState(UserState.FIRST_LOGIN);
		userDao.update(user);
	}
	
	public void deleteUserByID(Integer id){
		User user = userDao.get(id);
		user.setStatus("N");
		userDao.update(user);
	}
	
	public void addUser(User user){
		user.setPassword(CommonConstant.INITIAL_PASSWORD);
		if(user.getCellphone().equals(""))
			user.setCellphone(null);
		if(user.getEmail().equals(""))
			user.setEmail(null);
		/*if(user.getRole().getId() == null)
			user.setRole(null);
		else{
			Role role = roleDao.load(user.getRole().getId());
			user.setRole(role);
		}*/
		
		//user.setState(UserState.FIRST_LOGIN);
		userDao.save(user);
	}
	

	/*public List getqueryRole() {
		return roleDao.getqueryRole();
	}*/
}
