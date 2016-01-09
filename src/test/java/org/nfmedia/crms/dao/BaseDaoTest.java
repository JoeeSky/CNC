package org.nfmedia.crms.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.unitils.UnitilsJUnit4;
import org.unitils.spring.annotation.SpringApplicationContext;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-1 上午12:39:07 
 */
@SpringApplicationContext({"classpath:crms-dao.xml"})
public class BaseDaoTest extends UnitilsJUnit4 {

	@SpringApplicationContext
	private ApplicationContext applicationContext;
	
	@Test
	public void testApplication(){
		assertNotNull(applicationContext);
	}
}
