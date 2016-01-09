package org.nfmedia.crms.domain;

import java.util.ArrayList;
import java.util.List;


/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings({ "serial", "rawtypes" })
public class Role extends BaseDomain {


    // Fields    

     private Short id;
     private long competence;
     private String name;
     private List resources = new ArrayList(0);


    // Constructors

    /** default constructor */
    public Role() {
    }

	/** minimal constructor */
    public Role(long competence, String name) {
        this.competence = competence;
        this.name = name;
    }
    
    /** full constructor */
    public Role(long competence, String name, List resources) {
        this.competence = competence;
        this.name = name;
        this.resources = resources;
    }

   
    // Property accessors

    public Short getId() {
        return this.id;
    }
    
    public void setId(Short id) {
        this.id = id;
    }

    public long getCompetence() {
        return this.competence;
    }
    
    public void setCompetence(long competence) {
        this.competence = competence;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public List getResources() {
        return this.resources;
    }
    
    public void setResources(List resources) {
        this.resources = resources;
    }
   








}