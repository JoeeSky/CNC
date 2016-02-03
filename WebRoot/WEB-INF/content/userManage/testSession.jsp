<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>测试session</title>
</head>
	<body>
		<button type="button" class="btn btn-custom-primary btn-sm" >一般按钮</button>
		<s:if test='%{@org.nfmedia.crms.util.LoginUtil@isGranted("用户","增加") }' >
			<button type="button"" class="btn btn-custom-primary btn-sm" >添加用户</button>
		</s:if>
	</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>