<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改请求</title>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<input type="text" class="hidden" name="req.id" value='<s:property value="req.id"/>'>
		<div class="form-group">
			<label class="col-sm-3 control-label">url<span class="text-danger">*</span></label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="req.url"  value='<s:property value="req.url"/>'></div>
		</div>
		<div class="form-group">
			<label for="companyType" class="col-sm-3 control-label">所属功能<span class="text-danger">*</span></label>
			<div>
				<div class="col-sm-2">
				<select id="model" class="form-control input-sm">
					<s:iterator value="#request.model" var="modelObject">
						<option value='<s:property value="#modelObject[0].getName()"/>' <s:if test='%{#modelObject[0].getName().equals(#request.modelName)}'>selected</s:if>><s:property value="#modelObject[0].getName()"/></option>
					</s:iterator>
				</select>
				</div>
				<div class="col-sm-2">
				<select id="function" class="form-control input-sm" name="req.functionId">
					<s:iterator value="#request.funcs" var="func">
						<option value='<s:property value="#func.getId()"/>' <s:if test='%{#func.getId().equals(req.getFunctionId())}'>selected</s:if>><s:property value="#func.getName()"/></option>
					</s:iterator>
				</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">已启用<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="req.status">
					<s:iterator value="#request.status">
						<option value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(req.status)}'>selected</s:if> ><s:property value="[0].top[1]"/></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">是否页面<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<s:iterator value="#request.isPage">
					<label class="radio-inline col-sm-2" style="padding-left:28px;padding-right:24px;">
						<input type="radio" name="req.isPage" value='<s:property value="[0].top[0]"/>' <s:if test='%{[0].top[0].equals(req.isPage.toString())}'>checked</s:if>> <s:property value="[0].top[1]"/> 
					</label>
				</s:iterator>
			</div>
		</div>
		
		<div class="form-group">
			<label for="email" class="col-sm-3 control-label">面包屑</label>
			<div class="col-sm-4"><input type="text" class="form-control input-sm" name="req.breadCrumb" value="<s:property value="req.breadCrumb"/>" maxlength="50"><span style="color:#9d9d9d;padding-left:4px">用英文逗号分隔，如用户管理,用户列表</span></div>
		</div>
	</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-40%"><i class="fa fa-floppy-o"></i> 保存</button>
	</p>
</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
	<script src="js/jquery.maxlength.js"></script>
	<script>
		$optionJson=<s:property value="optionJson" escape="false"/>;
		$(document).ready(function(){
			$("#save").click(function(){
				$.ajax({
					url:"request/update.ajax",
					type:"post",
					data:$("#form_save").serializeArray(),
					dataType:"json",
					success:function(data){
						if(data.info){
							alert('修改成功');
							location.replace('request/list');
						}else{
							alert('修改失败');
						}
					},
					error:function(data){
						alert('修改失败');
					}
				});
			});
			$('#model').change(function(){
				$('#function').empty();
				var model=$optionJson[$(this).val()];
				for(var key1 in model){
					var func=model[key1];
					for(var key2 in func)
					$('#function').append('<option value="'+key2+'">'+func[key2]+'</option>');
				}
			});
		    
		});
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回请求列表中吗？")){
				location.replace('request/list');
			}
		}
	</script>
</content>