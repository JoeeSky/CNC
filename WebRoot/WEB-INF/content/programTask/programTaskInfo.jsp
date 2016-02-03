<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改公司信息</title>
</head>
	<body id="body">
		<form id="form_save" action="" class="form-horizontal" role="form">
			<input type="text" class="hidden" name="cnc.id" value='<s:property value="cnc.id"/>'>
			<div class="form-group">
				<label class="col-sm-3 control-label"> </label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.name"/> name="cnc.name"   readonly="readonly"></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司类型</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.description"/> name="cnc.description"  readonly="readonly"></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">名称拼音</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.pinyin"/> name="cnc.pinyin"  readonly="readonly"></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司地址</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.address"/> name="cnc.address" ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.contact"/> name="cnc.contact" ></div>
			</div>		
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.email"/> name="cnc.email" ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.mobile"/> name="cnc.mobile" ></div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">固定电话</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.tel"/> name="cnc.tel" ></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">审核状态</label>
				<div class="col-sm-8"><input id="verifystatus" type="text" class="input-sm" size="40" value=<s:property value="cnc.verifystatus"/>  readonly="readonly"></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司网站链接</label>
				<div class="col-sm-8"><input type="text" class="input-sm" size="40" value=<s:property value="cnc.url"/> name="cnc.url" ></div>
			</div>	
			<div class="form-group" id="button">
			</div>	
		</form>
	<p class="text-center">
		<button type="button" class="btn btn-custom-primary btn-sm" id="back" onclick="goBack()" style="float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:35%;width:63px"></i>返回</button>
		<button type="button" class="btn btn-custom-primary btn-sm" id="save" style="margin-left:-45%"><i class="fa fa-floppy-o"></i> 保存</button>
	</p>
	</body>
</html>
<content tag="scripts">
	<script src="js/king-common.js"></script>
</content>