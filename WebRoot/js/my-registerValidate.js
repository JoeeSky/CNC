var nameValid = false;

function ccheckName(value){
	if(value){
		$.ajax({
			url:"register/checkCncName.ajax?name="+value,
			type:"get",
			dataType:"json",
			success:function(data){
				if(!data.info){
					$("#cnameCheck span").text('公司名称已存在');
					$("#cnameCheck").removeClass("hidden");
					nameValid = false;
				}else{
					$("#cnameCheck").addClass("hidden");
					nameValid = true;
				}
			}
		})
	}else{
		$("#cnameCheck").addClass("hidden");
	}
}


function ccheckPinyin(value){
	if(value!=""){
		$("#cpinyinCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#cpinyinCheck span").text('公司拼音不能为空');
		$("#cpinyinCheck").removeClass("hidden");
		nameValid = false;
	}
}

function ccheckAddress(value){
	if(value!=""){
		$("#caddressCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#caddressCheck span").text('公司地址不能为空');
		$("#caddressCheck").removeClass("hidden");
		nameValid = false;
	}
}

function ccheckContact(value){
	if(value!=""){
		$("#ccontactCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#ccontactCheck span").text('联系人不能为空');
		$("#ccontactCheck").removeClass("hidden");
		nameValid = false;
	}
}

function ccheckEmail(value){
	if(value!=""){
		$("#cemailCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#cemailCheck span").text('邮箱不能为空');
		$("#cemailCheck").removeClass("hidden");
		nameValid = false;
	}
}

function ccheckMobile(value){
	if(value!=""){
		$("#cmobileCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#cmobileCheck span").text('手机不能为空');
		$("#cmobileCheck").removeClass("hidden");
		nameValid = false;
	}
}

function ccheckTel(value){
	if(value!=""){
		$("#ctelCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#ctelCheck span").text('电话不能为空');
		$("#ctelCheck").removeClass("hidden");
		nameValid = false;
	}
}


$(document).ready(function() {
$("#cnc_save").click(function(){
	if(!$("input[name='cnc.name']").val()){
		nameValid = false;
		$("#cnameCheck span").text('公司名称不能为空');
		$("#cnameCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.pinyin']").val()){
		nameValid = false;
		$("#cpinyinCheck span").text('公司拼音不能为空');
		$("#cpinyinCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.address']").val()){
		nameValid = false; 
		$("#caddressCheck span").text('公司地址不能为空');
		$("#caddressCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.contact']").val()){
		nameValid = false;
		$("#ccontactCheck span").text('联系人不能为空');
		$("#ccontactCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.email']").val()){
		nameValid = false;
		$("#cemailCheck span").text('邮箱不能为空');
		$("#cemailCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.mobile']").val()){
		nameValid = false;
		$("#cmobileCheck span").text('手机不能为空');
		$("#cmobileCheck").removeClass("hidden");
	}
	if(!$("input[name='cnc.tel']").val()){
		nameValid = false;
		$("#ctelCheck span").text('电话不能为空');
		$("#ctelCheck").removeClass("hidden");
	}
					
	if(nameValid){
	$.ajax({
		url:"register/addCnc.ajax",
		type:"post",
		data:$("#form_cnc").serializeArray(),
		dataType:"json",
		success:function(data){
			if(data.info){
				alert('成功！');
				location.reload();
				//$("#form_save")[0].reset();
			}else{
				alert('失败！');
			}
		},
		error:function(data){
			alert('失败！');
			}
		})
		}
	})

});

/******************************************************************/

function dcheckName(value){
	if(value){
		$.ajax({
			url:"register/checkDemanderName.ajax?name="+value,
			type:"get",
			dataType:"json",
			success:function(data){
				if(!data.info){
					$("#nameCheck span").text('公司名称已存在');
					$("#nameCheck").removeClass("hidden");
					nameValid = false;
				}else{
					$("#nameCheck").addClass("hidden");
					nameValid = true;
				}
			}
		})
	}else{
		$("#nameCheck").addClass("hidden");
	}
}


function dcheckPinyin(value){
	if(value!=""){
		$("#pinyinCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#pinyinCheck span").text('公司拼音不能为空');
		$("#pinyinCheck").removeClass("hidden");
		nameValid = false;
	}
}

function dcheckAddress(value){
	if(value!=""){
		$("#addressCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#addressCheck span").text('公司地址不能为空');
		$("#addressCheck").removeClass("hidden");
		nameValid = false;
	}
}

function dcheckContact(value){
	if(value!=""){
		$("#contactCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#contactCheck span").text('联系人不能为空');
		$("#contactCheck").removeClass("hidden");
		nameValid = false;
	}
}

function dcheckEmail(value){
	if(value!=""){
		$("#emailCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#emailCheck span").text('邮箱不能为空');
		$("#emailCheck").removeClass("hidden");
		nameValid = false;
	}
}

function dcheckMobile(value){
	if(value!=""){
		$("#mobileCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#mobileCheck span").text('手机不能为空');
		$("#mobileCheck").removeClass("hidden");
		nameValid = false;
	}
}

