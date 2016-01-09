<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传机加工任务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  <form id="form_save" class="form-horizontal" role="form">
  	<div class="col-sm-7"style="float:left">
		<div class="form-group" style="margin-bottom:0;">
			<label for="name" class="col-sm-4 control-label"></label>
			<div class="col-sm-8">
				<ul id="nameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-4 control-label">任务名 <span class="text-danger">*</span></label>
			<div class="col-sm-8"><input type="text" class="form-control input-sm" name="task.name" maxlength="20" onpropertychange="checkName(this.value)" oninput="checkName(this.value)"></div>
		</div>
		<div class="form-group">
			<label for="fileCategory" class="col-sm-4 control-label">文件类型</label>
			<div class="col-sm-8">
				<select class="form-control input-sm" name="file.category">
					<option value="">G代码</option>
                    <option value="">图纸</option>
                    <option value="">工艺单</option>
                    <option value="">作业指导书</option>
                    <option value="">检验指导书</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="uploadFile" class="col-sm-4 control-label">上传文件</label>
			<div class="col-sm-8"><input type="file"  name="uploadFile" ></div>
		</div>
	</div>
		<div class="col-sm-5" name="fileList" style="float:left">
            <ol>
                <li>&nbsp;&nbsp;&nbsp;<a class="fileName">fileName1</a>(<a class="fileCategory" style="color:#000">fileCategory</a>)&nbsp;&nbsp;&nbsp;<button style="border:0;background:none;color:red;">X</button></li>
                <li>&nbsp;&nbsp;&nbsp;<a class="fileName">fileName2</a>(<a class="fileCategory" style="color:#000">fileCategory</a>)&nbsp;&nbsp;&nbsp;<button style="border:0;background:none;color:red">X</button></li>
                <li>&nbsp;&nbsp;&nbsp;<a class="fileName">fileName3</a>(<a class="fileCategory" style="color:#000">fileCategory</a>)&nbsp;&nbsp;&nbsp;<button style="border:0;background:none;color:red">X</button></li>
                <li>&nbsp;&nbsp;&nbsp;<a class="fileName">fileName4</a>(<a class="fileCategory" style="color:#000">fileCategory</a>)&nbsp;&nbsp;&nbsp;<button style="border:0;background:none;color:red">X</button></li>
                <li>&nbsp;&nbsp;&nbsp;<a class="fileName">fileName5</a>(<a class="fileCategory" style="color:#000">fileCategory</a>)&nbsp;&nbsp;&nbsp;<button style="border:0;background:none;color:red">X</button></li>
            </ol>	
        </div>
	</form>
	<p class="text-center" style="margin-top:50px">
		<button type="button" class="btn btn-custom-primary btn-large" id="back" onclick="goBack()" style="margin-top:10%;float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:85px"></i>取消</button>
		<button type="button" class="btn btn-custom-primary btn-large" id="save" style="float:left;margin-left:5%;margin-top:10%"><i class="fa fa-floppy-o"></i>确定</button>
	</p>
    

  </body>
</html>
