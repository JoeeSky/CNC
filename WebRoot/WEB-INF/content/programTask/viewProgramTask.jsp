<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查看G代码任务信息</title>
</head>
	<body id="body">
		<form id="form_save" action="" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-3 control-label">任务名</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.taskName"/> name="programTask.taskName" readonly="readonly" ></div>
			</div>
			<!-- <div class="form-group">
				<label class="col-sm-3 control-label">任务发布方</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.demander.name"/> name="programTask.demander.name" readonly="readonly" ></div>
			</div> -->
			<!-- <div class="form-group">
				<label class="col-sm-3 control-label">任务发布人</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.demanderUser.name"/> ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">CNC编程公司</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.cnc.name"/> ></div>
			</div>		
			<div class="form-group">
				<label class="col-sm-3 control-label">CNC工程师</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="programTask.cncUser.name"/> ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">接受状态</label>
				<div class="col-sm-8"><input type="text"  class="input-sm" size="40" value=<s:property value="programTask.status.name"/>></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">完成状态</label>
				<div class="col-sm-8"> <input type="text" class="input-sm" size="40" value=<s:property value="programTask.resultStatus.name"/> ></div>
			</div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label">任务相关文件</label>
				<div class="col-sm-8">
				<ul style="list-style:none">
						<li><p class="col-sm-3" ><s:property value="programTaskAttachment.type"/></p><p class="col-sm-9"><s:property value="programTaskAttachment.fileName"/></p></li>
					</ul>
				</div>
			</div>	
			<div class="form-group">
				<label class="col-sm-3 control-label">任务描述</label>
				<%-- <div class="col-sm-8"><p class="form-control-static"><s:property value="programTask.description"/></p></div> --%>
				<div class="col-sm-4"><textarea id="textarea" class="form-control" rows="8" cols="20" maxlength="100" value=<s:property value="programTask.description"/> name="programTask.description" readonly="readonly"><s:property value="programTask.description"/></textarea></div>
			</div>	
			
		</form>
	</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>