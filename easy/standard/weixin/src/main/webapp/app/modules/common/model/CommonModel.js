
define(['DMJSAll'], function(DMJS){
    var UserModel = DMJS.DMJSModel.extend({
        defaults: {
        },
        'commonData':{},
        
       //获取手机验证码和邮箱验证码
       	verifyCode:function(param){
       		var urlKey="common.verifyCode";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),'post');
       	},
        //验证手机验证码和邮箱验证码
       	commonVerifyCode:function(param){
       		var urlKey="common.commonVerifyCode";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),'post');
       	},
       	//上传图
       	uploadAttachment:function(param){
       		var urlKey="home.uploadAttachment";
       		this.commonRequest(_.extend({'urlKey':urlKey},param),'post');
       	},

        //地址（省、市、区）
    	searchAddress:function(param){
    		var urlKey="user.searchAddress";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
    	},

       	//上传单张图
       	uploadFile:function(param){
       		var urlKey="home.uploadFile";
       		this.commonRequest(_.extend({'urlKey':urlKey},param),'post');
       	},
       	//文本说明列表查询
       	findTextInstructList:function(param){
        	var urlKey="project.findTextInstructList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //项目验证状态
        isProAuthenticated:function(param){
        	var urlKey="project.isProAuthenticated";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
       	//系统常量
        findCache:function(param){
        	var urlKey="common.findCache";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //协议条款/合同模板列表查询
        clauseList:function(param){
        	var urlKey="common.clauseList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param));
        },
        //获取用户信息
        findLoginCache:function(param){
        	var urlKey="common.findLoginCache";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //获取第三方授权获得code地址
        gzhCallback:function(param){
        	var urlKey="common.goThirdAuthorize";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //微信授权
        gzhCallback:function(param){
        	var urlKey="common.gzhCallback";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //微博授权
        wbCallback:function(param){
        	var urlKey="common.wbCallback";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //qq授权
        qqCallback:function(param){
        	var urlKey="common.qqCallback";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //绑定登录
        frontRegisterUser:function(param){
        	var urlKey="common.frontRegisterUser";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
    });
    return UserModel;
});
