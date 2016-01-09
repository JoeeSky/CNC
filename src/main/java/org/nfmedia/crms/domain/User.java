package org.nfmedia.crms.domain;

import org.nfmedia.crms.cons.UserState;


/**
 * User entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings({ "serial" })
public class User extends BaseDomain {


    // Fields    

     private Integer id;
     private String account;
     private String password;
     private String name;
     private String cellphone;
     private String email;
     private Role role;
     private Department department;
     private UserState state;


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String account, String password, String name, Role role, UserState state) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.role = role;
        this.state = state;
    }
    
    /** full constructor */
    public User(String account, String password, String name, String cellphone, String email, Role role, Department department, UserState state) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.cellphone = cellphone;
        this.email = email;
        this.role = role;
        this.department = department;
        this.state = state;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return this.account;
    }
    
    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getCellphone() {
        return this.cellphone;
    }
    
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }

    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }

    public UserState getState() {
        return this.state;
    }
    
    public void setState(UserState state) {
        this.state = state;
    }

	public static  void addInfo(String str1) {
		// TODO Auto-generated method stub
		
	}

	public static  void closeAll() {
		// TODO Auto-generated method stub
		
	}
   








}