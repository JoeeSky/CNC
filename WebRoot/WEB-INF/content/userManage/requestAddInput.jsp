<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加请求</title>
	<style>
		*{padding:0;margin:0;}
		.browser{margin-left:400px;}
		#importExcel{width:64px;height:25px;margin-left:400px;}
	</style>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-3 control-label">url<span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="req.url" maxlength="20"></div>
		</div>
		<div class="form-group">
			<label for="companyType" class="col-sm-3 control-label">所属功能<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="role.companyType">
					<s:iterator value="#request.companyType">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
				<select class="form-control input-sm" name="role.companyType">
					<s:iterator value="#request.companyType">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">已启用<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="req.status">
					<s:iterator value="#request.enable">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">是否页面</label>
			<div class="col-sm-4">
				<s:iterator value="#request.isPage">
					<input type="radio" class="radio col-sm-2" name="req.isPage" value='<s:property value="[0].top[0]"/>'> <s:property value="[0].top[1]"/> 
				</s:iterator>
			</div>
		</div>
		
		<div class="form-group">
			<label for="email" class="col-sm-3 control-label">面包屑</label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="req.breadCrumb" maxlength="50">用英文逗号分隔，如用户管理,用户列表</div>
		</div>
	</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-40%"><i class="fa fa-floppy-o"></i>保存</button>
	</p>
</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
	<script src="js/jquery.maxlength.js"></script>
	<script>
		$(document).ready(function(){
			$("#save").click(function(){
					$.ajax({
						url:"role/add.ajax",
						type:"post",
						data:$("#form_save").serializeArray(),
						dataType:"json",
						success:function(data){
							if(data.info){
								alert('用户已添加成功！');
								location.reload();
								//$("#form_save")[0].reset();
							}else{
								alert('保存失败');
							}
						},
						error:function(data){
							alert('保存失败');
						}
					});
			});
			
		});
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回到用户列表中吗？")){
				location.replace('userManage/list');
			}
		}
	</script>
</content>