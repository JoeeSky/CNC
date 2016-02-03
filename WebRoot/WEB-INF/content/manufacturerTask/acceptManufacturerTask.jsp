<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>接收机加工任务</title>
    
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
						<input type="text" class="form-control" name="taskName">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">需求方</div>
						<input type="text" class="form-control" name="demander">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">操作员</div>
						<input type="text" class="form-control" name="manufacturerUser">						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">状态</div>
						<select id="status" name="status" class="form-control">	
						<option>选择状态</option>			
						</select>						
					</div>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-primary btn-sm" id="query">查询</button>
					<button class="btn btn-danger btn-sm" id="refresh">清除</button>
				</div>
			</fieldset>
		<!-- 条件搜索 end-->
		<!-- jqgrid begin-->
		    <table id="jqgrid" class="table table-striped table-hover"></table>
			<div id="jqgrid-pager"></div>
		<!-- jqgrid end-->
	</div>
	
	<!-- +选择机加工工人窗口 -->
	<div class="modal fade" id="modal-id">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-5 pull-right">
							<div id="fuzzySearchbox" class="input-group input-group-sm searchbox">
								<input type="search" id="searchText" class="form-control" placeholder="请输入关键字...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="searchButton"><i class="fa fa-search"></i></button>
								</span>
							</div>
						</div>
					</div>
					<div>
						<table id="manufacturerUser-jqgrid" class="table table-striped table-hover"></table>
				        <div id="manufacturerUser-jqgrid-pager"></div>
				    </div>  
				    <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> 取消</button>
						<button id="ok" type="button" class="btn btn-custom-primary"><i class="fa fa-check-circle"></i> 确认</button>
					</div>  
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
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
	    function  manufacturerUser(id){
	    	$("#manufacturerUser-jqgrid").jqGrid('setGridParam',{datatype:'json',url:"userManage/getUserListByCompanyIdAndCompanyType.ajax"}).trigger("reloadGrid");
			$("#modal-id").modal('show');
	    }
	    
	    function acceptTask(id){
	    	$.ajax({
		    		url:"manufacturerTask/acceptTask.ajax?tid="+id,
					type:"get",
					dataType:"json",
					success:function(data){
						alert('操作成功');
					},
					error:function(data){
						alert('操作失败！');
					}
		    	})
	    }
	    
	     function refuseTask(id){
	    	$.ajax({
		    		url:"manufacturerTask/refuseTask.ajax?tid="+id,
					type:"get",
					dataType:"json",
					success:function(data){
						alert('操作成功');
					},
					error:function(data){
						alert('操作失败！');
					}
		    	})
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
		    	url:"manufacturerTask/taskResultBrowse.ajax",
		    	mtype:"GET",
		    	datatype:"json",
		    	colNames:['任务名','发布时间','发布方','机加工操作员','状态','完成状态','操作'],
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
        			width:"12%",
        			align:"center"
        		},{
        			name:"demander",
        			index:"demander",
        			width:"26%",
        			align:"center"
        		},{
        			name:"manufacturerUser",
        			index:"manufacturerUser",
        			width:"16%",
        			align:"center"
        		},{
        			name:"state",
        			index:"state",
        			width:"10%",
        			align:"center"
        		},{
        			name:"resultState",
        			index:"resultState",
        			width:"10%",
        			align:"center"
        		},{
        			name:"operation",
        			sortable: !1,
        			search: !1,
        			width:"10%",
        			align:"center"
        		}],
        		gridComplete: function(){
        			var ids = $("#jqgrid").jqGrid("getDataIDs");
        			for(var i=0;i < ids.length;i++){
        				var manufacturerUser=$("#jqgrid").jqGrid('getCell',ids[i],'manufacturerUser');
        				var state=$("#jqgrid").jqGrid('getCell',ids[i],'state');
        				var resultState=$("#jqgrid").jqGrid('getCell',ids[i],'resultState');
        				if((!manufacturerUser)&& state=="已接受"){
        					selectManufacturerUser='<button class="btn btn-success btn-xs" onclick="manufacturerUser('+ids[i]+')">+选择机加工操作员</button>';
        					t.jqGrid('setRowData',ids[i],{manufacturerUser:selectManufacturerUser});
        				}
        				if(state=="未接受"){
        					accept='<button class="btn btn-success btn-xs" onclick="acceptTask('+ids[i]+')">接受</button>';
        					refuse='<button class="btn btn-danger btn-xs" style="margin-left:2px" onclick="refuseTask('+ids[i]+')">拒绝</button>';
        					t.jqGrid('setRowData',ids[i],{state:accept+refuse});
        				}
        				if(state=="已接受" && resultState=="未完成"){
        					load = '<button class="btn btn-info btn-xs">下载文件</button>';
                        	t.jqGrid('setRowData',ids[i],{operation:load});
        				}
                    }
        		}
		    }), e(), $("#jqgrid").length > 0 && t.jqGrid("navGrid","#jqgrid-pager",{
		    	add:!1,
		    	edit:!1,
		    	del:!0,
		    	view:!1,
		    	search: !1,
        		refresh: 0
		    },{},{},{},{
		    	multipleSearch: true,
		    	multipleGroup:true
		    })),
		    $(window).resize(e);
		    
		       //模糊查询
		    $("#searchButton").click(function(){
		    	//$("#exactForm")[0].reset();
		    	var searchFilter = $("#searchText").val();
		    	if(searchFilter.length === 0){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    	t[0].p.search = true;
		    		searchFilter = " where ( m.taskName like '%"+searchFilter+"%' or m.demander.name like '%"+searchFilter+"%' or m.manufacturerUser.name like '%"+searchFilter+"%' or m.status.name like '%"+searchFilter+"%' or m.resultStatus.name like '%"+searchFilter+"%' ) ";
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    	
		    });
		    
		     //精确搜索
		    $("#query").click(function(){
		    	var taskName = $.trim($("input[name='taskName']").val());
		    	var demander = $.trim($("input[name='demander']").val());
		    	var manufacturerUser = $.trim($("input[name='manufacturerUser']").val());
		    	var status = $.trim($("#status").val());
		    	if(taskName===""&&demander===""&&manufacturerUser===""&&status===""){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    		var searchFilter = " where (";
		    		if(taskName!==""){
		    			searchFilter += " m.taskName like '%"+taskName+"%' and ";
		    		}
		    		if(demander !==""){
		    			searchFilter += " m.demander.name like '%"+demander+"%' and ";
		    		}
		    		if(manufacturerUser !==""){
		    			searchFilter +=" m.manufacturerUser.name like '%"+manufacturerUser+"%' and ";
		    		}
		    		if(status !=="选择状态"){
		    			searchFilter +=" ( m.status.name like '%"+status+"%' or m.resultStatus.name like '%"+status+"%' ) ";
		    		}else{
		    			searchFilter = searchFilter.substring(0,searchFilter.lastIndexOf('and '));
		    		}
		    		searchFilter += ")";
		    		console.log(searchFilter);
		    		t[0].p.search = true;
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    });
		    
		    $("#refresh").click(function(){
		    	location.reload();
		    })
		})
		
		 var t2 = $("#manufacturerUser-jqgrid");
		    $("#manufacturerUser-jqgrid").length > 0 && (t2.jqGrid({
		        url: "",
		        mtype: "GET",
		        datatype: "local",
		        colNames: ['机加工工人','角色'],
		        colModel:[{
				            name: "auditLevel",
				            width:261,
				            sortable: !1,
				            align:"center"
				        },{
				        	name:"auditUser.name",
				        	width:250,
		        			sortable: !1,
		        			align:"center"
				        }],
		        height: 250,
		        autowidth:!0,
		        rowNum: 10,
		        rowList: [10, 20, 30],
		        pager: "manufacturerUser-jqgrid-pager",
		        //sortname: "followUser.name",
		        viewrecords: !0,
		        sortorder: "asc",
		        multiselect: !0,
		    }).navGrid('#manufacturerUser-jqgrid-pager',{edit:false,add:false,del:false,search:false}));
		
		
		function getStatus(){
				 $.ajax({
					  		type:"post",
					  		dataType:"json",
					  		url:"programTask/getStatusList.ajax",
					  		success:function(data){ 	
					  			var jsonData = data.info;
					  			//在状态select框中加载状态(option)
					  			for(var i=0, n = jsonData.length;i<n;i++){
					  				$("#status").append("<option  value='"+jsonData[i]+"'>"+jsonData[i]+"</option>");		
					  			}
					  		}
					  });
			}
		 
		$(function(){
			getStatus();
		})
		
	</script>
</content>
