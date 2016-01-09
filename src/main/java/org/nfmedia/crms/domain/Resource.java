package org.nfmedia.crms.domain;



/**
 * Resource entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings({ "serial", "unused" })
public class Resource extends BaseDomain {


    // Fields    

     private Short id;
     private String name;
     private String url;
     private String parentName;


    // Constructors

    /** default constructor */
    public Resource() {
    }

    
    /** full constructor */
    public Resource(String name, String url, String parentName) {
        this.name = name;
        this.url = url;
        this.parentName = parentName;
    }

   
    // Property accessors

    public Short getId() {
        return this.id;
    }
    
    private void setId(Short id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }

    public String getParentName() {
        return this.parentName;
    }
    
    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
   








}