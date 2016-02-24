<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户列表</title>
</head>
<body>
	<div id="jqgrid-wrapper">
		<div class="row">
			<div class="col-sm-2 pull-right">
				<a class="btn btn-primary btn-sm  pull-right" style="margin:0 10px 20px 30px;" href="userManage/addInput">添加用户</a>
		</div></div>
		<!-- 条件搜索 begin-->
		<%-- <div class="row">
			<div class="col-sm-4 pull-right">
				<a class="btn btn-primary btn-sm  pull-right" style="margin-left:20px;" href="user/addInput">添加用户</a>
				<div id="fuzzySearchbox"
					class="input-group input-group-sm searchbox">
					<input type="search" id="searchText" class="form-control"
						placeholder="请输入关键字..."> <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchButton">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div> --%>
		<form class="form-horizontal" role="form" id="exactForm">
			<fieldset>
				<legend>查询条件</legend>
				<div class="col-sm-3">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">姓名</div>
						<input type="text" class="form-control" name="name">
					</div>
				</div>
				<div class="col-sm-3">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">角色</div>
						<select class="form-control input-sm" name="user.role.id">
							<s:iterator value="#request.roles">
								<option value='<s:property value="[0].top[0]"/>'><s:property value="[0].top[1]"/></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-sm-3">
					<button class="btn btn-primary btn-sm" id="exactQuery">查询</button>
					<button class="btn btn-danger btn-sm" id="clearExactForm">清除</button>
				</div>
			</fieldset>
		</form>
		<!-- 条件搜索 end-->
		<!-- jqgrid begin-->
		<table id="jqgrid" class="table table-striped table-hover"></table>
		<div id="jqgrid-pager"></div>
		<!-- jqgrid end-->
	</div>
</body>
</html>
	<content tag="scripts">
	<script src="js/jquery.ba-bbq.min.js"></script>
	<script src="js/grid.history.js"></script>
	<script src="js/i18n/grid/grid.locale-cn.js"></script>
	<script> $.jgrid.useJSON = true; </script>
	<script src="js/jquery.jqGrid.min.js"></script>
	<script src="js/jquery.jqGrid.fluid.js"></script>
	<script src="js/king-common.js"></script>
	<script>
		function formatUser(cellvalue, options, rowObject){
			if(cellvalue.id == null){
				return "";
			}
			return "<a  target='_blank' href='userManage/info?tid="+cellvalue.id+"'>"+cellvalue.account+"</a>";
		}

		$(document).ready(function() {
		    function e() {
		        $("#jqgrid").length > 0 && t.fluidGrid({
		            base: "#jqgrid-wrapper",
		            offset: 0
		        })
		    }
		    var t = $("#jqgrid");
		    $("#jqgrid").length > 0 && (t.jqGrid({
		    	url:"userManage/listAjax.ajax",
		    	mtype:"GET",
		    	datatype:"json",
		    	colNames:['账号','姓名','角色','操作'],
		    	height:410,
		    	rowNum:<s:property value="@org.nfmedia.crms.cons.CommonConstant@DEFAULT_PAGE_SIZE"/>,
		    	rowList: [10, 20, 30],
        		pager: "jqgrid-pager",
        		multiselect: !0,
        		editurl:"userManage/edit.ajax",
        		sortname:"account",
        		sortorder: "asc",
        		viewrecords: !0,
        		colModel:[{
        			name:"account",
        			index:"account",
        			align:"center",
        			formatter:formatUser
        		},{
        			name:"name",
        			index:"name",
        			align:"center"
        		},{
        			name:"role",
        			index:"role",
        			align:"center"
        		},{
        			name:"actions",
        			sortable: !1,
        			search: !1,
        			align:"center"
        		}],
        		gridComplete: function(){
        			var ids = $("#jqgrid").jqGrid("getDataIDs");
        			for(var i=0;i < ids.length;i++){
        				ee = '<button class="btn btn-info btn-xs" onclick="location.href=\'userManage/updateInput?tid='+ids[i]+'\'">修改</button>';
                        de = '<button class="btn btn-danger btn-xs" onclick="$(\'#jqgrid\').delGridRow(\''+ids[i]+'\')">删除</button>';
                        //pe = '<button class="btn btn-success btn-xs" onclick="resetPassword('+ids[i]+')">重置密码</button>';
                        t.jqGrid('setRowData',ids[i],{actions:ee+de/* +pe */});
                    }
        		}
		    }), e(), $("#jqgrid").length > 0 && t.jqGrid("navGrid","#jqgrid-pager",{
		    	add:!1,
		    	edit:!1,
		    	del:!0,
		    	view:!1,
		    	search: !1,
        		refresh: !0
		    },{},{},{},{
		    	multipleSearch: true,
		    	multipleGroup:true
		    })),
		    $(window).resize(e);

		    //根据关键字搜索
		    $("#searchText").keypress(function(event){
		    	if(event.keyCode == "13"){
		    		$("#searchButton").click();
		    	}
		    });
		    /* $("#searchButton").click(function(){
		    	//console.log("searchbox click");
		    	$("#exactForm")[0].reset();
		    	var searchFilter = $.trim($("#searchText").val());
		    	if(searchFilter.length === 0){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    		searchFilter = " where u.status == 'U and (u.account like '%"+searchFilter+"%' or u.name like '%"+searchFilter+"%' or u.companyType like '%"+searchFilter+"%')";
		    		t[0].p.search = true;
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    }) */

		    //精确搜索
		    $("#exactQuery").click(function(){
		    	var $name = $.trim($("input[name='name']").val());
		    	var $role = $.trim($("#role").val());
		    	if($name==""&&$role==""){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    		var $searchFilter = "";
		    		if($name!==null&&$name!=""){
		    			if($searchFilter!="") $searchFilter+=" and ";
		    			searchFilter += "u.name like '%"+$name+"%'";
		    		}
		    		if($role!==null){
		    			if($searchFilter!="") $searchFilter+=" and ";
		    			searchFilter += "u.role.id like '%"+$role+"%'";
		    		}
		    		console.log(searchFilter);
		    		t[0].p.search = true;
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    	return false;
		    });

			$("#clearExactForm").click(function(){
				$("#searchButton").click();
				return false;
			});
		});
			
	</script>
	</content>