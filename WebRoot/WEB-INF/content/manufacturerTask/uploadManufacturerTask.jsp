<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.css">
    <style>
    	#nextStep{display:none}
    </style>
    <title>上传机加工任务</title>
  </head>
  
  <body>
  <div id="firstStep">
  <form id="form_save1" class="form-horizontal" role="form">
		<div class="form-group" style="margin-bottom:0;">
			<label for="name" class="col-sm-3 control-label"></label>
			<div class="col-sm-9">
				<ul id="nameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
			</div>
		</div>
		<div class="form-group">
			<label for="taskName" class="col-sm-3 control-label">任务名 <span class="text-danger">*</span></label>
			<div class="col-sm-6"><input type="text" class="form-control input-sm" name="taskName" maxlength="20" onpropertychange="checkName(this.value)" oninput="checkName(this.value)"></div>
		</div>
		
		<div class="form-group">
				<label for="description" class="col-sm-3 control-label">描述</label>
				<div class="col-sm-6">
					<textarea id="textarea" class="form-control" rows="6" cols="30" maxlength="100" name="description"></textarea>
					<p class="help-block text-right js-textarea-help"><span class="text-muted"></span></p>
				</div>
		</div>
	</form>
	<p class="text-center   btnGroup1" >
		<button type="button" class="btn btn-custom-primary btn-large" id="back" onclick="goBack()" style="margin-top:3%;float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:85px">返回</button>
		<button type="button" class="btn btn-custom-primary btn-large" id="next" style="float:left;margin-left:5%;margin-top:3%"><i class="fa fa-floppy-o"></i>下一步</button>
	</p>  
	</div>
	 <div id="nextStep">
		<form id="form_save2" class="form-horizontal" role="form" style="margin-top:10%">
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
		<!-- <div class="col-sm-5" name="fileList" style="float:left"> -->
			<label for="fileCategory" class="col-sm-3 control-label"></label>
            <div class="col-sm-6">
	            <ul id="fileList"  style="list-style:none">
	            </ul>
            </div>	
        </div>
		</form>
		<p class="text-center   btnGroup1" >
			<button type="button" class="btn btn-custom-primary btn-large" id="save" style="margin-top:6%"><i class="fa fa-floppy-o"></i>完成</button>
		</p> 
	</div>	
  </body>
</html>

<content tag="scripts">
	<script src="js/i18n/grid/grid.locale-cn.js"></script>
	<script>
		$.jgrid.useJSON = true;
	</script>
	<!--bootstrap日期选择器-->
    <script src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="js/i18n/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <!--ajax提交表单-->
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.maxlength.js"></script>
	<script>
	var taskFilePath;
	var manufacturerTaskId;
	$("#save").click(function(){
		location.replace('manufacturerTask/manufacturerTaskList');
	})
	function checkName(value){
		if(value==""){
			$("#nameCheck span").text("任务名不能为空");
			$("#nameCheck").removeClass("hidden");
		}else{
			$("#nameCheck").addClass("hidden");
		}
	}
	$("#next").click(function(){
		var options ={
	 				url:"manufacturerTask/addManufacturerTask.ajax",
					type:"post",
					dataType:"json",
					success:function(data){
						taskFilePath=data.filePath;
						manufacturerTaskId=data.manufacturerTaskId;
						$("#firstStep").css('display','none'); 
						$("#nextStep").css('display','block');
					},
					error:function(data){
						alert('操作失败！');
						location.replace();
					}
		}
		$("#form_save1").ajaxForm(options).submit();
	})
	 function upload1(){
	 	var fileType=$("select[name='fileType']").val();
	 	var filePath=$("input[name='upload']").val();
	 	alert(manufacturerTaskId);
	 	var n=filePath.lastIndexOf("\\");
	 	var fileName=filePath.substring(filePath.lastIndexOf("\\")+1);
	 	var options ={
	 				url:"manufacturerTask/uploadFile.ajax?taskFilePatn="+filePath,
					type:"post",
					dataType:"json",
					data:{"taskFilePath":taskFilePath,"manufacturerTaskId":manufacturerTaskId},
					success:function(data){
						if(fileName){
						$("#fileList").append("<li> <div class='col-sm-8'><a class='fileName'>"+fileName+"</a></div><div class='col-sm-3'><a>"+fileType+"</a></div><div class='col-sm-1'><button style='border:0;background:none;color:red;'>X</button></div></li>");
						}
					},
					error:function(data){
						alert('添加附件失败！');
					}
		}
	 	$("#form_save2").ajaxForm(options).submit();
	 	/* $.ajax({
		    		url:"programTask/uploadFile.ajax?uploadFile="+uploadFile,
					type:"get",
					dataType:"json",
					success:function(data){
						alert('清除成功');
					},
					error:function(data){
						alert('清除失败！');
					}
		    	})
		if(fileName){
			$("#fileList").append("<li> <div class='col-sm-8'><a class='fileName'>"+fileName+"</a></div><div class='col-sm-3'><a>"+fileType+"</a></div><div class='col-sm-1'><button style='border:0;background:none;color:red;'>X</button></div></li>");
		} */
	}
		//Text Area With Character Count
		    var count = 100;
	        $(".js-textarea-help span").html("限制"+count + "字 "),
	        $(".description").keyup(function() {
	            var a = $(".description").val().length,
	            t = count - a;
	            $(".js-textarea-help span").html("还剩"+t + " 字")
	        });
	</script>
</content>
