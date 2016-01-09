package org.nfmedia.crms.servlet;


import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.nfmedia.crms.cons.CommonConstant;

/**
 * @author: hongwei
 * @CreateDate: 2014-12-15 上午10:24:26 
 */
@SuppressWarnings("serial")
public class WebIniterServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		String uploadPath = this.getServletContext().getRealPath(CommonConstant.SAVE_PATH);
		System.out.println(uploadPath);
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()){
			if(!uploadDir.mkdir()){
				System.out.println("上传文件夹创建失败");
			}
		}
	}

}
