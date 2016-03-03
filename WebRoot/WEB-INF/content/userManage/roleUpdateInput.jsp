<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改角色信息</title>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		    <input type="text" class="hidden" name="role.id" value='<s:property value="role.id"/>'>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">角色名 <span class="text-danger">*</span></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="role.name"  maxlength="40" value='<s:property value="role.name"/>'></div>
			</div>
			<div class="form-group">
				<label for="companyType" class="col-sm-3 control-label">公司类型<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="role.companyType">
						<s:iterator value="#request.companyType">
							<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(role.companyType)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">描述<span class="text-danger">*</span></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="role.description" maxlength="200" value='<s:property value="role.description"/>'></div>
			</div>
			<div class="form-group">
				<label for="cellphone" class="col-sm-3 control-label">已启用<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="role.enable">
						<s:iterator value="#request.enable">
							<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(role.enable)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">排序</label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="role.sortOrder" value='<s:property value="role.sortOrder"/>' value="20"></div>
			</div>
	</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:1px solid #AAAAAB;margin-left:40%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-40%"><i class="fa fa-floppy-o"></i> 保存</button>
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
					url:"role/update.ajax",
					type:"post",
					data:$("#form_save").serializeArray(),
					dataType:"json",
					success:function(data){
						if(data.info){
							alert('修改成功');
							location.replace('<%= basePath%>role/list');
						}else{
							alert('修改失败');
						}
					},
					error:function(data){
						alert('修改失败');
					}
				});
			});
		    
		});
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回用户列表中吗？")){
				location.replace('<%= basePath%>role/list');
			}
		}
	</script>
</content>