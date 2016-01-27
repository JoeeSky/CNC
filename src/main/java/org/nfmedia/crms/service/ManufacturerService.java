package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.dao.ManufacturerDao;
import org.nfmedia.crms.domain.Demander;
import org.nfmedia.crms.domain.Manufacturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManufacturerService {

	@Autowired
	private ManufacturerDao manufacturerDao;
	
	
	public void addManufacturer(Manufacturer manufacturer){
		System.out.println(manufacturer.toString());
		manufacturer.setDescription("制造商");
		manufacturer.setVerifystatus(0);
		manufacturer.setLogo("");
		manufacturerDao.save(manufacturer);
	}
	
	public Manufacturer loadManufacturerByName(String name){
		Manufacturer manufacturer = manufacturerDao.getManufacturerByName(name);
		return manufacturer;
	}
	
	public Manufacturer loadManufacturerByPinyin(String pinyin){
		Manufacturer manufacturer = manufacturerDao.getManufacturerByPinyin(pinyin);
		return manufacturer;
	}
	
	public List getManufacturerList() {
		return manufacturerDao.getManufacturerList();
	}
	
	public List getManufacturerListByCondition(String searchString) {
		return manufacturerDao.getManufacturerListByCondition(searchString);
	}
	
	public Manufacturer loadManufacturerByID(Integer id){
		return manufacturerDao.load(id);
	}
	
	public void updateVerifyStatus(Integer id,Integer verifyStatus){
		Manufacturer manufacturer = manufacturerDao.load(id);
		manufacturer.setVerifystatus(verifyStatus);
		manufacturerDao.update(manufacturer);
	}
	
	public void editManufacturerInfo(Manufacturer manufacturer){
		Manufacturer ori =manufacturerDao.load(manufacturer.getId());
		if(manufacturer.getAddress()!=null) ori.setAddress(manufacturer.getAddress());
		if(manufacturer.getContact()!=null) ori.setContact(manufacturer.getContact());
		if(manufacturer.getEmail()!=null) ori.setEmail(manufacturer.getEmail());
		if(manufacturer.getTel()!=null) ori.setTel(manufacturer.getTel());
		if(manufacturer.getMobile()!=null) ori.setMobile(manufacturer.getMobile());
		if(manufacturer.getUrl()!=null) ori.setUrl(manufacturer.getUrl());
		manufacturerDao.update(ori);
	}
}
