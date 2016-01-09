package org.nfmedia.crms.exception;

/**
 * 自定义的也无异常类
 * @author: hongwei
 * @CreateDate: 2014-11-17 下午5:48:50 
 */
@SuppressWarnings("serial")
public class AuctionException extends Exception {

	/**
	 * @author: hongwei
	 * @CreateDate: 2014-11-17 下午5:48:50 
	 */
	public AuctionException() {
	}

	/**
	 * @author: hongwei
	 * @CreateDate: 2014-11-17 下午5:48:50 
	 * @param message
	 */
	public AuctionException(String message) {
		super(message);
	}


}
