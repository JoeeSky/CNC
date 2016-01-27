package org.nfmedia.crms.domain;

public class Page {

	private int id;
	private String name;
	private String url;
	private String parentName;
	private int sortOrder;
	private String companyTypes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public String getCompanyTypes() {
		return companyTypes;
	}

	public void setCompanyTypes(String companyTypes) {
		this.companyTypes = companyTypes;
	}

}