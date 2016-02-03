package org.nfmedia.crms.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nfmedia.crms.cons.CommonConstant;
import org.nfmedia.crms.service.ManufacturerTaskDetailsService;
import org.nfmedia.crms.service.ManufacturerTaskService;
import org.nfmedia.crms.service.ProgramTaskService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ManufacturerTaskAction extends ActionSupport{
	private boolean _search;
	private ManufacturerTaskService manufacturerTaskService;
	private ProgramTaskService programTaskService;
	private ManufacturerTaskDetailsService manufacturerTaskDetailsService;
	private String searchString; 
	private int tid;
	private String taskName;
	private String description;
	private String fileType;
	private File upload;
	private String uploadFileName;
	private String taskFilePath;
	private int manufacturerTaskId1;
	
	private void sentMsg(String content) throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(content);
        out.flush();
        out.close();
	}  
	 
	public String  taskBrowse() throws Exception{
		List result = null;
		if(_search == false){
				result=manufacturerTaskService.getManufacturerTaskList();
		}else{
			result=manufacturerTaskService.getManufacturerTaskListByKeyword(searchString);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0,size=result.size();i<size;i++){
			Object[] row = (Object[])result.get(i);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("id", row[0]); //加入id
			
			JSONArray jsonArray2 = new JSONArray(); //求取cell
			jsonArray2.put(row[1]);//任务名
			jsonArray2.put(sdf.format((Date)row[2]));//发布时间
			//jsonArray2.put(row[2]);//发布时间
			jsonArray2.put(row[3]);//发布方 
			jsonArray2.put(row[4]);//接受方
			jsonArray2.put(row[5]);//状态
			jsonArray2.put(row[6]);//任务结果状态
			jsonObject2.put("cell", jsonArray2); //加入cell
			jsonArray.put(jsonObject2);
		}
		jsonObject.put("rows", jsonArray); //加入rows
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String  taskResultBrowse() throws Exception{
		List result = null;
		if(_search == false){
			result=manufacturerTaskService.getManufacturerTaskResultList();
		}else{
			result=manufacturerTaskService.getManufacturerTaskResultListByKeyword(searchString);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0,size=result.size();i<size;i++){
			Object[] row = (Object[])result.get(i);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("id", row[0]); //加入id
			JSONArray jsonArray2 = new JSONArray(); //求取cell
			jsonArray2.put(row[1]);//任务名
			jsonArray2.put(sdf.format((Date)row[2]));//发布时间
			jsonArray2.put(row[3]);//发布方 
			jsonArray2.put(row[4]);//接受方
			jsonArray2.put(row[5]);//状态
			jsonArray2.put(row[6]);//任务结果状态
			jsonObject2.put("cell", jsonArray2); //加入cell
			jsonArray.put(jsonObject2);
		}
		jsonObject.put("rows", jsonArray); //加入rows
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String addManufacturerTask() throws  Exception{
		String rootPath = ServletActionContext.getRequest().getRealPath(CommonConstant.SAVE_PATH);//根目录
		Map session = ActionContext.getContext().getSession();
		Integer demanderUserId = (Integer) session.get(CommonConstant.SESSION_ID);
		Integer demanderId = 1; //session写好后，获取demanderId;
		String filePath = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+"_"+session.get(CommonConstant.SESSION_ID);
		//String filePath = rootPath+childPath;
		File dirPath = new File(rootPath+"/"+filePath);
		//String path=dirPath.getPath();
		if(!dirPath.exists()){//如果文件夹不存在，那么就新建
			dirPath.mkdirs();
		}
		manufacturerTaskService.add(taskName,demanderId,demanderUserId,description,filePath);
		JSONObject jsonObject = new JSONObject();
		int manufacturerTaskId=(Integer) (manufacturerTaskService.getManufacturerTaskIdByTaskName(taskName)).get(0);
		jsonObject.put("manufacturerTaskId", manufacturerTaskId);
		jsonObject.put("filePath", filePath);
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String uploadFile() throws Exception {
		String rootPath = ServletActionContext.getRequest().getRealPath(CommonConstant.SAVE_PATH);//根目录
		Map session = ActionContext.getContext().getSession();
		String filePath =rootPath+"/"+ taskFilePath;

		File dirPath = new File(filePath);
		//String path=dirPath.getPath();
		if(!dirPath.exists()){//如果文件夹不存在，那么就返回
			//dirPath.mkdirs();
			return null;
		}
		if(upload!=null && uploadFileName!=null){
			//String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+uploadFileName.substring(uploadFileName.lastIndexOf('.'));
			//System.out.println("文件最终的保存名："+fileName);
			FileOutputStream fos = new FileOutputStream(dirPath+"/"+uploadFileName);
			FileInputStream fis = new FileInputStream(upload);
			byte[] buffer = new byte[1024*1024];  
	        int length = 0;
	        while((length = fis.read(buffer))>0){
	        	fos.write(buffer, 0, length);
	        }
	        
	        fos.close();
	        fis.close();
		}
		manufacturerTaskDetailsService.add(manufacturerTaskId1,fileType,uploadFileName,taskFilePath+"/"+uploadFileName);
		//建立文件上传的缓存读和写的流
		/*FileOutputStream fos = new FileOutputStream(filePath+"/"+fileName);
		BufferedOutputStream outputStream = new BufferedOutputStream(fos);*/
		//建立文件上传的缓存读和写的流
		/*BufferedOutputStream outputStream =null;//reponse.getWriter(),它也是一个输出流.往浏览器输出的
		BufferedInputStream inputStream = null;
		try {
			//将文件开始输入流
			FileInputStream fis = new FileInputStream(upload);
			inputStream = new BufferedInputStream(fis);
			//输出流
			FileOutputStream out = new FileOutputStream(new File(dirPath,uploadFileName));
			outputStream = new BufferedOutputStream(out);
			//以多少开始读取文件的流 文件，
			byte[] buf = new byte[4096];
			int len = -1;
			while((len = inputStream.read(buf))!=-1){//读客户端的文件
				outputStream.write(buf, 0, len);//写入到服务器
			}
		}catch (Exception e) {
		}*/
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String delectManufacturer() throws  Exception{
		manufacturerTaskService.deleteProgramTaskManufacturer(tid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	public String delectManufacturerTask() throws Exception {
		manufacturerTaskService.delectManufacturerTask(tid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String manufacturerTaskComplete() throws Exception{
		manufacturerTaskService.manufacturerTaskComplete(tid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String acceptTask()throws Exception{
		manufacturerTaskService.acceptManufacturerTask(tid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}
	
	public String refuseTask()throws Exception{
		manufacturerTaskService.refuseManufacturerTask(tid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("info", true);
		sentMsg(jsonObject.toString());
		return null;
	}

	public void set_search(boolean _search) {
		this._search = _search;
	}

	public void setManufacturerTaskService(ManufacturerTaskService manufacturerTaskService) {
		this.manufacturerTaskService = manufacturerTaskService;
	}

	public void setProgramTaskService(ProgramTaskService programTaskService) {
		this.programTaskService = programTaskService;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getTaskFilePath() {
		return taskFilePath;
	}

	public void setTaskFilePath(String taskFilePath) {
		this.taskFilePath = taskFilePath;
	}

	public int getProgramTaskId() {
		return manufacturerTaskId1;
	}

	public void setProgramTaskId(int manufacturerTaskId1) {
		this.manufacturerTaskId1 = manufacturerTaskId1;
	}

	public void setManufacturerTaskDetailsService(
			ManufacturerTaskDetailsService manufacturerTaskDetailsService) {
		this.manufacturerTaskDetailsService = manufacturerTaskDetailsService;
	}
	
	
	
	 

}
