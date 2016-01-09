<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.userManage.userInfo">
<html>
<head>
<meta charset="utf-8">
<title><s:text name="title"/></title>
</head>
	<body>
		<form action="" class="form-horizontal" role="form">
			<!--<div class="form-group">
				<div class="col-sm-3">
					<a href='userManage/userUpdateDo?tid=<s:property value="user.id"/>' class="btn btn-success btn-sm">
						<i class="fa fa-pencil fa-lg"></i> <s:text name="update"/>
					</a>
				</div>
			</div>-->
			<div class="form-group">
				<label class="col-sm-3 control-label"><s:text name="name"/></label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="user.name"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><s:text name="department"/></label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="user.department.name"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><s:text name="email"/></label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="user.email"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><s:text name="cellphone"/></label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="user.cellphone"/></p></div>
			</div>
		</form>
	</body>
</html>
</s:i18n>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>