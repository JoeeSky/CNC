<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加角色</title>
	<style>
		*{padding:0;margin:0;}
		.browser{margin-left:400px;}
		#importExcel{width:64px;height:25px;margin-left:400px;}
	</style>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label">角色名<span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="role.name" maxlength="20"></div>
		</div>
		<div class="form-group">
			<label for="companyType" class="col-sm-3 control-label">公司类型<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="role.companyType">
					<s:iterator value="#request.companyType">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-3 control-label">描述</label>
			<div class="col-sm-4"><textarea class="form-control input-sm" name="role.description" maxlength="150"></textarea></div>
		</div>
		<div class="form-group">
			<label for="cellphone" class="col-sm-3 control-label">已启用<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="role.enable">
					<s:iterator value="#request.enable">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-3 control-label">排序</label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="role.sortOrder" maxlength="50"></div>
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
								alert('角色已添加成功！');
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
			if(confirm("您确定要放弃相关操作，返回到角色列表中吗？")){
				location.replace('role/list');
			}
		}
	</script>
</content>