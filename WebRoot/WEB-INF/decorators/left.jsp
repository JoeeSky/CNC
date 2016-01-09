<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- main-nav -->
<nav class="main-nav">
    <ul class="main-menu">
    	<s:iterator value="#request.resourcesMap">
    		<s:if test="value.size==1">
    			<li<s:if test="#request.curParentName == key"> class="active"</s:if>>
    				<a href='<s:property value="value[0].url"/>'>
    					<i class="fa fa-bullseye fa-fw"></i>
    					<span class="text"><s:property value="value[0].name"/></span>
    				</a>
    			</li>
    		</s:if><s:else>
    			<s:set name="flag" value="0"/>
    			<li<s:if test="#request.curParentName == key"> class="active"<s:set name="flag" value="1"/></s:if>>
    				<a href="#" class="js-sub-menu-toggle">
    					<i class="fa fa-bullseye fa-fw"></i>
    					<span class="text"><s:property value="key"/></span>
    					<i class="toggle-icon fa <s:if test='#flag==1'>fa-angle-down</s:if><s:else>fa-angle-left</s:else>"></i>
    				</a>
    				<ul class="sub-menu<s:if test='#flag==1'> open</s:if>">
	    				<s:iterator value="value" status="st">
	    					<li<s:if test="#flag==1"><s:if test="#st.index==#request.curIndex"> class="active"</s:if></s:if>>
	    						<a href='<s:property value="[0].url"/>'>
	    							<span class="text"><s:property value="[0].name"/></span>
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
