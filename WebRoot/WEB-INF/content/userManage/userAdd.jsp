<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userAdd">
<html>
<head>
<meta charset="utf-8">
<title><s:text name="title"/></title>
	<style>
		*{padding:0;margin:0;}
		.browser{margin-left:400px;}
		#importExcel{width:64px;height:25px;margin-left:400px;}
	</style>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<div class="form-group" style="margin-bottom:0;">
			<label for="account" class="col-sm-3 control-label"></label>
			<div class="col-sm-4">
				<ul id="accountCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
			</div>
		</div>
		<div class="form-group">
			<label for="account" class="col-sm-3 control-label"><s:text name="account"/> <span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.account" maxlength="20" onpropertychange="checkAccount(this.value)" oninput="checkAccount(this.value)"></div>
		</div>
		<div class="form-group" style="margin-bottom:0;">
			<label for="name" class="col-sm-3 control-label"></label>
			<div class="col-sm-4">
				<ul id="nameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label"><s:text name="name"/> <span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.name" maxlength="20" onpropertychange="checkName(this.value)" oninput="checkName(this.value)"></div>
		</div>
		<div class="form-group">
			<label for="role" class="col-sm-3 control-label"><s:text name="role"/></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="user.role.id">
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
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.email" maxlength="50"></div>
		</div>
		<div class="form-group">
			<label for="cellphone" class="col-sm-3 control-label"><s:text name="cellphone"/></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.cellphone" maxlength="20"></div>
		</div>
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
		var nameValid = false;
		//检查账号是否为空以及是否重复
		function checkAccount(value){
			if(value){
				$.ajax({
					url:"userManage/checkAccount.ajax?account="+value,
					type:"get",
					dataType:"json",
					success:function(data){
						if(!data.info){
							$("#accountCheck span").text('<s:text name="accountExist"/>');
							$("#accountCheck").removeClass("hidden");
							nameValid = false;
						}else{
							$("#accountCheck").addClass("hidden");
							nameValid = true;
						}
					}
				})
			}else{
				$("#accountCheck").addClass("hidden");
			}
		}
		//检查姓名是否为空
		function checkName(value){
			if(value!=""){
				$("#nameCheck").addClass("hidden");
				nameValid = true;
			}else{
				$("#nameCheck span").text('<s:text name="nameNotNull"/>');
				$("#nameCheck").removeClass("hidden");
				nameValid = false;
			}
		}
		$(document).ready(function(){
			$("#save").click(function(){
				if(!$("input[name='user.account']").val()){
					nameValid = false;
					$("#accountCheck span").text('<s:text name="accountNotNull"/>');
					$("#accountCheck").removeClass("hidden");
				}
				if(!$("input[name='user.name']").val()){
					nameValid = false;
					$("#nameCheck span").text('<s:text name="nameNotNull"/>');
					$("#nameCheck").removeClass("hidden");
				}
				if(nameValid){
					$.ajax({
						url:"userManage/addUser.ajax",
						type:"post",
						data:$("#form_save").serializeArray(),
						dataType:"json",
						success:function(data){
							if(data.info){
								alert('<s:text name="saveSuccess"/>');
								location.reload();
								//$("#form_save")[0].reset();
							}else{
								alert('<s:text name="saveFailed"/>');
							}
						},
						error:function(data){
							alert('<s:text name="saveFailed"/>');
						}
					})
				}
			})
	

			$("input[name='user.account']").maxlength({
		    	maxCharacters:20,
		    	status:false,
	        	showAlert:true,
	        	alertText:"您输入的长度过长！"
		    })
		    $("input[name='user.name']").maxlength({
		    	maxCharacters:20,
		    	status:false,
	        	showAlert:true,
	        	alertText:"您输入的长度过长！"
		    })
		})
				function goBack(){
			if(confirm("您确定要放弃相关操作，返回到用户列表中吗？")){
				location.replace('userManage/userList');
			}
		}
	</script>
</content>
</s:i18n>