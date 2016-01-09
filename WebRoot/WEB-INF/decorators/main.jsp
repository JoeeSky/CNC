<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<s:i18n name="decoratorsMessage.main">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    	<base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!--使部分国产浏览器默认采用高速模式渲染页面-->
        <meta name="renderer" content="webkit">
        <title><s:text name="defaultTitle"/></title>
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="img/favicon.ico">

		<!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.cosmo.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/darkblue.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="js/jquery.min.js"></script>
		<!--[if (lt IE 9) & (!IEMobile)]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<![endif]-->
		<decorator:head/>
    </head>
    <body>
        <!--[if lte IE 7]>
            <s:text name="browserOutDate" />
        <![endif]-->

		<decorator:usePage id="thePage"/>
		<s:if test='#attr.thePage.getProperty("meta.module")=="nonTopAndLeft"'>
			<decorator:body/>
		</s:if>
		<s:else>
			<!-- WRAPPER -->
	        <div class="wrapper">
	            <jsp:include page="top.jsp" flush="true"></jsp:include>
	            <!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
	            <div class="bottom">
	                <div class="container">
	                    <div class="row">
	                        <!-- left sidebar -->
	                        <div class="col-md-2 left-sidebar">
	                            <jsp:include page="left.jsp" flush="true"></jsp:include>
	                        </div>
	                        <!-- end left sidebar -->

	                        <!-- content-wrapper -->
	                        <div class="col-md-10 content-wrapper">
	                            <div class="row">
									<jsp:include page="breadCrumb.jsp" flush="true"></jsp:include>
								</div>
								<!-- main -->
								<div class="content">
									<div class="main-header">
										<h2 style="border:0;"><decorator:title/></h2>
									</div>
									<div class="main-content">
										<decorator:body/>
									</div>
									<!-- /main-content -->
								</div>
								<!-- /main -->
	                        </div><!-- /content-wrapper -->
	                    </div><!-- /row -->
	                </div><!-- /container -->
	            </div>
	            <!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
	            <div class="push-sticky-footer"></div>
	        </div><!-- WRAPPER -->
		</s:else>

		<s:if test='#attr.thePage.getProperty("meta.module2")=="nonFooter"'>
		</s:if>
		<s:else>
			<!-- FOOTER -->
	        <footer class="footer">
	            <s:text name="footer"/>
	        </footer>
	        <s:debug/>
	        <!-- END FOOTER -->
		</s:else>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <s:if test="#request.firstLogin">
        <script src="js/my-firstLogin.js"></script>
        </s:if>
        <decorator:getProperty property="page.scripts"/>
    </body>
</html>
</s:i18n>

