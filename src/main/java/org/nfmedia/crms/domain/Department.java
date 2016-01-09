package org.nfmedia.crms.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * Department entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings({ "serial", "rawtypes" })
public class Department extends BaseDomain {


    // Fields    

     private Short id;
     private String name;
     private Department parentDepartment;
     private Set childDepartments = new HashSet(0);


    // Constructors

    /** default constructor */
    public Department() {
    }

	/** minimal constructor */
    public Department(String name) {
        this.name = name;
    }
    
    /** full constructor */
    public Department(String name, Department parentDepartment, Set childDepartments) {
        this.name = name;
        this.parentDepartment = parentDepartment;
        this.childDepartments = childDepartments;
    }

   
    // Property accessors

    public Short getId() {
        return this.id;
    }
    
    public void setId(Short id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Department getParentDepartment() {
        return this.parentDepartment;
    }
    
    public void setParentDepartment(Department parentDepartment) {
        this.parentDepartment = parentDepartment;
    }

    public Set getChildDepartments() {
        return this.childDepartments;
    }
    
    public void setChildDepartments(Set childDepartments) {
        this.childDepartments = childDepartments;
    }
   








}