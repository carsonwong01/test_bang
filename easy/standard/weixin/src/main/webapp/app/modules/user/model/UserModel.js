
define(['Lib/md5'], function(MD5) {
    var UserModel = DMJS.DMJSModel.extend({
        defaults: {
        },
        'commonData': {},
       	thirdParty:function(param){//第三方授权
	    	var urlKey="user.thirdParty";
	    	this.commonRequest(_.extend({'urlKey':urlKey},param));
        },
        loginCheck:function(param){//登录
	    	var urlKey="user.loginCheck";
	    	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findAccInfo:function(param){//个人设置
        	var urlKey="user.findAccInfo";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findTradeList:function(param){//交易明细
        	var urlKey="user.findTradeList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findAddress:function(param){//获取收货地址
        	var urlKey="user.findAddress";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        findAddressDetail:function(param){//获取收货地址详情
        	var urlKey="user.findAddressDetail";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        updateAddress:function(param){//增、删、改收货地址
        	var urlKey="user.updateAddress";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        post:function(param){//发货
        	var urlKey="user.post";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        confirmReceipt:function(param){//确认收货
        	var urlKey="user.confirmReceipt";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //查询银行卡列表
        getBankList:function(param){
        	var urlKey="user.getBankList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //添加银行卡
        addBankCard:function(param){
        	var urlKey="user.addBankCard";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
      //删除银行卡
        deleteBankCard:function(param){
        	var urlKey="user.deleteBankCard";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //查询帮助中心问题列表
        getHelpList:function(param){
        	var urlKey="user.getHelpList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param));
        },
        //关注列表
        collectionList:function(param){
        	var urlKey="user.collectionList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //取消关注
        cancelCollect:function(param){
        	var urlKey="user.cancelCollect";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //我的订单（支持的列表）
        supportList:function(param){
        	var urlKey="user.supportList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //我发起的项目
        myInitProjectList:function(param){
        	var urlKey="user.myInitProjectList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //项目订单支持列表
        prosupportList:function(param){
        	var urlKey="user.prosupportList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
	    //我的账户（金额）
	    myAmount:function(param){
	        var urlKey="user.myAmount";
	        this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
	    },
	    //账户交易记录
        transRecords:function(param){
        	var urlKey="user.transRecords";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //冻结项目列表
        findFreezePro:function(param){
        	var urlKey="user.findFreezePro";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //实名认证
        authentication:function(param){
        	var urlKey="user.authentication";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //实名认证成功信息
        findAuthentication:function(param){
        	var urlKey="user.findAuthentication";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //查询身份证是否唯一
        idCardUnique:function(param){
        	var urlKey="user.idCardUnique";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //修改个人信息
        updateUserBaseInfo:function(param){
        	var urlKey="user.updateUserBaseInfo";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //修改交易密码
        updateTradePwd:function(param){
        	var urlKey="user.updateTradePwd";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //检查原交易密码
        checkTradePassword:function(param){
        	var urlKey="user.checkTradePassword";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },

        //找回密码发送验证码
        getPasswordCode:function(param){
        	var urlKey="user.getPasswordCode";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //上传用户图像
        uploadFile:function(param){
        	var urlKey="home.uploadFile";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
      //查询提现设置常量
        findWithdrawSet:function(param){
        	var urlKey="home.findWithdrawSet";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //查询是否设置交易密码
        checkSettingTradePwd:function(param){
        	var urlKey="home.checkSettingTradePwd";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //申请提现
        insertWithdraw:function(param){
        	var urlKey="user.insertWithdraw";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //发起项目订单支持详情
        supportDetail:function(param){
        	var urlKey="user.supportDetail";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //意见反馈
        suggestion:function(param){
        	var urlKey="user.suggestion";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //删除项目
        prodelete:function(param){
        	var urlKey="user.prodelete";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //提前结束
        finish:function(param){
        	var urlKey="user.finish";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //更新项目动态
        addDynamic:function(param){
        	var urlKey="user.addDynamic";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //账户绑定的第三方账号列表
        findThirdPartyList:function(param){
        	var urlKey="user.findThirdPartyList";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //解绑第三方账号
        unbundling:function(param){
        	var urlKey="user.unbundling";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //绑定第三方账号
        addThirdUser:function(param){
        	var urlKey="user.addThirdUser";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //支付订单
        payOrder:function(param){
        	var urlKey="user.payOrder";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //退出登录
        logout:function(param){
        	var urlKey="user.logout";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        },
        //取消订单
        cancel:function(param){
        	var urlKey="user.cancel";
        	this.commonRequest(_.extend({'urlKey':urlKey},param),"post");
        }
    });
    return UserModel;
});
