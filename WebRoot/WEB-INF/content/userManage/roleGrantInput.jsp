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
<title>分配功能 到 <s:property value="role.name"/></title>
	<style>
		*{padding:0;margin:0;}
		.browser{margin-left:400px;}
		#importExcel{width:64px;height:25px;margin-left:400px;}
	</style>
</head>
<body>
	<form id="form_save" class="form-horizontal" role="form">
		<%-- <s:iterator value="#request.count">
		<div class="form-group">
			<label class="col-sm-1 control-label"></label>
			<label class="col-sm-1 control-label">用户：</label>
			<div class="col-sm-1 checkbox">
			    <label><input type="checkbox">增加 </label>
			</div>
			<div class="col-sm-1 checkbox">
			    <label><input type="checkbox">查询 </label>
			</div>
			<div class="col-sm-1 checkbox">
			    <label><input type="checkbox">修改</label>
			</div>
			<div class="col-sm-1 checkbox">
			    <label><input type="checkbox">删除 </label>
			</div>
		</div>
		</s:iterator> --%>
		<s:iterator value="#request.funcs">
			<div class="form-group">
				<label class="col-sm-1 control-label"></label>
				<label class="col-sm-1 control-label"><s:property value="[0].top[0].getName()"/></label>
				<div class="col-sm-10">
					<s:iterator value="[0].top[1]" var="func">
					<s:if test="#func.status!=\"N\"">
						<div class="col-sm-2 checkbox"><label>
							<input class="grant" type="checkbox" value='<s:property value="#func.id"/>' 
							<s:if test="#func.status==\"U\"">checked</s:if> >
							<s:property value="#func.name"/>
					    </label></div>
					</s:if>
					</s:iterator>
				</div>
			</div>
		</s:iterator>
	</form>
	<p style="padding-top:60px;padding-left:4px">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" style="background:#AAAAAB;border:1px solid #AAAAAB" onclick="goBack()">返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" ><i class="fa fa-floppy-o"></i>保存</button>
	</p>
</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
	<script src="js/jquery.maxlength.js"></script>
	<script>
		var grantJson=<s:property value="grantJson" escape="false"/>;
		var grantOper={};
		$(document).ready(function(){
			$("#save").click(function(){
					$.ajax({
						url:"role/grant.ajax?tid=<s:property value="tid"/>",
						type:"post",
						data:{'grantJson':JSON.stringify(grantOper)},
						dataType:"json",
						success:function(data){
							if(data.info){
								alert('功能分配成功！');
								location.replace('<%= basePath%>role/list');
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
			
			$(".grant").change(function(){
				var id= $(this).val();
				var isCheck=$(this).is(':checked');
				if(grantJson[id]==isCheck){
					delete grantOper[id];
				}
				else{
					grantOper[id]=isCheck;
				}
			});
			
		});
		function goBack(){
			if(confirm("您确定要放弃相关操作，返回到用户列表中吗？")){
				location.replace('<%= basePath%>role/list');
			}
		}
	</script>
</content>