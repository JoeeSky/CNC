<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>G代码任务列表</title>
    <link rel="stylesheet" href="css/daterangepicker-bs3.css">
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
		<s:if test='%{@org.nfmedia.crms.util.LoginUtil@isGranted("用户","增加") }' >
			<button type="button"" class="btn btn-custom-primary btn-sm" style="margin-left:15px">导出报表</button>
		</s:if>
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
				<div class="row col-md-3" style="margin-right:1px">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">时间</div>
						<input type="text" class="form-control" id="time" name="time">
					</div>
				</div>
				<div class="row col-md-2" style="margin-right:1px">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">任务名</div>
						<input type="text" class="form-control" name="taskName">						
					</div>
				</div>
				<div class="row col-md-2" style="margin-right:1px">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">发布人</div>
						<input type="text" class="form-control" name="demanderUser">						
					</div>
				</div>
				<div class="row col-md-2" style="margin-right:1px">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">cnc</div>
						<input type="text" class="form-control" name="cnc">						
					</div>
				</div>
				<div class="row col-md-2" style="margin-right:1px">
					<div class="input-group input-group-sm">
						<div class="input-group-addon">状态</div>
						<select id="status" name="status" class="form-control">
							<option>选择状态</option>				
						</select>						
					</div>
				</div>
				
				<div style="margin-right:1px">
					<button class="btn btn-primary btn-sm" id="query">查询</button>
					<button class="btn btn-danger btn-sm" id="refresh">重置</button>
				</div>
			</fieldset>
		<!-- 条件搜索 end-->
		<!-- jqgrid begin-->
		    <table id="jqgrid" class="table table-striped table-hover"></table>
			<div id="jqgrid-pager"></div>
		<!-- jqgrid end-->
	</div>
	
	<!-- +选择CNC工厂窗口 -->
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
						<table id="cnc-jqgrid" class="table table-striped table-hover"></table>
				        <div id="cnc-jqgrid-pager"></div>
				    </div>  
				    <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> 取消</button>
						<button id="ok" type="button" class="btn btn-custom-primary" onclick="sureSelectCnc()"><i class="fa fa-check-circle"></i> 确认</button>
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
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>
	<script>
		var programTaskId;

			var  dateRangeSQL ="";
			//时间范围控件
			$("#time").daterangepicker({
				format: 'YYYY/MM/DD',
				showDropdowns: !0,
				ranges: {
	                "今天": [moment(), moment()],
	                "过去一周": [moment().subtract("days", 6), moment()],
	                "本周":[moment().startOf("week"), moment().endOf("week")],
	                "上周":[moment().subtract("week",1).startOf("week"), moment().subtract("week", 1).endOf("week")],
	                "过去30天": [moment().subtract("days", 29), moment()],
	                "本月": [moment().startOf("month"), moment().endOf("month")],
	                "上月": [moment().subtract("month", 1).startOf("month"), moment().subtract("month", 1).endOf("month")]
	            },
	            separator: " 至 ", 
	            locale: {
	                applyLabel: "确认",
	                cancelLabel: "清除",
	                fromLabel: "起始",
	                toLabel: "截止",
	                customRangeLabel: "自定义",
	                daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
	                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	                firstDay: 1
	            }
			});
			$('#time').on('cancel.daterangepicker', function(ev, picker) {
				  //do something, like clearing an input
				  $('#time').val('');
				  dateRangeSQL = "";
				});
				$('#time').on('apply.daterangepicker', function(ev, picker) {
				  console.log("start:"+picker.startDate.format('YYYY-MM-DD')+"\nend:"+picker.endDate.format('YYYY-MM-DD'));
				  dateRangeSQL = "p.issueTime between '"+picker.startDate.format('YYYY-MM-DD')+"' and '"+picker.endDate.format('YYYY-MM-DD')+"'  ";
				});

		function sureSelectCnc(){
			var cncId = $("#cnc-jqgrid").jqGrid("getGridParam","selrow");
			$.ajax({
		    		url:"programTask/sureSelectCnc.ajax",
					type:"get",
					dataType:"json",
					data:{programTaskId:programTaskId,cncId:cncId},
					success:function(data){
						$("#jqgrid").trigger("reloadGrid",[{page:1,current:true}]);
					},
					error:function(data){
						alert('选择失败！');
					}
		    	})
		    	$("#modal-id").modal('hide');
		}
		
		function selectCnc(id){
			$("#cnc-jqgrid").jqGrid('setGridParam',{datatype:'json',url:"verify/getCncList.ajax"}).trigger("reloadGrid");
			$("#modal-id").modal('show');
			programTaskId = id;
		}
		
		
		function delCnc(id){   //清除接受方
			$.ajax({
		    		url:"programTask/deleteCnc.ajax?tid="+id,
					type:"get",
					dataType:"json",
					success:function(data){
						$("#jqgrid").trigger("reloadGrid",[{page:1,current:true}]);
					},
					error:function(data){
						alert('清除失败！');
					}
		    	})
		}
		
		function isComplete(id){
			$.ajax({
		    		url:"programTask/makeSureComplete.ajax?tid="+id,
					type:"get",
					dataType:"json",
					success:function(data){
						$("#jqgrid").trigger("reloadGrid",[{page:1,current:true}]);
					},
					error:function(data){
						alert('操作失败！');
					}
		    	})
		}
		
		function delProgramTask(id){
			$.ajax({
		    		url:"programTask/deleteProgramTask.ajax?tid="+id,
					type:"get",
					dataType:"json",
					success:function(data){
						$("#jqgrid").trigger("reloadGrid",[{page:1,current:true}]);
					},
					error:function(data){
						alert('清除失败！');
					}
		    	})
		}
		
		$(document).ready(function() {
		//编程任务列表
		    function e() {
		        $("#jqgrid").length > 0 && t.fluidGrid({
		            base: "#jqgrid-wrapper",
		            offset: 0
		        })
		    }

		    
		    var t = $("#jqgrid");
		    $("#jqgrid").length > 0 && (t.jqGrid({
		    	url:"programTask/taskBrowse.ajax",
		    	mtype:"GET",
		    	datatype:"json",
		    	colNames:['任务名','发布时间','发布方','接受方','状态','完成状态','操作'],
		    	height:410,
		    	rowNum:10,
		    	//rowNum:<s:property value="@org.nfmedia.crms.cons.CommonConstant@DEFAULT_PAGE_SIZE"/>,
		    	rowList: [10, 20, 30],
        		pager: "jqgrid-pager",
        		multiselect: 0,
        		//editurl:"",
        		//editurl:"userManage/editUser.ajax",
        		sortname:"issueTime",
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
        			width:"8%",
        			align:"center"
        		},{
        			name:"resultState",
        			index:"resultState",
        			width:"12%",
        			align:"center"
        		},{
        			name:"operation",
        			sortable: !1,
        			search: !1,
        			width:"16%",
        			align:"left"
        		}],
        		gridComplete: function(){
        			var ids = $("#jqgrid").jqGrid("getDataIDs");
        			for(var i=0;i < ids.length;i++){
        				var cnc=$("#jqgrid").jqGrid('getCell',ids[i],'cnc');
        				var state=$("#jqgrid").jqGrid('getCell',ids[i],'state');
        				var resultState=$("#jqgrid").jqGrid('getCell',ids[i],'resultState');
        				if(!cnc){
        					cnc='<button class="btn btn-success btn-xs" onclick="selectCnc('+ids[i]+')" >+选择CNC工厂</button>';
        					t.jqGrid('setRowData',ids[i],{cnc:cnc});
        				}
        				if(resultState=="未完成") {
        					resultState='<p class="btn btn-success btn-xs" onclick="isComplete('+ids[i]+')">确定完成</p>';
        					t.jqGrid('setRowData',ids[i],{resultState:resultState});
        				}else if(state=="已拒绝"){
        					deleteCnc='<p class="btn btn-danger btn-xs" onclick="delCnc('+ids[i]+')">清除接受方</p>';
        					t.jqGrid('setRowData',ids[i],{resultState:deleteCnc});
        				}
        				
                        if(state=="已接受" && resultState=="已完成"){
	                        query = '<button class="btn btn-primary btn-xs" style="margin-left:2px" onclick="location.href=\'programTask/programTaskInfo?tid='+ids[i]+'\'">查看</button>';
	                        alter = '<button class="btn btn-info btn-xs" style="margin-left:2px"  onclick="location.href=\'programTask/programTaskUpdateDo?tid='+ids[i]+'\'">修改</button>';
	                        //delet = '<button class="btn btn-danger btn-xs" style="margin-left:2px"  onclick="$(\'#jqgrid\').delGridRow(\''+ids[i]+'\')">删除</button>';
	                        load = '<button class="btn btn-success btn-xs" style="margin-left:2px"  onclick="resetPassword('+ids[i]+')">下载文件</button>';
	                        t.jqGrid('setRowData',ids[i],{operation:query+load});
                        }else if(state=="已接受"){
	                        query = '<button class="btn btn-primary btn-xs" style="margin-left:2px" onclick="location.href=\'programTask/programTaskInfo?tid='+ids[i]+'\'">查看</button>';
	                        alter = '<button class="btn btn-info btn-xs" style="margin-left:2px"  onclick="location.href=\'programTask/programTaskUpdateDo?tid='+ids[i]+'\'">修改</button>';
	                        //delet = '<button class="btn btn-danger btn-xs" style="margin-left:2px"  onclick="$(\'#jqgrid\').delGridRow(\''+ids[i]+'\')">删除</button>';
	                        load = '<button class="btn btn-success btn-xs" style="margin-left:2px"  onclick="resetPassword('+ids[i]+')">下载文件</button>';
	                        t.jqGrid('setRowData',ids[i],{operation:query+alter+load});
                        }else{
	                        query = '<button class="btn btn-primary btn-xs" style="margin-left:2px" onclick="location.href=\'programTask/programTaskInfo?tid='+ids[i]+'\'">查看</button>';
	                        alter = '<button class="btn btn-info btn-xs" style="margin-left:2px"  onclick="location.href=\'programTask/programTaskUpdateDo?tid='+ids[i]+'\'">修改</button>';
	                        delet = '<button class="btn btn-danger btn-xs" style="margin-left:2px"  onclick="delProgramTask('+ids[i]+')">删除</button>';
	                        t.jqGrid('setRowData',ids[i],{operation:query+alter+delet});
                        }
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
		    
		    //模糊查询
		    $("#searchButton").click(function(){
		    	//$("#exactForm")[0].reset();
		    	var searchFilter = $("#searchText").val();
		    	if(searchFilter.length === 0){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    	t[0].p.search = true;
		    		searchFilter = " where  p.taskName like '%"+searchFilter+"%' or p.demanderUser.name like '%"+searchFilter+"%' or p.cnc.name like '%"+searchFilter+"%' or p.status.name like '%"+searchFilter+"%' or p.resultStatus.name like '%"+searchFilter+"%' or p.issueTime like '%"+searchFilter+"%' ";
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	//alert(searchFilter);
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    	
		    });
		    
		    
		      //精确搜索
		    $("#query").click(function(){
		    	var taskName = $.trim($("input[name='taskName']").val());
		    	var demanderUser = $.trim($("input[name='demanderUser']").val());
		    	var cnc = $.trim($("input[name='cnc']").val());
		    	var status = $.trim($("#status").val());
		    	if(taskName===""&&demanderUser===""&&cnc===""&&status===""){
		    		t[0].p.search = false;
		    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
		    	}else{
		    		var searchFilter = " where ";
		    		if(dateRangeSQL!==""){
		    			searchFilter += dateRangeSQL + " and ";
		    		}
		    		if(taskName!==""){
		    			searchFilter += " p.taskName like '%"+taskName+"%' and ";
		    		}
		    		if(demanderUser !==""){
		    			searchFilter += " p.demanderUser.name like '%"+demanderUser+"%' and ";
		    		}
		    		if(cnc !==""){
		    			searchFilter +=" p.cnc.name like '%"+cnc+"%' and ";
		    		}
		    		if(status !=="选择状态"){
		    			searchFilter +=" ( p.status.name like '%"+status+"%' or p.resultStatus.name like '%"+status+"%')  ";
		    		}else{
		    			searchFilter = searchFilter.substring(0,searchFilter.lastIndexOf('and '));
		    		}
		    		console.log(searchFilter);
		    		t[0].p.search = true;
		    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
		    	}
		    	t.trigger("reloadGrid",[{page:1,current:true}]);
		    	//return false;
		    });
		    
		    $("#refresh").click(function(){
		    	location.reload();
		    })
		})
		
		
		 var t2 = $("#cnc-jqgrid");
		    $("#cnc-jqgrid").length > 0 && (t2.jqGrid({
		        url: "",
		        mtype: "GET",
		        datatype: "local",
		        colNames: ['CNC公司名称','描述'],
		        colModel:[{
				            name: "cnc",
				            width:111,
				            sortable: !1,
				            align:"center"
				        },{
				        	name:"description",
				        	width:400,
		        			sortable: !1,
		        			align:"center"
				        }],
		        height: 250,
		        autowidth:!0,
		        rowNum: 10,
		        rowList: [10, 20, 30],
		        pager: "cnc-jqgrid-pager",
		        //sortname: "followUser.name",
		        viewrecords: !0,
		        sortorder: "asc",
		        multiselect: 1,
		    }).navGrid('#cnc-jqgrid-pager',{edit:false,add:false,del:false,search:false}));
		
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
