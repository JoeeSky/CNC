<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>接收G代码任务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="jqgrid-wrapper">
		<!-- 条件搜索 begin-->
		<div class="row">
			<div class="col-sm-3 pull-right">
				<div id="fuzzySearchbox" class="input-group input-group-sm searchbox">
					<input type="search" id="searchText" class="form-control" placeholder="请输入关键字...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchButton"><i class="fa fa-search"></i></button>
					</span>
				</div>
			</div>
		</div>
		<form class="form-horizontal" role="form" id="exactForm">
			<fieldset>
				<legend>查询条件</legend>
				<div class="col-sm-2">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">时间</div>
						<input type="text" class="form-control" name="time">
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">任务名</div>
						<input type="text" class="form-control" name="TaskName">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">需求方</div>
						<input type="text" class="form-control" name="Demander">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">cnc</div>
						<input type="text" class="form-control" name="Cnc">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">状态</div>
						<select id="state" name="role" class="form-control">
							<option  value="">未接受</option>
							<option  value="">已接受</option>
							<option  value="">已完成</option>					
						</select>						
					</div>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-primary btn-sm" id="exactQuery">查询</button>
					<button class="btn btn-danger btn-sm" id="clearExactForm">清除</button>
				</div>
			</fieldset>
		</form>
		<!-- 条件搜索 end-->
		<!-- jqgrid begin-->
		    <table id="jqgrid" class="table table-striped table-hover"></table>
			<div id="jqgrid-pager"></div>
	</div>
		<!-- jqgrid end-->
	</div>
  </body>
</html>

<content tag="scripts">
    <script src="js/jquery.ba-bbq.min.js"></script>
    <script src="js/grid.history.js"></script>
	<script src="js/i18n/grid/grid.locale-cn.js"></script>
	<script>
		$.jgrid.useJSON = true;
	</script>
	<script src="js/jquery.jqGrid.min.js"></script>
	<script src="js/jquery.jqGrid.fluid.js"></script>
	<script src="js/king-common.js"></script>
	<script>	
		$(document).ready(function() {
		    function e() {
		        $("#jqgrid").length > 0 && t.fluidGrid({
		            base: "#jqgrid-wrapper",
		            offset: 0
		        })
		    }
		    var t = $("#jqgrid");
		    $("#jqgrid").length > 0 && (t.jqGrid({
		    	url:"userManage/listUser.ajax",
		    	mtype:"GET",
		    	datatype:"json",
		    	colNames:['任务名','发布时间','发布方','接收方','状态','操作'],
		    	height:410,
		    	rowNum:10,
		    	//rowNum:<s:property value="@org.nfmedia.crms.cons.CommonConstant@DEFAULT_PAGE_SIZE"/>,
		    	rowList: [10, 20, 30],
        		pager: "jqgrid-pager",
        		multiselect: 0,
        		editurl:"userManage/editUser.ajax",
        		sortname:"account",
        		sortorder: "asc",
        		viewrecords: !0,
        		colModel:[{
        			name:"task",
        			index:"task",
        			width:"16%",
        			align:"center",
        		},{
        			name:"time",
        			index:"time",
        			width:"16%",
        			align:"center"
        		},{
        			name:"demander",
        			index:"demander",
        			width:"16%",
        			align:"center"
        		},{
        			name:"cnc",
        			index:"cnc",
        			width:"16%",
        			align:"center"
        		},{
        			name:"state",
        			index:"state",
        			width:"18%",
        			align:"center"
        		},{
        			name:"operation",
        			sortable: !1,
        			search: !1,
        			width:"20%",
        			align:"center"
        		}],
        		gridComplete: function(){
        			var ids = $("#jqgrid").jqGrid("getDataIDs");
        			for(var i=0;i < ids.length;i++){
        				var cnc=$("#jqgrid").jqGrid('getCell',ids[i],'cnc');
        				var state=$("#jqgrid").jqGrid('getCell',ids[i],'state');
        				if(!state){
        					accept='<button class="btn btn-info btn-xs">接受</button>';
        					refuse='<button class="btn btn-danger btn-xs">拒绝</button>';
        					t.jqGrid('setRowData',ids[i],{state:accept+refuse});
        				}
        				
                        load = '<button class="btn btn-info btn-xs">下载文件</button>';
                        upload = '<button class="btn btn-success btn-xs">上传文件</button>';
                        t.jqGrid('setRowData',ids[i],{operation:load+upload});
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

		})
		
	</script>
</content>
