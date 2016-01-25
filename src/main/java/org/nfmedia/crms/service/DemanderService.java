package org.nfmedia.crms.service;

import java.util.List;

import org.nfmedia.crms.dao.DemanderDao;
import org.nfmedia.crms.domain.Cnc;
import org.nfmedia.crms.domain.Demander;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DemanderService {

	@Autowired
	private DemanderDao demanderDao;
	
	
	public void addDemander(Demander demander){
		System.out.println(demander.toString());
		demander.setDescription("需求商");
		demander.setVerifystatus(0);
		demander.setLogo("");
		demanderDao.save(demander);
	}
	
	public Demander loadDemanderByName(String name){
		Demander demander = demanderDao.getDemanderByName(name);
		return demander;
	}
	
	public List getDemanderList() {
		return demanderDao.getDemanderList();
	}
	
	public List getDemanderListByCondition(String searchString) {
		return demanderDao.getDemanderListByCondition(searchString);
	}
	
	public Demander loadDemanderByID(Integer id){
		return demanderDao.load(id);
	}
	
	public void updateVerifyStatus(Integer id,Integer verifyStatus){
		Demander demander = demanderDao.load(id);
		demander.setVerifystatus(verifyStatus);
		demanderDao.update(demander);
	}
}
