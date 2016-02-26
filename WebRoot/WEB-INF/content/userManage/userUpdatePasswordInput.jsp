<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改用户密码</title>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		    <input type="text" class="hidden" name="user.id" value='<s:property value="#request.tid"/>'>
		    
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">密码 <span class="text-danger">*</span></label>
				<div class="col-sm-4"><input type="password" class="form-control input-sm" name="user.password"></div>
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
					url:"userManage/updatePassword.ajax",
					type:"post",
					data:$("#form_save").serializeArray(),
					dataType:"json",
					success:function(data){
						if(data.info){
							alert('修改成功');
							location.replace('userManage/list');
						}else{
							alert('修改失败');
						}
					},
					error:function(data){
						alert('修改失败');
					}
				})
				
			})
		    
		})
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回用户列表中吗？")){
				location.replace('userManage/list');
			}
		}
	</script>
</content>