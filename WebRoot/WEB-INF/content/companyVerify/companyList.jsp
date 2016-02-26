<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公司列表</title>
    
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
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">公司类型</div>
						<select id="companyType" name="companyType" class="form-control">
							<option  value="demander">需求商</option>
							<option  value="cnc">数控工厂</option>
							<option  value="manufacturer">制造商</option>					
						</select>						
					</div>
				</div>
				<div class="col-sm-2" >
					<div class="input-group input-group-sm">
						<div class="input-group-addon">审核状态</div>
						<select id="verifyStatus" name="verifyStatus" class="form-control">
							<option  value="all">所有状态</option>
							<option  value="0">未审核</option>
							<option  value="1">审核通过</option>
							<option  value="2">审核未通过</option>					
						</select>						
					</div>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-primary btn-sm" id="exactQuery">查询</button>
				</div>
			</fieldset>
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
		function verifyClick(id){
		    var rowData = $("#jqgrid").jqGrid("getRowData",id);//根据上面的id获得本行的所有数据
        	var description= rowData.description; //获得制定列的值 （auditStatus 为colModel的name）
			if(description=="数控工厂"){
				window.open('verify/cncInfo?id='+id);
			}else if(description=="需求商"){
				window.open('verify/demanderInfo?id='+id);
			}else if(description=="制造商"){
				window.open('verify/manufacturerInfo?id='+id);
			}	
			}
		
		$(document).ready(function() {
		    function e() {
		        $("#jqgrid").length > 0 && t.fluidGrid({
		            base: "#jqgrid-wrapper",
		            offset: 0
		        })
		    }
		    var t = $("#jqgrid");
		    var type = $.trim($("#companyType").val());
		    if(type=="需求商")type=demander;
		    $("#jqgrid").length > 0 && (t.jqGrid({
		    	url:"verify/getCompanyListByCondition.ajax",
		    	mtype:"GET",
		    	datatype:"json",
		    	colNames:['公司名称','公司类型','公司地址','联系人','邮箱','手机','审核状态','操作'],
		    	height:410,
		    	rowNum:10,
		    	//rowNum:<s:property value="@org.nfmedia.crms.cons.CommonConstant@DEFAULT_PAGE_SIZE"/>,
		    	rowList: [10, 20, 30],
        		pager: "jqgrid-pager",
        		multiselect: 0,
        		//editurl:"userManage/editUser.ajax",
        		sortname:"account",
        		sortorder: "asc",
        		viewrecords: !0,
        		colModel:[{
        			name:"name",
        			index:"name",
        			width:"16%",
        			align:"center",
        		},{
        			name:"description",
        			index:"description",
        			width:"10%",
        			align:"center"
        		},{
        			name:"address",
        			index:"address",
        			width:"16%",
        			align:"center"
        		},{
        			name:"contact",
        			index:"contact",
        			width:"10%",
        			align:"center"
        		},{
        			name:"email",
        			index:"email",
        			width:"16%",
        			align:"center"
        		},{
        			name:"tel",
        			index:"tel",
        			width:"8%",
        			align:"center"
        		},{
        			name:"verifystatus",
        			index:"isEnd",
        			width:"8%",
        			align:"center"
        		},{
        			name:"operation",
        			sortable: !1,
        			search: !1,
        			width:"16%",
        			align:"center"
        		}],
        		gridComplete: function(){
        			var ids = $("#jqgrid").jqGrid("getDataIDs");
        			for(var i=0;i < ids.length;i++){
        				alter = '<button class="btn btn-info btn-xs" onclick="verifyClick('+ids[i]+')">进行审核</button>';
        				//alter = '<button class="btn btn-info btn-xs" onclick=window.open(\'userManage/userInfoDo?tid='+ids[i]+'\')>进行审核</button>';
        				//alter = '<button class="btn btn-info btn-xs" onclick="location.href=\'userManage/userInfoDo?tid='+ids[i]+'\'">进行审核</button>';
                        //delet = '<button class="btn btn-danger btn-xs" onclick="$(\'#jqgrid\').delGridRow(\''+ids[i]+'\')">删除</button>';
                        //load = '<button class="btn btn-success btn-xs" onclick="resetPassword('+ids[i]+')">下载文件</button>';
                        t.jqGrid('setRowData',ids[i],{operation:alter});
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
			
			//精确搜索
		    $("#exactQuery").click(function(){
				var type = $.trim($("#companyType").val());
		    	var status = $.trim($("#verifyStatus").val());	
		    	if(status=="all"){
				    t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:"",type:type});
		    	}else{
		    		var searchFilter =" where ";
		    		t[0].p.search = true;
			    	if(status==0){
			    		searchFilter += "verifystatus like 0"; 
			    	}else if(status==1){
			    		searchFilter += "verifystatus like 1"; 
			    	}else{
			    		searchFilter += "verifystatus like 2";
			    	}
			    	
			    	$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn",type:type});
		    		}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    	//return false;
		    });
		})
		
	</script>
</content>
