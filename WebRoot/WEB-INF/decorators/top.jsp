<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:i18n name="decoratorsMessage.top">
<script>
		$(document).ready(function(){

                $.ajax({
						url : "countNotReadMessage.ajax",
						type : 'post',
						dataType : 'json',
						success : function(data) {
							if (data != 0) {
								$("#msgnum").html(
										"<span class='nav-counter'>" + data
												+ "</span>");
							}
						}
					})

				})
	</script>
<!-- TOP BAR -->
<div class="navbar navbar-default top-bar" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <!-- responsive menu bar icon -->
        <a href="javascript:void(0);" class="hidden-md hidden-lg main-nav-toggle">
            <i class="fa fa-bars"></i>
        </a>
        <!-- end responsive menu bar icon -->
        <a class="navbar-brand" href="http://www.nfmedia.com/">
            <img src="img/logo20.png" alt='<s:text name="topTitle"/>' class="hidden-xs-my">
            <span>CNC服务平台</span>
        </a>
        <!-- logged user and the menu -->
        <div class="logged-user navbar-brand-right">
            <div class="btn-group">
                <a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-user"></i>
                    <span class="name hidden-xs-my"><s:property value="#request.name"/></span>
                    <!--small class="text-muted">(<s:property value="#request.roleName"/>)</small-->&nbsp;&nbsp;&nbsp;&nbsp; <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href='<s:url action="profileAction" namespace="/"/>'>
                            <i class="fa fa-user"></i>
                            <span class="text"><s:text name="topMenu_1"/></span>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="logout" namespace="/"/>'>
                            <i class="fa fa-power-off"></i>
                            <span class="text"><s:text name="topMenu_2"/></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- end logged user and the menu -->
    </div>
</div><!-- /top -->
</s:i18n>
