package org.nfmedia.crms.service;

import org.nfmedia.crms.dao.ManufacturerDao;
import org.nfmedia.crms.domain.Manufacturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManufacturerService {

	@Autowired
	private ManufacturerDao manufacturerDao;
	
	
	public void addManufacturer(Manufacturer manufacturer){
		System.out.println(manufacturer.toString());
//		if(cnc.getDescription().equals(""))
		manufacturer.setDescription("");
//		if(cnc.getVerifystatus().equals(""))
		manufacturer.setVerifystatus(0);
//		if(cnc.getLogo().equals(""))
		manufacturer.setLogo("");
		manufacturerDao.save(manufacturer);
	}
	
	public Manufacturer loadManufacturerByName(String name){
		Manufacturer manufacturer = manufacturerDao.getManufacturerByName(name);
		return manufacturer;
	}
}
