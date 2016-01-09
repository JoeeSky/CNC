<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userAdd">
<html>
<head>
<meta charset="utf-8">
<title><s:text name="title2"/></title>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<fieldset>
		    <input type="text" class="hidden" name="user.id" value='<s:property value="user.id"/>'>
		    <div class="form-group" style="margin-bottom:0;">
				<label for="name" class="col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<ul id="userNameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label"><s:text name="name"/> <span class="text-danger">*</span></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.name" value='<s:property value="user.name"/>'></div>
			</div>
			<div class="form-group">
				<label for="role" class="col-sm-3 control-label"><s:text name="role"/></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="user.role.id" id="role_id">
						<s:iterator value="#request.roles">
							<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="role" class="col-sm-3 control-label"><s:text name="department"/></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="user.department.id">
						<s:iterator value="#request.departments">
							<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label"><s:text name="email"/></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.email" value='<s:property value="user.email"/>' maxlength="50"></div>
			</div>
			<div class="form-group">
				<label for="cellphone" class="col-sm-3 control-label"><s:text name="cellphone"/></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.cellphone" value='<s:property value="user.cellphone"/>' maxlength="20"></div>
			</div>
		</fieldset>
	</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-40%"><i class="fa fa-floppy-o"></i> <s:text name="save"/></button>
	</p>
</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
	<script src="js/jquery.maxlength.js"></script>
	<script>
		var role = '<s:property value="user.role.id"/>';
		var nameValid = true;
		$(document).ready(function(){

			$("#role_id").val(role);

			$("#save").click(function(){
				if(!$("input[name='user.name']").val()){
					nameValid = false;
					$("#userNameCheck span").text('<s:text name="nameNotNull"/>');
					$("#userNameCheck").removeClass("hidden");
				}
				if(nameValid){
					$.ajax({
						url:"userManage/updateUser.ajax",
						type:"post",
						data:$("#form_save").serializeArray(),
						dataType:"json",
						success:function(data){
							if(data.info){
								alert('<s:text name="updateSuccess"/>');
								location.replace('userManage/userList');
								//location.reload();
							}else{
								alert('<s:text name="updateFailed"/>');
							}
						},
						error:function(data){
							alert('<s:text name="updateFailed"/>');
						}
					})
				}
			})
		    $("input[name='user.name']").maxlength({
		    	maxCharacters:20,
		    	status:false,
	        	showAlert:true,
	        	alertText:"您输入的长度过长！"
		    })
		})
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回用户列表中吗？")){
				location.replace('userManage/userList');
			}
		}
	</script>
</content>
</s:i18n>