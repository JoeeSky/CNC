function fl_checkPassword(value,target){
    if(value==""){
        $(target+" span").text("密码不能为空");
        $(target).removeClass("hidden");
    }else{
        $(target).addClass("hidden");
    }
}

$(document).ready(function(){
	$("body").prepend('<div id="firstLogin"></div>');
	var fl = $("#firstLogin");
	fl.load("newPassword.html",function(responseTxt,statusTxt,xhr){
		 if(statusTxt=="success"){
			 $("#firstLogin_modal-id").modal({"backdrop":"static"});
			 $("#firstLogin_OK").click(function(){
				 var $newPassword = $("input[name='newPassword']");
				 var $repeatedPassword = $("input[name='repeatedPassword']");
                 if($newPassword.val()==""){
                    $("#passwordCheck span").text('密码不能为空');
                    $("#passwordCheck").removeClass('hidden');
                    $newPassword.focus();
                    return true;
                 }
                 if($repeatedPassword.val()==""){
                    $("#passwordCheck2 span").text('密码不能为空');
                    $("#passwordCheck2").removeClass('hidden');
                    $repeatedPassword.focus();
                    return true;
                 }
				 if($newPassword.val()!=$repeatedPassword.val()){
					 $("#passwordCheck span").text('两次密码不一致');
					 $("#passwordCheck").removeClass('hidden');
                     $newPassword.focus();
					 return true;
				 }
				 $.ajax({
					 url:"updateInitPassword.ajax",
					 type:"get",
					 dataType:"json",
					 data:$("#firstLogin_form").serializeArray(),
				     success:function(data){
				    	 alert("修改成功");
				    	 $("#firstLogin_modal-id").modal('hide');
				     },
				     error:function(data){
				    	 alert("修改失败");
				    	 $("#firstLogin_modal-id").modal('hide');
				     }
				 })
			 })
		 }
		 if(statusTxt=="error"){
			 alert("加载修改密码对话框失败");
		 }
	});
});