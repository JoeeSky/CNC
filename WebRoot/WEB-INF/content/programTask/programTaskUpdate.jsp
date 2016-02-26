<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改G代码任务信息</title>
</head>
	<body id="body">
		<form id="form_save" action="" class="form-horizontal" role="form">
		<input type="text" class="hidden" name="programTask.id" value='<s:property value="programTask.id"/>'>
			<div class="form-group">
				<label class="col-sm-3 control-label">任务名</label>
				<div class="col-sm-6"><input type="text"  class="form-control input-sm" name="taskName" maxlength="20" value=<s:property value="programTask.taskName"/> name="programTask.taskName" readonly="readonly" ></div>
			</div>
			<!-- <div class="form-group">
				<label class="col-sm-3 control-label">任务发布方</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.demander.name"/>  ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">任务发布人</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.demanderUser.name"/> ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">CNC编程公司</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.cnc.name"/> ></div>
			</div>		
			<div class="form-group">
				<label class="col-sm-3 control-label">CNC工程师</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.cncUser.name"/> ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">接受状态</label>
				<div class="col-sm-8"><input type="text"  class="input-sm" size="40" value=<s:property value="programTask.status.name"/>></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">完成状态</label>
				<div class="col-sm-8"> <input type="text" class="input-sm" size="40" value=<s:property value="programTask.resultStatus.name"/> ></div>
			</div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label">任务描述</label>
				<div class="col-sm-6"><textarea id="textarea" class="form-control" rows="8" cols="20" maxlength="100"  name="programTask.description" ><s:property value="programTask.description"/></textarea></div>
			</div>
			<form id="form_save1" class="form-horizontal" role="form">
			<div class="form-group">
				<label for="fileType" class="col-sm-3 control-label">文件类型</label>
				<div class="col-sm-6">
					<select class="form-control input-sm" name="fileType">
						<option value="G代码">G代码</option>
	                    <option value="图纸">图纸</option>
	                    <option value="工艺单">工艺单</option>
	                    <option value="作业指导书">作业指导书</option>
	                    <option value="检验指导书">检验指导书</option>
	                    <option value="其他文件">其他文件</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="uploadFile" class="col-sm-3 control-label">上传文件</label>
				<div class="col-sm-6"><input type="file"  name="upload" onchange="upload1()"></div>
			</div>
			<div class="form-group">
				<label for="fileCategory" class="col-sm-3 control-label"></label>
	            <div class="col-sm-6">
		            <ul id="fileList"  style="list-style:none">
		            </ul>
	            </div>	
       		</div>
       		</form>
			<div class="text-center">
				<button  type="button"  class="btn btn-default" onclick="goBack()"><i class="fa fa-times-circle"></i> 取消</button>
				<button id="ok" type="button" class="btn btn-custom-primary" onclick="updataProgramTask()"><i class="fa fa-check-circle"></i> 保存</button>
			</div> 
		</form>
	</body>
</html>
<content tag="scripts">
	<script type="text/javascript" src="../../../js/jquery.min.js"></script>
	<script>
	    var id = $("input[name='programTask.id']").val();
	    var newFileInfo={};
	    var delFileInfo={};
	    function upload1(){
	    	/* var fileType=$("select[name='fileType']").val();
		 	var filePath=$("input[name='upload']").val();
		 	var n=filePath.lastIndexOf("\\");
		 	var fileName=filePath.substring(filePath.lastIndexOf("\\")+1); */
		 	newFileInfo.push($("#form_save1").ajaxForm(options));
	    }
		function updataProgramTask(){
		alert(newFileInfo);
			$.ajax({
		    		url:"programTask/updataProgramTask.ajax",
					type:"get",
					dataType:"json",
					data:{tid:id,description:$("#textarea").val()},
					success:function(data){
						alert('修改成功！');
						location.replace('programTask/programTaskList');
					},
					error:function(data){
						alert('修改失败！');
					}
		    	})
		}

		function goBack(){
			if(confirm("您确定要放弃相关操作，返回G代码任务列表吗？")){
				location.replace('programTask/programTaskList');
			}
		} 
		
		function getFileList(){
				 $.ajax({
					  		type:"post",
					  		dataType:"json",
					  		url:"programTask/getFileList.ajax?tid="+id,
					  		success:function(data){ 	
					  			var jsonData = data.info;
					  			//在状态select框中加载状态(option)
					  			for(var i=0, n = jsonData.length;i<n;i++){
					  				$("#fileList").append("<li> <div class='col-sm-2'><a class='fileType'>"+jsonData[i][1]+"</a></div><div class='col-sm-9'><a>"+jsonData[i][2]+"</a></div><div class='col-sm-1'><button style='border:0;background:none;color:red;'>X</button></div></li>");
					  			/* 	$("#status").append("<option  value='"+jsonData[i]+"'>"+jsonData[i]+"</option>"); */		
					  			}
					  		}
					  });
			}
		 
		$(function(){
			getFileList();
		})
	
	</script>
</content>