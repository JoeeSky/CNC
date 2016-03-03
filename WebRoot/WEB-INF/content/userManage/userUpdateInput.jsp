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
<title>修改用户信息</title>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		    <input type="text" class="hidden" name="user.id" value='<s:property value="user.id"/>'>
		    <div class="form-group" style="margin-bottom:0;">
				<label for="name" class="col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<ul id="userNameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">姓名 <span class="text-danger">*</span></label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.name" maxlength="20" value='<s:property value="user.name"/>'></div>
			</div>
			<div class="form-group">
				<label for="companyType" class="col-sm-3 control-label">公司类型<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" id="companyType" name="user.companyType">
						<s:iterator value="#request.companyType">
							<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(user.companyType)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="companyId" class="col-sm-3 control-label">公司<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" id="companyId" name="user.companyId">
						<s:iterator value="#request.companyList">
							<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="role" class="col-sm-3 control-label">角色<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="user.role.id">
						<s:iterator value="#request.roles">
							<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(user.role.id)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.email" value='<s:property value="user.email"/>' maxlength="50"></div>
			</div>
			<div class="form-group">
				<label for="cellphone" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-4"><input type="text" class="form-control input-sm" name="user.cellphone" value='<s:property value="user.cellphone"/>' maxlength="20"></div>
			</div>
			<div class="form-group">
				<label for="status" class="col-sm-3 control-label">用户状态<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<select class="form-control input-sm" name="user.status">
						<s:iterator value="#request.userStatus">
							<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(user.status)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
						</s:iterator>
					</select>
				</div>
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
					url:"userManage/update.ajax",
					type:"post",
					data:$("#form_save").serializeArray(),
					dataType:"json",
					success:function(data){
						if(data.info){
							alert('修改成功');
							location.href='<%= basePath%>userManage/list';
							//location.reload();
						}else{
							alert('修改失败');
						}
					},
					error:function(data){
						alert('修改失败');
					}
				})
				
			});
			
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
		    
		})
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回用户列表中吗？")){
				location.href='<%= basePath%>userManage/list';
			}
		}
	</script>
</content>