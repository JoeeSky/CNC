<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加用户</title>
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
			<label for="account" class="col-sm-3 control-label">账号<span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.account" maxlength="20" onpropertychange="checkAccount(this.value)" oninput="checkAccount(this.value)"></div>
		</div>
		<div class="form-group" style="margin-bottom:0;">
			<label for="name" class="col-sm-3 control-label"></label>
			<div class="col-sm-4">
				<ul id="nameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-3 control-label">姓名<span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.name" maxlength="20" onpropertychange="checkName(this.value)" oninput="checkName(this.value)"></div>
		</div>
		<div class="form-group">
			<label for="companyType" class="col-sm-3 control-label">公司类型<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" id="companyType" name="user.companyType">
					<s:iterator value="#request.companyType">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="companyId" class="col-sm-3 control-label">公司<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" id="companyId" name="user.companyId">
					<%-- <s:iterator value="#request.roles">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator> --%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="role" class="col-sm-3 control-label">角色<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="user.role.id">
					<s:iterator value="#request.roles">
						<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-3 control-label">邮箱</label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.email" maxlength="50"></div>
		</div>
		<div class="form-group">
			<label for="cellphone" class="col-sm-3 control-label">手机</label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.cellphone" maxlength="20"></div>
		</div>
		<input type="text" class="hidden" name="user.status" value="F">
	</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:1px solid #AAAAAB;margin-left:40%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-40%"><i class="fa fa-floppy-o"></i>保存</button>
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
							$("#accountCheck span").text('该账号已存在');
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
				$("#nameCheck span").text('姓名不能为空');
				$("#nameCheck").removeClass("hidden");
				nameValid = false;
			}
		}
		$(document).ready(function(){
			$("#save").click(function(){
				if(!$("input[name='user.account']").val()){
					nameValid = false;
					$("#accountCheck span").text('账号不得为空"/>');
					$("#accountCheck").removeClass("hidden");
				}
				if(!$("input[name='user.name']").val()){
					nameValid = false;
					$("#nameCheck span").text('姓名不能为空');
					$("#nameCheck").removeClass("hidden");
				}
				if(nameValid){
					$.ajax({
						url:"userManage/add.ajax",
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
					})
				}
			})
			
			
			$("#companyType").change(function(){
				 $.ajax({
						url:"userManage/companyListAjax.ajax?companyType="+$("#companyType").val(),
						type:"get",
						dataType:"json",
						success:function(data){
							$("#companyId option").remove();
							
							for(var key in data)
								$("#companyId").append("<option value='"+data[key].id+"'>"+data[key].name+"</option>");
						}
				});
				 
			}); 

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
				location.replace('userManage/list');
			}
		}
	</script>
</content>