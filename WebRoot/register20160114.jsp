<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公司注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/king-common.js"></script>
	<script type="text/javascript" src="js/jquery.maxlength.js"></script>
	<script type="text/javascript" src="js/my-registerValidate.js"></script>
	
  </head>
  
  <body>
  <div class="content">
			<div class="main-content">
				<ul class="nav nav-tabs">
					<li style="margin:9px 20px 5px 20px;font-size:14px">
						请选择注册公司类型
					</li>				
					<li class="active">
						<a href="#demander-tab" data-toggle="tab">
							需求方
						</a>
					</li>
					<li >
						<a href="#cnc-tab" data-toggle="tab">
							数控工厂
						</a>
					</li>
					<li>
						<a href="#manufacturer-tab" data-toggle="tab">
							制造商
						</a>
					</li>					
				</ul>
			    <div class="tab-content">
			   		<div class="tab-pane active" id="demander-tab">
			   			<h2>需求方注册</h2>
						<form id="form_demander" class="form-horizontal" role="form">
					  	<div class="col-sm-7"style="float:left">
							<div class="form-group" style="margin-bottom:0;">
								<label for="name" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="nameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-4 control-label">公司名称 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" id="demander.name" name="demander.name" maxlength="20" onpropertychange="dcheckName(this.value)" oninput="dcheckName(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="pinyin" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="pinyinCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="pinyin" class="col-sm-4 control-label">名称拼音 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.pinyin" maxlength="20" onpropertychange="dcheckPinyin(this.value)" oninput="dcheckPinyin(this.value)"></div>
							</div>		
							<div class="form-group" style="margin-bottom:0;">
								<label for="address" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="addressCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-4 control-label">公司地址 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.address" maxlength="20" onpropertychange="dcheckAddress(this.value)" oninput="dcheckAddress(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="contact" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="contactCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="contact" class="col-sm-4 control-label">联系人 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.contact" maxlength="20" onpropertychange="dcheckContact(this.value)" oninput="dcheckContact(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="email" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="emailCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">电子邮箱 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.email" maxlength="20" onpropertychange="dcheckEmail(this.value)" oninput="dcheckEmail(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="mobile" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mobileCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="mobile" class="col-sm-4 control-label">手机 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.mobile" maxlength="20" onpropertychange="dcheckMobile(this.value)" oninput="dcheckMobile(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="tel" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="telCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="tel" class="col-sm-4 control-label">固定电话 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.tel" maxlength="20" onpropertychange="dcheckTel(this.value)" oninput="dcheckTel(this.value)"></div>
							</div>
							<div class="form-group">
								<label for="uploadFile" class="col-sm-4 control-label">公司Logo</label>
								<div class="col-sm-8"><input type="file"  name="uploadFile" ></div>
							</div>
							<div class="form-group">
								<label for="url" class="col-sm-4 control-label">公司网址 </label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="demander.url" maxlength="20" onpropertychange="dcheckUrl(this.value)" oninput="dcheckUrl(this.value)"></div>
							</div>		
						</div>
					
						</form>
						<p class="text-center" style="margin-top:50px">
							<button type="button" class="btn btn-custom-primary btn-large" id="back" onclick="goBack()" style="margin-top:10%;float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:85px">取消</button>
							<button type="button" class="btn btn-custom-primary btn-large" id="demander_save" style="float:left;margin-left:5%;margin-top:10%"><i class="fa fa-floppy-o"></i>确定</button>
						</p>
					</div>
					
					<!-- ***************************************************************** -->
			   		<div class="tab-pane " id="cnc-tab">
			   			<h2>数控工厂注册</h2>
						<form id="form_cnc" class="form-horizontal" role="form">
					  	<div class="col-sm-7"style="float:left">
							<div class="form-group" style="margin-bottom:0;">
								<label for="name" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="cnameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-4 control-label">公司名称 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.name" maxlength="20" onpropertychange="ccheckName(this.value)" oninput="ccheckName(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="pinyin" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="cpinyinCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="pinyin" class="col-sm-4 control-label">名称拼音 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.pinyin" maxlength="20" onpropertychange="ccheckPinyin(this.value)" oninput="ccheckPinyin(this.value)"></div>
							</div>		
							<div class="form-group" style="margin-bottom:0;">
								<label for="address" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="caddressCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-4 control-label">公司地址 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.address" maxlength="20" onpropertychange="ccheckAddress(this.value)" oninput="ccheckAddress(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="contact" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="ccontactCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="contact" class="col-sm-4 control-label">联系人 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.contact" maxlength="20" onpropertychange="ccheckContact(this.value)" oninput="ccheckContact(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="email" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="cemailCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">电子邮箱 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.email" maxlength="20" onpropertychange="ccheckEmail(this.value)" oninput="ccheckEmail(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="mobile" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="cmobileCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="mobile" class="col-sm-4 control-label">手机 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.mobile" maxlength="20" onpropertychange="ccheckMobile(this.value)" oninput="ccheckMobile(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="tel" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="ctelCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="tel" class="col-sm-4 control-label">固定电话 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.tel" maxlength="20" onpropertychange="ccheckTel(this.value)" oninput="ccheckTel(this.value)"></div>
							</div>
							<div class="form-group">
								<label for="uploadFile" class="col-sm-4 control-label">公司Logo</label>
								<div class="col-sm-8"><input type="file"  name="uploadFile" ></div>
							</div>
							<div class="form-group">
								<label for="url" class="col-sm-4 control-label">公司网址</label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="cnc.url" maxlength="20" onpropertychange="ccheckUrl(this.value)" oninput="ccheckUrl(this.value)"></div>
							</div>		
						</div>
					
						</form>
						<p class="text-center" style="margin-top:50px">
							<button type="button" class="btn btn-custom-primary btn-large" id="back" onclick="goBack()" style="margin-top:10%;float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:85px">取消</button>
							<button type="button" class="btn btn-custom-primary btn-large" id="cnc_save" style="float:left;margin-left:5%;margin-top:10%"><i class="fa fa-floppy-o"></i>确定</button>
						</p>
					</div>
					<!-- ****************************************************************************************************************** -->
					<div class="tab-pane " id="manufacturer-tab">
						<h2>制造商注册</h2>
						<form id="form_manufacturer" class="form-horizontal" role="form">
					  	<div class="col-sm-7"style="float:left">
							<div class="form-group" style="margin-bottom:0;">
								<label for="name" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mnameCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-4 control-label">公司名称 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.name" maxlength="20" onpropertychange="mcheckName(this.value)" oninput="mcheckName(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="pinyin" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mpinyinCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="pinyin" class="col-sm-4 control-label">名称拼音 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.pinyin" maxlength="20" onpropertychange="mcheckPinyin(this.value)" oninput="mcheckPinyin(this.value)"></div>
							</div>		
							<div class="form-group" style="margin-bottom:0;">
								<label for="address" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="maddressCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-4 control-label">公司地址 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.address" maxlength="20" onpropertychange="mcheckAddress(this.value)" oninput="mcheckAddress(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="contact" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mcontactCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="contact" class="col-sm-4 control-label">联系人 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.contact" maxlength="20" onpropertychange="mcheckContact(this.value)" oninput="mcheckContact(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="email" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="memailCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">电子邮箱 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.email" maxlength="20" onpropertychange="mcheckEmail(this.value)" oninput="mcheckEmail(this.value)"></div>
							</div>
							<div class="form-group" style="margin-bottom:0;">
								<label for="mobile" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mmobileCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="mobile" class="col-sm-4 control-label">手机 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.mobile" maxlength="20" onpropertychange="mcheckMobile(this.value)" oninput="mcheckMobile(this.value)"></div>
							</div>	
							<div class="form-group" style="margin-bottom:0;">
								<label for="tel" class="col-sm-4 control-label"></label>
								<div class="col-sm-8">
									<ul id="mtelCheck" class="text-danger hidden" style="margin-bottom:0;"><li><span></span></li></ul>
								</div>
							</div>
							<div class="form-group">
								<label for="tel" class="col-sm-4 control-label">固定电话 <span class="text-danger">*</span></label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.tel" maxlength="20" onpropertychange="mcheckTel(this.value)" oninput="mcheckTel(this.value)"></div>
							</div>
							<div class="form-group">
								<label for="uploadFile" class="col-sm-4 control-label">公司Logo</label>
								<div class="col-sm-8"><input type="file"  name="uploadFile" ></div>
							</div>
							<div class="form-group">
								<label for="url" class="col-sm-4 control-label">公司网址 </label>
								<div class="col-sm-8"><input type="text" class="form-control input-sm" name="manufacturer.url" maxlength="20" onpropertychange="mcheckUrl(this.value)" oninput="mcheckUrl(this.value)"></div>
							</div>		
						</div>
					
						</form>
						<p class="text-center" style="margin-top:50px">
							<button type="button" class="btn btn-custom-primary btn-large" id="back" onclick="goBack()" style="margin-top:10%;float:left;background:#AAAAAB;border:2px solid #e5e5e5;margin-left:40%;width:85px">取消</button>
							<button type="submit" class="btn btn-custom-primary btn-large" id="manufacturer_save" style="float:left;margin-left:5%;margin-top:10%"><i class="fa fa-floppy-o"></i>确定</button>
						</p>
					</div>
			    </div>
			</div>
		</div>
  </body>
</html>

<content tag="scripts">	
<script type="text/javascript" src="js/my-registerValidate.js"></script>
</content>
