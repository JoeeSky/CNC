package org.nfmedia.crms.service;

import org.nfmedia.crms.dao.CncDao;
import org.nfmedia.crms.domain.Cnc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CncService {

	@Autowired
	private CncDao cncDao;
	
	
	public void addCnc(Cnc cnc){
		System.out.println(cnc.toString());
//		if(cnc.getDescription().equals(""))
			cnc.setDescription("");
//		if(cnc.getVerifystatus().equals(""))
			cnc.setVerifystatus(0);
//		if(cnc.getLogo().equals(""))
			cnc.setLogo("");
		cncDao.save(cnc);
	}
	
	public Cnc loadCncByName(String name){
		Cnc cnc = cncDao.getCncByName(name);
		return cnc;
	}
}
