package org.nfmedia.crms.domain;


public class Request{

	// Fields

	private Integer id;
	private String url;
	private Integer functionId;
	private Boolean isPage;
	private String breadCrumb;
	private String status;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getFunctionId() {
		return functionId;
	}
	public void setFunctionId(Integer functionId) {
		this.functionId = functionId;
	}
	public Boolean getIsPage() {
		return isPage;
	}
	public void setIsPage(Boolean isPage) {
		this.isPage = isPage;
	}
	public String getBreadCrumb() {
		return breadCrumb;
	}
	public void setBreadCrumb(String breadCrumb) {
		this.breadCrumb = breadCrumb;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
	
}