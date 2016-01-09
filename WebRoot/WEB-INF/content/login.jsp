<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:i18n name="contentMessage.login">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="module" content="nonTopAndLeft">
	</head>
	<body>
		<!-- WRAPPER -->
        <div class="wrapper full-page-wrapper page-login text-center">
            <div class="inner-page">

                <div class="logo" style="line-height:27px;font-size:27px;">
                    <a href="www.scut.edu.cn"><img src="img/logo.png" alt='<s:text name="logoTitle"/>' style="width:30px;height:30px;"></a><strong>CNC服务平台</strong>
                </div>

                <div class="login-box center-block">
                	<s:form action="loginCheck" cssClass="form-horizontal" id="form_loginCheck">
                		<p class="title"><s:text name="formTitle"/></p>
                        <div class="form-group">
                        	<ul id="accountLoginCheck" class="text-danger hidden"><li><span></span></li></ul>
                            <s:fielderror fieldName="account" cssClass="text-danger"/>
                            <label for="username" class="control-label sr-only"><s:text name="formElement_1"/></label>
                            <div class="col-sm-12">
                                <div class="input-group">
                                	<s:textfield name="account" cssClass="form-control" tabIndex="1" autofocus="autofocus"/>
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        	<ul id="passwordLoginCheck" class="text-danger hidden"><li><span></span></li></ul>
                            <s:fielderror fieldName="password" cssClass="text-danger"/>
                            <label for="password" class="control-label sr-only"><s:text name="formElement_2"/></label>
                            <div class="col-sm-12">
                                <div class="input-group">
                                	<s:password name="password" cssClass="form-control" tabIndex="2"/>
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                </div>
                            </div>
                        </div>
                        <s:if test="#request.error!=null">
                        	<div class="alert alert-warning alert-dismissible" role="alert">
  								<button type="button" class="close" data-dismiss="alert">
  									<span aria-hidden="true">&times;</span>
  									<span class="sr-only">Close</span>
  								</button>
  								<strong><s:property value="#request.error"/></strong>
							</div>
                        </s:if>
                        <s:if test="#parameters.returnURL != null">
                        	<s:hidden name="returnURL" value="%{#parameters.returnURL}"/>
                        </s:if>
                        <%-- <div class="simple-checkbox">
                            <input id="checkbox1" type="checkbox">
                            <label for="checkbox1"><s:text name="rememberUserName"/></label>
                        </div> --%>
                        <s:token/>
                        <button type="submit" class="btn btn-custom-primary btn-block btn-login"><i class="fa fa-arrow-circle-o-right"></i> <s:text name="formSubmit"/></button>
                	</s:form>
                    <%-- <div class="links">
                        <p><a href="#"><s:text name="forgetPassword"/></a></p>
                    </div> --%>
                </div>
            </div>
            <div class="push-sticky-footer"></div>
        </div><!-- /wrapper -->
	</body>
</html>
<content tag="scripts">
	<script>
		$(document).ready(function(){
			var $form = $("#form_loginCheck");
			var $account = $("input[name='account']");
			var $password = $("input[name='password']");
			$account.attr('placeholder','<s:text name="formElement_1"/>');
			$password.attr('placeholder','<s:text name="formElement_2"/>');
            $form.submit(function(){
            	var result = true;
            	if($password.val() == ""){
            		$("#passwordLoginCheck span").text('<s:text name="password.required"/>');
            		$("#passwordLoginCheck").removeClass("hidden");
            		$password.focus();
            		result = false;
            	}else{
            		$("#passwordLoginCheck").addClass("hidden");
            	}
            	if($account.val() == ""){
            		$("#accountLoginCheck span").text('<s:text name="account.required"/>');
            		$("#accountLoginCheck").removeClass("hidden");
            		$account.focus();
            		result = false;
            	}else{
            		$("#accountLoginCheck").addClass("hidden");
            	}
            	return result;
            })
		});
	</script>
</content>
</s:i18n>