function dcheckTel(value){
	if(value!=""){
		$("#telCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#telCheck span").text('电话不能为空');
		$("#telCheck").removeClass("hidden");
		nameValid = false;
	}
}


$(document).ready(function() {
$("#demander_save").click(function(){
	if(!$("input[name='demander.name']").val()){
		nameValid = false;
		$("#nameCheck span").text('公司名称不能为空');
		$("#nameCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.pinyin']").val()){
		nameValid = false;
		$("#pinyinCheck span").text('公司拼音不能为空');
		$("#pinyinCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.address']").val()){
		nameValid = false; 
		$("#addressCheck span").text('公司地址不能为空');
		$("#addressCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.contact']").val()){
		nameValid = false;
		$("#contactCheck span").text('联系人不能为空');
		$("#contactCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.email']").val()){
		nameValid = false;
		$("#emailCheck span").text('邮箱不能为空');
		$("#emailCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.mobile']").val()){
		nameValid = false;
		$("#mobileCheck span").text('手机不能为空');
		$("#mobileCheck").removeClass("hidden");
	}
	if(!$("input[name='demander.tel']").val()){
		nameValid = false;
		$("#telCheck span").text('电话不能为空');
		$("#telCheck").removeClass("hidden");
	}
					
	if(nameValid){
	$.ajax({
		url:"register/addDemander.ajax",
		type:"post",
		data:$("#form_demander").serializeArray(),
		dataType:"json",
		success:function(data){
			if(data.info){
				alert('成功！');
				location.reload();
				//$("#form_save")[0].reset();
			}else{
				alert('失败！');
			}
		},
		error:function(data){
			alert('失败！');
			}
		})
		}
	})

});
/**********************************************************************/

function mcheckName(value){
	if(value){
		$.ajax({
			url:"register/checkManufacturerName.ajax?name="+value,
			type:"get",
			dataType:"json",
			success:function(data){
				if(!data.info){
					$("#mnameCheck span").text('公司名称已存在');
					$("#mnameCheck").removeClass("hidden");
					nameValid = false;
				}else{
					$("#mnameCheck").addClass("hidden");
					nameValid = true;
				}
			}
		})
	}else{
		$("#mnameCheck").addClass("hidden");
	}
}


function mcheckPinyin(value){
	if(value!=""){
		$("#mpinyinCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#mpinyinCheck span").text('公司拼音不能为空');
		$("#mpinyinCheck").removeClass("hidden");
		nameValid = false;
	}
}

function mcheckAddress(value){
	if(value!=""){
		$("#maddressCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#maddressCheck span").text('公司地址不能为空');
		$("#maddressCheck").removeClass("hidden");
		nameValid = false;
	}
}

function mcheckContact(value){
	if(value!=""){
		$("#mcontactCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#mcontactCheck span").text('联系人不能为空');
		$("#mcontactCheck").removeClass("hidden");
		nameValid = false;
	}
}

function mcheckEmail(value){
	if(value!=""){
		$("#memailCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#memailCheck span").text('邮箱不能为空');
		$("#memailCheck").removeClass("hidden");
		nameValid = false;
	}
}

function mcheckMobile(value){
	if(value!=""){
		$("#mmobileCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#mmobileCheck span").text('手机不能为空');
		$("#mmobileCheck").removeClass("hidden");
		nameValid = false;
	}
}

function mcheckTel(value){
	if(value!=""){
		$("#mtelCheck").addClass("hidden");
		nameValid = true;
	}else{
		$("#mtelCheck span").text('电话不能为空');
		$("#mtelCheck").removeClass("hidden");
		nameValid = false;
	}
}


$(document).ready(function() {
$("#manufacturer_save").click(function(){
	if(!$("input[name='manufacturer.name']").val()){
		nameValid = false;
		$("#mnameCheck span").text('公司名称不能为空');
		$("#mnameCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.pinyin']").val()){
		nameValid = false;
		$("#mpinyinCheck span").text('公司拼音不能为空');
		$("#mpinyinCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.address']").val()){
		nameValid = false; 
		$("#maddressCheck span").text('公司地址不能为空');
		$("#maddressCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.contact']").val()){
		nameValid = false;
		$("#mcontactCheck span").text('联系人不能为空');
		$("#mcontactCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.email']").val()){
		nameValid = false;
		$("#memailCheck span").text('邮箱不能为空');
		$("#memailCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.mobile']").val()){
		nameValid = false;
		$("#mmobileCheck span").text('手机不能为空');
		$("#mmobileCheck").removeClass("hidden");
	}
	if(!$("input[name='manufacturer.tel']").val()){
		nameValid = false;
		$("#mtelCheck span").text('电话不能为空');
		$("#mtelCheck").removeClass("hidden");
	}
					
	if(nameValid){
	$.ajax({
		url:"register/addManufacturer.ajax",
		type:"post",
		data:$("#form_manufacturer").serializeArray(),
		dataType:"json",
		success:function(data){
			if(data.info){
				alert('成功！');
				location.reload();
				//$("#form_save")[0].reset();
			}else{
				alert('失败！');
			}
		},
		error:function(data){
			alert('失败！');
			}
		})
		}
	})

});