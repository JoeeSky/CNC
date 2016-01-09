package org.nfmedia.crms.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author: hongwei
 * @Description: 所有PO类都直接或间接继承该类
 * @CreateDate: 2014-11-13 下午6:44:51 
 */
public class BaseDomain implements Serializable {

	/**
	 * @author: hongwei
	 * @Description: serialVersionUID
	 * @CreateDate: 2014-11-13 下午6:45:20
	 */
	private static final long serialVersionUID = -4266677738228443173L;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
