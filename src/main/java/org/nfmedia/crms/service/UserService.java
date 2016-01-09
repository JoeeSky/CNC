 package org.nfmedia.crms.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import jxl.Workbook;

import org.apache.poi.hssf.model.Sheet;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.dao.DepartmentDao;
import org.nfmedia.crms.dao.RoleDao;
import org.nfmedia.crms.dao.UserDao;
import org.nfmedia.crms.domain.Department;
import org.nfmedia.crms.domain.Resource;
import org.nfmedia.crms.domain.Role;
import org.nfmedia.crms.domain.User;
import org.nfmedia.crms.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.util.logging.Logger;

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
	@Autowired
	private DepartmentDao departmentDao;
	
	/*public User getUserByAccount(String account){
		User user = userDao.getUserByAccount(account);
		if(user != null){
			userDao.initialize(user.getRole());
			userDao.initialize(user.getRole().getResources());
		}
		return user;
	}*/
	
	public User loadUserByAccount(String account){
		User user = userDao.getUserByAccount(account);
		return user;
	}
	
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
	
	public User loadUserByID(Integer id){
		return userDao.load(id);
	}
	
	/**
	 * 获取登录成功后的首页
	 */
	public String getUserHomePageByID(Integer id){
		User user = loadUserByID(id);
		String homePage = null;
		if(user != null){
			homePage = ((Resource)(user.getRole().getResources().get(0))).getUrl();
		}
		return homePage;
	}
	
	public Page getUsersList(String sidx,String sord,int pageNo,int pageSize){
		return userDao.getUsersList(sidx, sord, pageNo, pageSize);
	}
	
	public Page getUsersListByKeyword(String keyword,String sidx,String sord,int pageNo,int pageSize){
		return userDao.getUsersListByKeyword(keyword, sidx, sord, pageNo, pageSize);
	}
	
	public void updateUser(User user){
		User uu = userDao.load(user.getId());
		if(user.getCellphone().equals(""))
			uu.setCellphone(null);
		else{
			uu.setCellphone(user.getCellphone());
		}
	/**	if(user.getDepartment().equals("")){
			uu.setDepartment(null);
		}else{
			uu.setDepartment(user.getDepartment());
		}**/
		if(user.getEmail().equals("")){
			uu.setEmail(null);
		}else{
			uu.setEmail(user.getEmail());
		}
		userDao.update(uu);
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
		user.setState(UserState.NORMAL);
		userDao.update(user);
	}
	
	public void resetPassword(Integer id,String password){
		User user = userDao.load(id);
		user.setPassword(password);
		user.setState(UserState.FIRST_LOGIN);
		userDao.update(user);
	}
	
	public void deleteUserByID(Integer id){
		User user = userDao.load(id);
		user.setState(UserState.DELETE);
		userDao.update(user);
	}
	
	public void addUser(User user){
		System.out.println(user.toString());
		user.setPassword(CommonConstant.INITIAL_PASSWORD);
		if(user.getCellphone().equals(""))
			user.setCellphone(null);
		if(user.getEmail().equals(""))
			user.setEmail(null);
		if(user.getRole().getId() == null)
			user.setRole(null);
		else{
			Role role = roleDao.load(user.getRole().getId());
			user.setRole(role);
		}
		if(user.getDepartment().getId() == null)
			user.setDepartment(null);
		else{
			Department department = departmentDao.load(user.getDepartment().getId());
			user.setDepartment(department);
		}
		user.setState(UserState.FIRST_LOGIN);
		userDao.save(user);
	}
	
	/*public class UserImport{  
		   @SuppressWarnings("deprecation")
		public void insertDB(InputStream fp,String userId) {  
		      try {  
		        HSSFWorkbook workbook = new HSSFWorkbook(fp);// 创建工作薄  
		        HSSFSheet sheet = workbook.getSheetAt(0);// 得到工作表  
		        HSSFRow row = null;// 对应excel的行  
		        HSSFCell cell = null;// 对应excel的列  
		        String Var="";  
		        row = sheet.getRow((short)0);  
		      
		  
		        int totalRow = sheet.getLastRowNum();// 得到excel的总记录条数  
		            Integer id = Integer.valueOf(userId);  
		            String account = "";//账号
		            String name = "";//名称
		            Role role = null;//角色 
		            Department department = null;//部门  
		            String email = "";//邮箱
		            String cellphone = "";//手机  
		              
		              
		            for (short i = 1; i <=totalRow; i++) { 
		                mainBean mb = new mainBean();  
		                User user = new User();  
		                row = sheet.getRow(i);  
		                cell = row.getCell((short)0);  
		                if(cell!=null)  
		                account = cell.getRichStringCellValue().toString();  
		                user.setAccount(account);  
		                  
		                cell = row.getCell((short)1);  
		                if(cell!=null)  
		                name =cell.getRichStringCellValue().toString();  
		                user.setName(name);  
		                  
		                cell = row.getCell((short)2);  
		                if(cell!=null)  
		                role =  cell.getRichStringCellValue().toString();  
		                user.setRole(role);  
		                  
		                cell = row.getCell((short)3);  
		                if(cell!=null)  
		                department =  cell.getRichStringCellValue().toDepartment();  
		                user.setDepartment(department);  
		                  
		                cell = row.getCell((short)4);  
		                if(cell!=null)  
		                email =  cell.getRichStringCellValue().toString();  
		                user.setEmail(email);  
		                  
		                cell = row.getCell((short)5);  
		                if(cell!=null)  
		                cellphone =  cell.getRichStringCellValue().toString();  
		                user.setCellphone(cellphone);  
		                user.setId(id);  
		                if(mb.isEmptyuser(account))  
		                    mb.updataMainByuser(user);//防止账号重复
		                else  
		                mb.newMainUpdata(user);//插入数据  
		            }  
		      
		    } catch (IOException e) {  
		        // TODO Auto-generated catch block  
		        e.printStackTrace();  
		    }  
		  
		}  
	}  */
	
	public boolean importUser(String filePath){
		  boolean success=false;
		  Workbook rwb = null;
		  try{
		   InputStream is = new FileInputStream(filePath);
		   rwb = Workbook.getWorkbook(is);
		   // 获取第一张Sheet表
		   jxl.Sheet rs = rwb.getSheet(0);
		   for (int k = 1; k < rs.getRows(); k++){
		    String account=rs.getCell(0, k).getContents();
		    String password=rs.getCell(1, k).getContents();
		    String name=rs.getCell(2, k).getContents();
		    String cellphone=rs.getCell(3, k).getContents();
		    String email=rs.getCell(4, k).getContents();    
		    String role_id=rs.getCell(5, k).getContents();
		    String department_id=rs.getCell(6, k).getContents();
		    String state=rs.getCell(7, k).getContents();
		    if(account.equals("")||password.equals("")||name.equals("")||role_id.equals("")||department_id.equals("")){
		     success=false;
		     break;
		    }else{
		     String str1="insert into information(account,password,name,cellpohe,email,role_id,department_id,state)values('"+account+"','"+password+"','"+name+"','"+cellphone+"','"+email+"','"+role_id+"','"+department_id+"','"+state+"')";
		        User.addInfo(str1);
		        User.closeAll(); 
		        success=true;
		         }
		   }
		   rwb.close();
		  }catch (Exception e){
		   e.printStackTrace();
		  }
		  return success;
		 }

	public List getqueryRole() {
		return roleDao.getqueryRole();
	}
}
