<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- main-nav -->
<nav class="main-nav">
    <ul class="main-menu">
    	<s:iterator value="#request.menuTree" var="top">
    		<s:if test="#top[1].size()==0">
    			<s:if test='!#top[0].getUrl().equals("")'>
	    			<li<s:if test="#request.curMenuId == top[0].getId()"> class="active"</s:if>>
	    				<a href='<s:property value="#top[0].getUrl()"/>'>
	    					<i class="fa fa-bullseye fa-fw"></i>
	    					<span class="text"><s:property value="#top[0].getTitle()"/></span>
	    				</a>
	    			</li>
    			</s:if>
    		</s:if>
    		<s:else>
    			<s:set name="flag" value="0"/>
    			<li <s:if test="#request.curParentId == top[0].getId()"> class="active"<s:set name="flag" value="1"/></s:if>>
    				<a href="#" class="js-sub-menu-toggle">					
    					<i class="fa fa-bullseye fa-fw"></i>
    					<span class="text"><s:property value="#top[0].getTitle()"/></span>
    					<i class="toggle-icon fa <s:if test='#flag==1'>fa-angle-down</s:if><s:else>fa-angle-left</s:else>"></i>
    				</a>
    				<ul class="sub-menu<s:if test='#flag==1'> open</s:if>">
	    				<s:iterator value="#top[1]" var="sub">
	    					<li <s:if test="#flag==1 && #sub.getId()==#request.curMenuId"> class='active'</s:if> >
	    						<a href='<s:property value="#sub.getUrl()"/>'>
	    							<span class="text"><s:property value="#sub.getTitle()"/></span>
	    						</a>
	    					</li>
	    				</s:iterator>
    				</ul>
    			</li>
    		</s:else>
    	</s:iterator>
    </ul>
</nav><!-- /main-nav -->

<div class="sidebar-minified js-toggle-minified">
    <i class="fa fa-angle-left"></i>
</div>
