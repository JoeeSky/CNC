package org.nfmedia.crms.service;

import org.nfmedia.crms.dao.DemanderDao;
import org.nfmedia.crms.domain.Demander;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DemanderService {

	@Autowired
	private DemanderDao demanderDao;
	
	
	public void addDemander(Demander demander){
		System.out.println(demander.toString());
//		if(cnc.getDescription().equals(""))
		demander.setDescription("");
//		if(cnc.getVerifystatus().equals(""))
		demander.setVerifystatus(0);
//		if(cnc.getLogo().equals(""))
		demander.setLogo("");
		demanderDao.save(demander);
	}
	
	public Demander loadDemanderByName(String name){
		Demander demander = demanderDao.getDemanderByName(name);
		return demander;
	}
}
