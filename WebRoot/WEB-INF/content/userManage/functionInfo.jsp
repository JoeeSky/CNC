<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userInfo">
<html>
<head>
<meta charset="utf-8">
<title>功能详细信息</title>
</head>
	<body>
		<form action="" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-3 control-label">功能名</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="function.name"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">功能描述</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="function。description"/></p></div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label">使用状态</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.status"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">排序</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="function.sortOrder"/></p></div>
			</div>
		</form>
	</body>
</html>
</s:i18n>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>