<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userInfo">
<html>
<head>
<meta charset="utf-8">
<title>菜单项详细信息</title>
</head>
	<body>
		<form action="" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单项标题</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="menu.title"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否顶级菜单</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.isTop"/></p></div>
			</div>
			<s:if test='%{menu.parentId!=0}'>
				<div class="form-group">
					<label class="col-sm-3 control-label">父菜单项</label>
					<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.parent"/></p></div>
				</div>
			</s:if>
			<div class="form-group">
				<label class="col-sm-3 control-label">url</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="menu.url"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">所属功能</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="#request.functionPath"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">排序权重</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="menu.sortOrder"/></p></div>
			</div>
		</form>
	</body>
</html>
</s:i18n>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>