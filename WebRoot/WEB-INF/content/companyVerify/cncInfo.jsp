<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>公司详细信息</title>
</head>
	<body id="body">
		<form action="" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-3 control-label">公司名称</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.name"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司类型</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.description"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">名称拼音</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.pinyin"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司地址</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.address"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系人</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.contact"/></p></div>
			</div>		
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.email"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">手机</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.mobile"/></p></div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">固定电话</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.tel"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">审核状态</label>
				<div class="col-sm-4"><p id="verifystatus" class="form-control-static"><s:property value="cnc.verifystatus"/></p></div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">公司网站链接</label>
				<div class="col-sm-4"><p class="form-control-static"><s:property value="cnc.url"/></p></div>
			</div>	
			<div class="form-group" id="button">
			</div>	
		</form>
	</body>
</html>
<content tag="scripts">
	<script type="text/javascript" src="../../../js/jquery.min.js"></script>
	<script>
	if(<s:property value="cnc.verifystatus"/>==0){
		$("#verifystatus").text("未审核");
		var btn=$("<button type='button' onclick='passVerify()' class='btn btn-custom-primary btn-sm'  style='margin-left:8%'>通过审核</button><button type='button' onclick='noPassVerify()' class='btn btn-custom-primary btn-sm'  style='margin-left:5%'> 不通过审核</button>");
		$("#button").append(btn);
	}else if(<s:property value="cnc.verifystatus"/>==1){
		$("#verifystatus").text("审核通过");
	}else{
		$("#verifystatus").text("审核未通过");
		var btn=$("<button type='button' onclick='passVerify()' class='btn btn-custom-primary btn-sm'  style='margin-left:12%'>通过审核</button>");
		$("#button").append(btn);
	}
		function passVerify(){
		id = <s:property value="cnc.id"/>;
		$.ajax({
		url:"verify/updateCncVerifyStatus.ajax",
		type:"post",
		data:{"id":id,"verifyStatus":1},
		dataType:"json",
		success:function(data){
			if(data.info){
				alert('成功！');
				location.reload();
				//$("#form_save")[0].reset();
			}else{
				alert('失败！');
			}
		},
		error:function(data){
			alert('失败！');
			}
		})
	}
	
	function noPassVerify(){
		id = <s:property value="cnc.id"/>;
		$.ajax({
		url:"verify/updateCncVerifyStatus.ajax",
		type:"post",
		data:{"id":id,"verifyStatus":2},
		dataType:"json",
		success:function(data){
			if(data.info){
				alert('成功！');
				location.reload();
				//$("#form_save")[0].reset();
			}else{
				alert('失败！');
			}
		},
		error:function(data){
			alert('失败！');
			}
		})
	}
	</script>
</content>