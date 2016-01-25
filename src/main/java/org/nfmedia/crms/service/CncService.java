package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.cons.UserState;
import org.nfmedia.crms.dao.CncDao;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CncService {

	@Autowired
	private CncDao cncDao;
	
	
	public void addCnc(Cnc cnc){
		System.out.println(cnc.toString());
			cnc.setDescription("数控工厂");
			cnc.setVerifystatus(0);
			cnc.setLogo("");
		cncDao.save(cnc);
	}
	
	public Cnc loadCncByName(String name){
		Cnc cnc = cncDao.getCncByName(name);
		return cnc;
	}
	
	public List getCncList() {
		return cncDao.getCncList();
	}
	
	public List getCncListByCondition(String searchString) {
		return cncDao.getCncListByCondition(searchString);
	}
	
	public void updateVerifyStatus(Integer id,Integer verifyStatus){
		Cnc cnc = cncDao.load(id);
		cnc.setVerifystatus(verifyStatus);
		cncDao.update(cnc);
	}
	
	public Cnc loadCncByID(Integer id){
		return cncDao.load(id);
	}
}
