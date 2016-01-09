package org.nfmedia.crms.dao;

import static org.junit.Assert.*;

import org.junit.Test;
//import org.nfmedia.crms.domain.Brand;
import org.unitils.spring.annotation.SpringBean;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-1 下午5:11:27 
 */
public class BrandDaoTest extends BaseDaoTest {

	@SpringBean("brandDao")
//	private BrandDao brandDao;
	
	@Test
	public void testGetBrandByName()throws Exception{
	//	Brand brand = brandDao.getBrandByName("zhw");
	//	assertNotNull(brand);
	}
}
