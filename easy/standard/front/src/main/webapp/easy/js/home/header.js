var HeaderTop=DM.Controller.sub({
	init:function(){
		
	},
	toInitProject:function(){
	    DM.ajax({
            url:"user/project/findUserStatus.do",
            data:{},
            success:function(data){
                if (data == '000000') {
                    window.location.href=basePath+"user/project/projectChoose.do";
                }else if (data == '31000004') {
                    Dialog.show({
                        msg:"很抱歉，您已被列入平台黑名单，无法发起项目。如有疑问，请联系平台客服人员。",
                        showClose: true,
                        picClass:"error",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
                        callBack:function(){
                            
                        }
                    });
                }
            },
            error:function(data){
                 Dialog.show("系统异常，请联系管理员","error");
            }
        });
	}
});
var headTop=new HeaderTop();
