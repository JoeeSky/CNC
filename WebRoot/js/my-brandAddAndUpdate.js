var lastSel = {'id':undefined,'name':''};

//品牌价值输入框输入验证函数，保证只能输入整数或小数
function clearNoNum(obj)
{
    //先把非数字的都替换掉，除了数字和.
    obj.value = obj.value.replace(/[^\d.]/g,"");
    //必须保证第一个为数字而不是.
    obj.value = obj.value.replace(/^\./g,"");
    //保证只有出现一个.而没有多个.
    obj.value = obj.value.replace(/\.{2,}/g,".");
    //保证.只出现一次，而不能出现两次以上
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
}
//format开头的函数：jqgrid列格式化函数
function formatUser(cellvalue, options, rowObject){
	if(cellvalue.id == null){
		return "";
	}
	return cellvalue.name;
	//return "<a target='_blank' href='userManage/userInfoDo?tid="+cellvalue.id+"'>"+cellvalue.name+"</a>";
}
function formatBrand(cellvalue, options, rowObject){
	if(cellvalue.id == null){
		return "";
	}
	return cellvalue.name;
	//return "<a target='_blank' href='brandManage/brandInfoDo?tid="+cellvalue.id+"'>"+cellvalue.name+"</a>";
}
$(document).ready(function(){
	$("#valuePopover").popover(); //品牌价值输入框的提示信息

    $("body").prepend("<div id='modal_box'></div>");

	$("#modal_box").load("brandCommonPool.html",function(){
		var t = $("#brand-jqgrid");
	    $("#brand-jqgrid").length > 0 && (t.jqGrid({
	        url: "brandManage/listBrand2.ajax",
	        mtype: "GET",
	        datatype: "local",
	        colNames: ['','品牌名称','修改时间','修改人'],
	        colModel: [{
	        	name:"name",
	        	sortable:false,
	        	search: !1,
	        	hidden: !0
	        },{
	            name: "nameLink",
	            width:170,
	            index: "name",
	            align:"center",
	            formatter:formatBrand
	        },
	        {
	        	name:"alterTimestamp",
	        	width:170,
				index:"alterTimestamp",
				align:"center"
	        },
	        {
	        	name:"alterUserName",
	        	width:170,
				index:"alterUser.name",
				align:"center",
				formatter:formatUser
	        }],
	        height: 200,
	        autowidth:!0,
	        rowNum: 10,
	        rowList: [10, 20, 30],
	        pager: "brand-jqgrid-pager",
	        sortname: "name",
	        viewrecords: !0,
	        sortorder: "asc",
	        multiselect: !0,
	        gridComplete:function(){
	        	if(lastSel.id!=undefined)
	        		t.jqGrid('setSelection',lastSel.id,false);
	        },
	        beforeSelectRow:function(rowid, e){
	            t.jqGrid('resetSelection');
	            return true;
	        },
	        onSelectRow: function(rowId, status, e) {
		        if (rowId == lastSel.id) {
		            $(this).jqGrid("resetSelection");
		            lastSel.id = undefined;
		            status = false;
		        } else {
		            lastSel.id = rowId;
		            lastSel.name = t.jqGrid('getCell',rowId,'name');
		        }
		    }
	    }).navGrid('#brand-jqgrid-pager',{edit:false,add:false,del:false,search:false}));

		//选择关联品牌
		$("#brand-modal-id").on('show.bs.modal',function(){
			if($("#for_pid").val() == ""){
				lastSel = {'id':undefined,'name':''};
				t.jqGrid('setGridParam',{datatype:'json'}).trigger("reloadGrid",[{page:1}]);
			}else{
				lastSel.id = $("#for_pid").val();
				lastSel.name =  $("#selectBrand span").text();
				t.jqGrid('setGridParam',{datatype:'json'}).trigger("reloadGrid");
			}
			$('#cb_brand-jqgrid').addClass('hidden');
		})
		$("#brand-ok").click(function(){
			if(lastSel.id!=undefined){
				$("#selectBrand span").text(lastSel.name);
				$("#selectBrand").removeClass("hidden");
				$("#deleteSelect").removeClass("hidden");
				$("#for_pid").val(lastSel.id);
			}else{
				$("#deleteSelect").click();
			}
			$("#brand-modal-id").modal('hide');
		})
		$("#deleteSelect").click(function(){
			$("#selectBrand span").text("");
			$("#selectBrand").addClass("hidden");
			$("#for_pid").val("");
			$(this).addClass("hidden");
		})

		//模糊搜索
	    $("#brand-searchText").keypress(function(event){
	    	if(event.keyCode == "13"){
	    		$("#brand-searchButton").click();
	    	}
	    });
	    $("#brand-searchButton").click(function(){
	    	var searchFilter = $("#brand-searchText").val();
	    	if(searchFilter.length === 0){
	    		t[0].p.search = false;
	    		$.extend(t[0].p.postData,{searchString:"",searchField:"",searchOper:""});
	    	}else{
	    		t[0].p.search = true;
	    		$.extend(t[0].p.postData,{searchString:searchFilter,searchField:"allfieldsearch",searchOper:"cn"});
	    	}
	    	t.trigger("reloadGrid",[{page:1,current:true}]);
	    })
	});

    $("input[name='name']").maxlength({
    	maxCharacters:50,
    	status:false,
    	showAlert:true,
    	alertText:"您输入的长度过长！"
    })
})