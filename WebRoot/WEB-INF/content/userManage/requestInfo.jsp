<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userInfo">
<html>
<head>
<meta charset="utf-8">
<title>请求详细信息</title>
</head>
	<body>
		<form action="" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-3 control-label">url</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="req.url"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">所属功能</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.functionPath"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">使用状态</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.status"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否页面</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.isPage"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">面包屑</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.breadCrumb"/></p></div>
			</div>
		</form>
	</body>
</html>
</s:i18n>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>