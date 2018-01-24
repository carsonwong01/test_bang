//require.config.js
require.config({
    // localCachePath变量定义在require.js文件中
    // 如果该值为真，意味当前工作在android设备上，并且已开启离线缓存
    // android设备上的离线缓存解决方案，要求baseUrl的值为空字符串localCachePath ? '' : '/SMTResourceNew/PAEsales/',
    baseUrl: localCachePath ? '' : '',
    shim: {
    	'jQuery': {
            exports: "jQuery"
        },
        'mobiscroll_core': {
            deps: ['jQuery'],
            exports: 'mobiscroll_core'
        },
        'mobiscroll_select': {
            deps: ['mobiscroll_core'],
            exports: 'mobiscroll_select'
        },
        'mobiscroll_android': {
            deps: ['mobiscroll_select'],
            exports: 'mobiscroll_android'
        },
        'mobiscroll_android_ics': {
            deps: ['mobiscroll_android'],
            exports: 'mobiscroll_android_ics'
        },
        'mobiscroll_datetime': {
            deps: ['mobiscroll_android_ics'],
            exports: 'mobiscroll_datetime'
        },
        'mobiscroll_list': {
            deps: ['mobiscroll_datetime'],
            exports: 'mobiscroll_list'
        },
        'mobiscrollAll': {
            deps: ['mobiscroll_list'],
            exports: 'mobiscrollAll'
        },
        'xml2json': {
            deps: ['zepto'],
            exports: 'xml2json'
        },
         'percentage': {
             deps: ['jQuery'],
             exports: "percentage"
         },
        'zepto': {
            exports: '$'
        },
        
        'underscore': {
            exports: '_'
        },
        'backbone': {
            deps: ['text', 'zepto', 'underscore'],
            exports: 'Backbone'
        },
        'utils': {
            deps: ['zepto'],
            exports: "tp1"
        },
        "commonClass/scroll/iscroll": {
            exports: "iScroll"
        },
    },
    paths: {
        text: 'assets/plugins/require/text',
        zepto: 'assets/lib/zepto/zepto',
        //xml2json: 'assets/plugins/zepto/zepto.xml2json-min',
        underscore: 'assets/lib/underscore/underscore',
        backbone: 'assets/lib/backbone/backbone',
        Lib: 'assets/lib',
        jQuery: 'assets/lib/jquery/jquery-1.11.2.min',
        mobiscrollAll: 'assets/plugins/mobiscroll/mobiscrollAll',
        jQueryMobile: 'assets/lib/jquery/jquery.mobile.custom.min',
        mobiscroll_core: 'assets/plugins/mobiscroll/mobiscroll.core-2.6.2',
        mobiscroll_select: 'assets/plugins/mobiscroll/mobiscroll.select-2.6.2',
        mobiscroll_android: 'assets/plugins/mobiscroll/mobiscroll.android',
        mobiscroll_android_ics: 'assets/plugins/mobiscroll/mobiscroll.android-theme',
        mobiscroll_datetime: 'assets/plugins/mobiscroll/mobiscroll.datetime-2.6.2',
        mobiscroll_list: 'assets/plugins/mobiscroll/mobiscroll.list-2.6.2',
        common: 'app/modules/common',
        commonConfig: 'app/modules/common/config',
        commonController: 'app/modules/common/controller',
        commonModel: 'app/modules/common/model',
        commonView: 'app/modules/common/view',
        commonTemplate: 'app/modules/common/template',
        commonClass: 'app/modules/common/class',
        commonTool: 'app/modules/common/tool',
        commonData: 'app/modules/common/data'
    },
    waitSeconds: 15
});
requirejs.onError = function(a, b, c) {
//	Native.throwException(a.toString(),a.requireType);
    if (confirm("由于网络不给力，部分资源加载失败！是否重新加载？")) {
        window.location.reload();
    }
}
//weixin.js
define("commonClass/weixin", ["Lib/native/weixin",'Lib/base64'], function(core,Base64) {
    var weixin = {
        "config": function() {
        	DMJS.Request("common.getJsTicketInfo", {
                type: "get",
                dataType: "jsonp",
                data: {url: location.href.split('#')[0]},
                unBort: true,
                cancelLightbox: true,
                success: function(response) {
                    core.config({
                        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                        appId: response.data.appId, // 必填，公众号的唯一标识
                        timestamp: response.data.timestamp, // 必填，生成签名的时间戳
                        nonceStr: response.data.noncestr, // 必填，生成签名的随机串
                        signature: response.data.signature, // 必填，签名，见附录1
                        jsApiList: ["checkJsApi",'onMenuShareAppMessage','onMenuShareTimeline',"onMenuShareQQ","onMenuShareWeibo","onMenuShareQZone","chooseWXPay"] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
                    });
                }
            });
        },
        "init": function() {
            this.config();
            core.ready(_.bind(this.success, this));
            core.error(_.bind(this.error, this));
        }, "success": function() {
        	core.checkJsApi({
        	    jsApiList: ['onMenuShareAppMessage','onMenuShareTimeline',"onMenuShareQQ","onMenuShareWeibo","onMenuShareQZone","chooseWXPay"] ,// 需要检测的JS接口列表，所有JS接口列表见附录2,
        	    success: function(res) {
        	        // 以键值对的形式返回，可用的api值true，不可用为false
        	        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
        	    }
    	    });
            core.hideMenuItems({
                menuList: ["menuItem:originPage", "menuItem:copyUrl", "menuItem:openWithQQBrowser", "menuItem:openWithSafari"] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
            core.showMenuItems({
                menuList: ["menuItem:share:weiboApp", "menuItem:share:facebook", "menuItem:share:QZone"] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
//				this.seStp();
        }, "error": function() {
            console.info("weixin api  error");
            console.info("weixin error");
        }, "exit": function() {
            core.closeWindow();
        }, "step": function() {
            core.hideMenuItems({
                menuList: ["menuItem:originPage", "menuItem:copyUrl", "menuItem:openWithQQBrowser", "menuItem:openWithSafari"] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
            core.showMenuItems({
                menuList: ["menuItem:share:weiboApp", "menuItem:share:facebook", "menuItem:share:QZone"] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
        },"previewImage":function(nowHttp,urls){
        	core.previewImage({
			    current: nowHttp, // 当前显示图片的http链接
			    urls: urls // 需要预览的图片http链接列表
			});
        }

    };
    return weixin;
});
//Native.js
define("Native", function() {
    window.Native = {
        "openChildWebActivity": function(url, config) {
            console.log("打开第三方子页面:" + url);
            if (Config.logic("isWeixin")) {
//				DMJS.CommonTools.showBrowser({"url":url,"title":config&&config.title?config.title:"外 部 资 源"});
                return location.href = url;
            }
/*            cordova.exec(
                    function() {
                        console.log("加载第三方子页面")
                    },
                    function() {
                        alert("加载第三方子页面失败")
                    },
                    "views",
                    "openChildWebActivity",
                    [url]);*/
        },
        "exit": function() {
            DMJS.killRequest();
            if (Config.logic("isWeixin")) {
                require(["commonClass/weixin"], function(weixin) {
                    weixin.exit();
                });
                return;
            }
            cordova.exec(
                    function() {
                        console.log("关闭程序OK")
                    },
                    function() {
                        console.log("关闭程序fail")
                    },
                    "views",
                    "exitApp",
                    []);
            return;
        },
        alert: function(option, callback) {
            var butonLable = callback ? "确定" : undefined;
           // cordova.exec(callback, null, "dialog", "alert", [option.content, option.title, butonLable]);
        },
        confirm: function(option, FBntconfirm, FBntcancel) {
            var resultCallback = function(index) {
                if (index == 1) {
                    FBntcancel();
                } else if (index == 2) {
                    FBntconfirm();
                }
            }
            //cordova.exec(resultCallback, null, "dialog", "confirm", [option.content, option.title, [option.FBntcancel, option.FBntconfirm]]);
        },
        "getAppInfo": function(doAppInfo) {
            cordova.exec(
                    doAppInfo,
                    function() {
                        console.log("获取APP信息失败")
                    },
                    "device",
                    "getDeviceInfo",
                    []);
            return;
        },
        "dmjsReady": function() {
            if (DMJS.isReady) {
                return;
            }
            cordova.exec(
                    function() {
                        console.log("通知成功")
                    },
                    function() {
                        console.log("通知失败")
                    },
                    "views",
                    "dmjsReady",
                    []);
            return;
        },
        "openView": function(hash, config) {
           /* cordova.exec(
                    function() {
                        console.log("通知成功")
                    },
                    function() {
                        console.log("通知失败")
                    },
                    "views",
                    "openview",
                    [hash, config]);*/
            return;
        },
        "syncCrossData": function(id, val) {
            cordova.exec(
                    function(data) {
                        console.log("通知成功:" + data);
                        DMJS.userInfo = data;
                    },
                    function() {
                        console.log("通知失败")
                    },
                    "views",
                    "syncCrossData",
                    [id, val]);
            return;
        },
        "tip": function(message) {
            if (!this.ready) {
                DMJS.CommonTools.popTip(message, 1000);
                return;
            }
            cordova.exec(
                    function() {
                        console.log("通知成功")
                    },
                    function() {
                        console.log("通知失败")
                    },
                    "views",
                    "tip",
                    [message]);
            return;
        },
        "share": function(message) {
            cordova.exec(
                    function() {
                        console.log("通知成功")
                    },
                    function() {
                        console.log("通知失败")
                    },
                    "views",
                    "share",
                    [message]);
            return;
        }
    };

    var ua = navigator.userAgent.toLowerCase(), //
            android = ua.indexOf('android') != -1; //
    if (!window.cordova) {
        window.cordova = {'exec': function() {
                console.log("使用调用native功能，打包后使用!");
            }};
        Native.isReady = false;
    } else {
        window.open = function(url, target) {
            cordova.exec(function() {
            }, function() {
            }, "InAppBrowser", "open", [url, target, ""]);
        }
        Native.isReady = true;
    }
    return window.Native;
});


//commonConfig/base.js
define("commonConfig/base", ["DMJS", "Native"], function(PAWA) {
    window.Config = {
        /**
         * 当前请求数
         */
    	isTg:false,
        ajaxCount: 0,
        isDMJSReady: false,
        pageSize: 10,
        logLever: 2,
        requestEncrypt: false,
        lazyRender: 350,
        interFace: "/dev",
        appName: "帮你筹",
        trunKey: "P9f0CNEiozgJ3etIp",
        anim: {
            "in": "pt-page-moveFromRight",
//	        	"out":"pt-page-scaleDown"
            "out": "pt-page-moveToLeft123"
        },
        /**
         * 初始化全局配置
         */
        init: function() {
        	
            // ajax默认配置
            var ajaxSettings = $.ajaxSettings;
            ajaxSettings.lightboxHide = true;
            ajaxSettings.dataType = "json";
            ajaxSettings.beforeSendCallback = function() {
            };
            ajaxSettings.beforeSend = function(xhr) {
                ajaxSettings.beforeSendCallback(xhr);
                ajaxSettings.beforeSendCallback = function() {
                };
                if (Config.ajaxCount >= 0) {
                    // 第一个请求开始  有的请求是不需要遮罩层的..........
                    if (!$.ajaxSettings.cancelLightbox) {
                        if (wrapView.FlipPrompt && !wrapView.FlipPrompt.isBlock) {
                            wrapView.FlipPrompt.loading("正在加载...", false);
                        }
                    }
                }
                if (!$.ajaxSettings.cancelLightbox) {
                    Config.ajaxCount++;
                }
            };
            ajaxSettings.complete = function() {
                Config.ajaxCount--;
                if (Config.ajaxCount <= 0) {
                    Config.ajaxCount = 0;
                    if (ajaxSettings.lightboxHide == true) {
                        // 所有请求结束
                        if (wrapView && wrapView.FlipPrompt) {
                            wrapView.FlipPrompt.colse(true);
                        }
                    } else {
                        ajaxSettings.lightboxHide = true;
                    }
                }
            },
                    console.log("even backbutton");
            //document.addEventListener("resume",function(){
//	            	Native.toHandPasswordCheck(true);
            //},false);
            document.addEventListener("backbutton", function() {
                var __isBlock = $("#FlipPrompt").length > 0 && $("#FlipPrompt").css("display") != "none";

                if (__isBlock) {
                    return;
                }
                if (window.wrapView == undefined) {
                    return Native.exit();
                } else if (wrapView.headCalls && wrapView.headCalls.left) {
                    if ($("div.dw-persp").length > 0) {
                        return;
                    } else {
                        return wrapView.headCalls.left();
                    }
                }
                wrapView.lightBox.index = 0;
                wrapView.FlipPrompt.confirm({
                    title: "退出程序",
                    content: "<span>确定退出程序?</span>",
                    FBntconfirm: "取消",
                    FBntcancel: "退出",
                    FBntCancelColor: "pop_btn_orange",
                    notHideProp: true
                }, function() {

                }, function() {
                    Native.exit();
                });
            }, false);
//	            ajaxSettings.beforeSend = function(xhr) {
//	            	wrapView.lightBox.show();
//	            };
//	            ajaxSettings.complete = function() {
            //
//	    			wrapView.lightBox.hide();
//	            };
        }
    };


    Config.base = function(name) {
        return Config[name];
    };

    Config.base.configDone = function(callback) {
        Config.init();
        if (Native.isReady) {
            document.addEventListener('deviceready', function() {
                if (!Config.base("isDMJSReady")) {
                    Native.getAppInfo(function(response) {
                        Config.isDMJSReady = true;
                        console.log("获取设备信息:" + JSON.stringify(response));
                        _.extend(Config, response);
                        callback();
                    });
                }
            }, false);
        } else {
            callback();
        }
    };
    return Config.base;
});

//commonConfig/lang.js
define("commonConfig/lang", ['commonConfig/base'], function() {
    var langConfig = {
        netWorkUnavailable: "您的网络现在不给力哦...",
        alertCommonTitle: "温馨提示",
        sessionUnDestory: "检测到您仍处于登录状态!",
        pickcashSuccessSuccess: "恭喜您！提现申请成功，请等待运营人员审核！"
    };

    Config.lang = function(name) {
        var str = langConfig[name] || '';
        return str;
    };
    return Config.lang;
});


//commonConfig/logic.js
define("commonConfig/logic", ['commonConfig/base'], function() {
    var logicConfig = {
        cardWithDM: true,
        idPasswordMd5: false,
        tranPasswordWithDM: true,
        isWeixin: true
    };

    Config.logic = function(name) {
        return logicConfig[name] || false;
    };
    return Config.logicConfig;
});

//commonConfig/url.js
define("commonConfig/url", ["commonConfig/base"], function() {
    //var interFace = Config.base("interFace");
    /*
     * 说明：分离式部署特殊设计
     * 当分离部署到生产环境时，特殊接口访问生产环境
     * http://61.145.159.156:8400/front/
     * https://www.72xs.com
     * http://qingwx.dimengwx.cc
     */
    var domainLists = {
    	 "localhost": "/weixin/weixin/",
    	 'imgAddress':'http://www.365bangnichou.com',
     	  "remote": "http://www.365bangnichou.com/platform/",
//       'imgAddress':'http://192.168.0.217:8080',
//       "remote": "http://192.168.0.217:8080/platform/",
    };
    var urlConfig = {
    		
    	//common
		"common.verifyCode":"common/message/v/verifyCode",//获取手机/邮件验证码
		"common.commonVerifyCode":"common/message/v/commonVerifyCode",//验证手机/邮件验证码
		"common.findCache":"system/cache/v/findCache",//获取系统常量
		"common.findLoginCache":"system/cache/v/findLoginCache",//获取用户缓存信息
		"common.clauseList":"site/siteSet/v/clauseList",//协议条款/合同模板列表查询
		"common.goThirdAuthorize":"thirdAuthorize/v/goThirdAuthorize",//获取第三方授权获得code地址
		"common.gzhCallback":"thirdAuthorize/v/gzhCallback",//微信绑定登录
		"common.wbCallback":"thirdAuthorize/v/wbCallback",//微博绑定登录
		"common.qqCallback":"thirdAuthorize/v/qqCallback",//QQ绑定登录
		"common.frontRegisterUser":"home/frontInfo/v/frontRegisterUser",//绑定授权登录
		"common.getJsTicketInfo":"share/v/wx/getJsTicketInfo?func=adf",//微信鉴权
		
		//home
		"home.uploadAttachment":"home/appData/v/uploadAttachment",//上传图
		"home.uploadFile":"home/appData/v/uploadFile",//上传单张图
		"home.findWithdrawSet":"operation/basicInfoSet/v/findWithdrawSet",//查询提现设置常量
		
		//index
		"index.totalMessage":"home/frontInfo/v/frontTotalInfo",//首页广告，统计
		"index.recommendList":"home/frontInfo/v/findRecommendList",//首页推荐
		"index.noticeDetail":"site/media/v/reportDetail",//公告详情
		"index.projectDetailsCon":"project/query/v/projectDetails",//项目详情内容（项目详情）
		"index.projectDynamic":"project/query/v/dynamic",//项目详情（项目动态）
		"index.insertComment":"project/query/v/insertComment",//项目详情（项目插入评论）
		"index.projectCommentList":"project/query/v/commentList",//项目详情（项目支持留言列表）
		"index.collect":"project/operate/v/collect",//关注项目
		"index.inform":"project/operate/v/inform",//举报
		"index.support":"finance/paymentManage/v/support",//支持下单
		"index.paymentManage":"finance/paymentManage/v/support.do",//支持下单
		"index.supportOrderStatus":"finance/paymentManage/v/supportOrderStatus",//订单结果详细情况
		"index.findReturnOrDreamList":"project/query/v/findReturnOrDreamList",//查询梦想或回报列表

		//user
		"user.thirdParty":"home/v/register",//第三方授权
		"user.loginCheck":"home/frontInfo/v/loginCheck",//手机号登录
		"user.findAccInfo":"user/userManage/v/findAccInfo",//个人设置
		"user.findTradeList":"user/userManage/v/findTradeList",//交易明细
		"user.findAddress":"user/addressManage/v/findAddress",//收货地址获取
		"user.updateAddress":"user/addressManage/v/updateAddress",//编辑、新增、删除收货地址
		"user.findAddressDetail":"user/addressManage/v/findAddressDetail",//查询收货地址详情
		"user.getBankList":"user/bankCardManage/v/findCardList",//获取银行卡列表
		"user.addBankCard":"user/bankCardManage/v/addBankCard",//添加银行卡
		"user.deleteBankCard":"user/bankCardManage/v/deleteBankCard",//删除银行卡
		"user.getHelpList":"site/helpCenter/v/helpCenterList",//获取帮助中心列表
		'user.searchAddress':'/system/common/v/provincialLeague',//省市区级联
		"user.collectionList":"project/operate/v/collectionList",//获取关注列表
		"user.cancelCollect":"project/operate/v/cancelCollect",//取消关注
		"user.supportList":"project/order/v/user/supportList",//我的订单列表
		"user.cancel":"project/order/v/user/cancel",//取消订单
		"user.myInitProjectList":"project/operate/v/myInitProjectList",//我发起的项目
		"user.myAmount":"user/userManage/v/findAccCenter",//我的 账户中的金额
		"user.transRecords":"user/userManage/v/findAccMoney",//我的账户交易记录
		"user.findFreezePro":"user/userManage/v/findFreezePro",//冻结项目列表
		"user.authentication":"user/userManage/v/authentication",//实名认证
		"user.findAuthentication":"user/userManage/v/findAuthentication",//实名认证成功后信息
		"user.idCardUnique":"user/userManage/v/idCardUnique",//查询身份证是否唯一
		"user.updateUserBaseInfo":"user/perCenter/v/updateUserBaseInfo",//更改个人信息
		"user.updateTradePwd":"user/perCenter/v/updateTradePwd",//修改交易密码
		"user.checkTradePassword":"user/perCenter/v/checkTradePassword",//验证原交易密码
		"home.checkSettingTradePwd":"user/perCenter/v/checkSettingTradePwd",//查询是否设置交易密码
		"user.insertWithdraw":"finance/withdrawManage/v/insertWithdraw",//申请提现
		"user.thirdParty":"home/v/register",//第三方授权
		"user.prosupportList":"project/order/v/supportList",//项目支持订单记录
		"user.getPasswordCode":"user/userManage/v/getPasswordCode",//找回密码发送验证码
		"user.supportDetail":"finance/paymentManage/v/supportDetail",//发起项目订单支持详情
		"user.suggestion":"operation/feedback/v/suggestion",  //意见反馈
		"user.prodelete":"project/operate/v/delete",//项目删除
		"user.finish":"project/operate/v/finish",//提前结束
		"user.addDynamic":"project/operate/v/addDynamic",//更新项目动态
		"user.findThirdPartyList":"user/userManage/v/findThirdPartyList",//账户绑定的第三方账号列表
		"user.unbundling":"user/userManage/v/unbundling",//解绑第三方账号
		"user.addThirdUser":"user/userManage/v/addThirdUser",//绑定第三方账号
		"user.payOrder":"finance/paymentManage/v/payOrder",//支付订单
		"user.logout":"home/frontInfo/v/logout",//退出登录
		"user.post":"project/order/v/post",//发货
		"user.confirmReceipt":"project/order/v/user/confirmReceipt",//确认收货



		
		//start
		"project.initWelfareProject":"project/operate/v/initWelfareProject",//发起公益项目
		"project.modifyWelfareProject":"project/operate/v/modifyWelfareProject",//编辑公益项目
		"project.initReturnProject":"project/operate/v/initReturnProject",//发起回报项目
		"project.modifyReturnProject":"project/operate/v/modifyReturnProject",//编辑回报项目
		"project.initDreamProject":"project/operate/v/initDreamProject",//发起梦想项目
		"project.modifyDreamProject":"project/operate/v/modifyDreamProject",//编辑梦想项目
		"project.proAuthenticated":"project/operate/v/proAuthenticated",//项目验证
		"project.returnTargetList":"project/query/v/returnTargetList",//项目产品回报、梦想目标列表
		
		"project.findLabels":"operation/basicInfoSet/v/findLabels",//选择项目标签 1回报项目2梦想项目
		"project.findImgModel":"operation/basicInfoSet/v/findImgModel",//项目验证图片示例
		"project.findTextInstructList":"site/textInstruct/v/findTextInstructList",//文本说明列表查询
		"project.isProAuthenticated":"project/validate/v/isProAuthenticated",//项目验证状态
		"project.proAuthenticated":"project/validate/v/proAuthenticated",//项目验证
		"project.proAuthenticatedDetail":"project/validate/{v}/proAuthenticatedDetail",//查询项目验证信息
		"project.authenticatedRecord":"bus/auditingManage/v/authenticatedRecord",//查询某项目所有项目验证审核列表
		

		//trends
		//other

    };

    var toGet = function(Obj) {
        var result = "";
        for (var key in Obj) {
            result += key + "=" + Obj[key] + "&";
        }
        result += new Date().getTime();
        return result;
    }
    Config.url = function(name, datetype) {
    	if(name=="imgAddress"){
    		return domainLists['imgAddress'];
    	}else if(datetype&&datetype.toLowerCase()=='jsonp'){
    		var params = toGet();
	        if (urlConfig[name]) {
	            return domainLists['remote']+urlConfig[name]+ "?" + params;
	        }
    	}else{
    		return domainLists['localhost']+urlConfig[name];
    	}
        return "";
    };
    return Config.url;
});


//commonClass/stringTools.js
define('commonClass/stringTools', function() {
    var exports = {};


    function isNotEmpty(value) {
        if (value == undefined) {
            return false;
        }
        return !/^\s*$/.test(value);
    }


    exports.isNotEmpty = isNotEmpty;
    return exports;
});

//commonClass/dateTools.js
define("commonClass/dateTools", ['DMJSAll'], function(DMJS) {
    function formatTime(date) {
        if (typeof date == "string") {
            if (date.length == 8) {
                var arr = [date.substr(0, 4), date.substr(4, 2), date.substr(6, 2)];
            } else if (date.length == 14) {
                var arr = [date.substr(0, 4), date.substr(4, 2), date.substr(6, 2), date.substr(8, 2), date.substr(10, 2), date.substr(12, 2)];
            } else {
                var arr = date.split(/[^0-9]+/);
            }
            date = new Date(arr[0], arr[1] - 1, arr[2], arr[3] || 0, arr[4] || 0, arr[5] || 0);
        }
        return date;
    }
    //重写 四舍五入
    Number.prototype.toFixed = function(d)
	  {
	      var s=this+"";if(!d)d=0;
	      if(s.indexOf(".")==-1)s+=".";s+=new Array(d+1).join("0");
	      if (new RegExp("^(-|\\+)?(\\d+(\\.\\d{0,"+ (d+1) +"})?)\\d*$").test(s))
	      {
	          var s="0"+ RegExp.$2, pm=RegExp.$1, a=RegExp.$3.length, b=true;
	          if (a==d+2){a=s.match(/\d/g); if (parseInt(a[a.length-1])>4)
	          {
	              for(var i=a.length-2; i>=0; i--) {a[i] = parseInt(a[i])+1;
	              if(a[i]==10){a[i]=0; b=i!=1;} else break;}
	          }
	          s=a.join("").replace(new RegExp("(\\d+)(\\d{"+d+"})\\d$"),"$1.$2");
	      }if(b)s=s.substr(1);return (pm+s).replace(/\.$/, "");} return this+"";
	};
    
    /**
     * 比较2个时间的大小,
     * parm:
     *  t1 时间参数   形式为  这些方式  "2012.3.4 23:22:33" "2012.3.4" new Date()
     *  t2 时间参数   形式为  这些方式  "2012.3.4 23:22:33" "2012.3.4" new Date()
     *  return: 返回-1 0 1
     *    t1>t2 返回1 
     *    t1=t2 返回0
     * 	  t1<t2  返回-1 
     */
    DMJS.compareDate = function(t1, t2) {
        if (!t1 || !t2) {
            return "";
        }
        t1 = formatTime(t1);
        t2 = formatTime(t2);
        var result = t1.getTime() - t2.getTime();
        return result == 0
                ? 0
                : result > 0 ? 1 : -1
    };
     //转换金额
	DMJS.changeAmount=function(amount){ 
				if(!amount) return 0.00;
                var r= /^[1-9]?[0-9]*\.[0-9]*$/;
                amount=(amount+"").indexOf(",")!=-1 ? amount.replace(/,/g,"")  :amount  ;
                if(r.test(amount) && parseInt(amount) < amount){  
                	if(amount<10000)return amount;
                 	amount=(amount+"").split(".").length>=2 ? (amount+"").split(".")[0] : amount;
                }
                	if(parseInt(amount) >= 100000000){
                		 return (amount/100000000).toFixed(2) + "<span>亿</span>";
                	}
                    else if(parseInt(amount) >= 10000){
                        return (amount/10000).toFixed(2) + "<span>万</span>";
                    }else{
                        return (amount+"").split(".").length>=2 ? amount : (amount*1).toFixed(0);
                    }
           };

    /**
     * 时间推移的功能,
     * parm:
     *  t1 当前时间   形式为  这些方式  "2012.3.4 23:22:33" "2012.3.4" new Date()
     *  num 推移的次数    
     *  unit  单位   只能为("y"或者"m"或者"d")
     *  return: 返回推移后的时间对象
     */
    DMJS.diffDateAdd = function(t1, num, unit) {
        if (!t1 || num == undefined || !unit) {
            return "";
        }
        t1 = formatTime(t1);
        var unit = {
            y: 1000 * 60 * 60 * 24 * 365,
            m: 1000 * 60 * 60 * 24 * 30,
            d: 1000 * 60 * 60 * 24
        }[unit];
        return new Date(t1.getTime() + num * unit);
    };

    /**
     * 返回2个时间间隔的天数,
     * parm:
     *  t1 时间参数   形式为  这些方式  "2012.3.4 23:22:33" "2012.3.4" new Date()
     *  t2 时间参数   形式为  这些方式  "2012.3.4 23:22:33" "2012.3.4" new Date() 
     *  返回2个时间之前的天数
     */
    DMJS.diffDate = function(t1, t2) {
        if (!t1 || !t2) {
            return false;
        }
        t1 = formatTime(t1);
        t2 = formatTime(t2);
        return parseInt(Math.abs(t2.getTime() - t1.getTime()) / (1000 * 60 * 60 * 24));
    };

    /**
     * 获取系统时间,
     * parm:
     *  successFun  请求成功的回调函数
     *  format      需要返回的时间格式
     *  这个函数没有返回   处理要写到回调函数中....
     */
    DMJS.systemTime = function(successFun, format) {
        if (typeof successFun != "function")
            return;
        DMJS.Request("qryEbankSysTime", {
            cancelLightbox: true,
            success: function(time) {
                var time = parseInt(time.responseBody.sysTime);
                format
                        && (time = DMJS.formatDate(new Date(time), format));
                successFun(time);
            },
            error: function() {
                var t = new Date();
                format
                        ? successFun(DMJS.formatDate(t, format))
                        : successFun(t.getTime());
            }
        });
    };

    DMJS.formatDate = function(date, format) {
        if (!date || date == "0") {
            return "";
        }
        if (!format) {
            format = "yyyy-MM-dd hh:mm:ss";
        }
        if (typeof date == "string") {
            if (date.length == 8) {
                var arr = [date.substr(0, 4), date.substr(4, 2), date.substr(6, 2)];
            } else if (date.length == 14) {
                var arr = [date.substr(0, 4), date.substr(4, 2), date.substr(6, 2), date.substr(8, 2), date.substr(10, 2), date.substr(12, 2)];
            } else {
                var arr = date.split(/[^0-9]+/);
            }

            format = format.replace(/([a-z])\1+/ig, function(all, $1) {
                var result = {
                    y: ~~arr[0],
                    M: ~~arr[1],
                    d: ~~arr[2],
                    h: ~~arr[3],
                    m: ~~arr[4],
                    s: ~~arr[5]
                }[$1];
                if (result && result < 10) {
                    result = "0" + result
                }
                return result || "";
            });
            return format;
        }
        format = format.replace(/([a-z])\1+/ig, function(all) {
            var first = all.charAt(0);
            if ("y M d h m s".indexOf(first) >= 0) {
                if (first == "y") {
                    return all.length > 2
                            ? date.getFullYear()
                            : (date.getFullYear() + "").substr(2);
                }
                var result = {
                    M: date.getMonth() + 1,
                    d: date.getDate(),
                    h: date.getHours(),
                    m: date.getMinutes(),
                    s: date.getSeconds()
                }[first];
                result < 10
                        && (result = "0" + result);
                return result;
            } else {
                return all;
            }
        });
        return format;
    };
     DMJS.agreementEnable = function(type, eleId,successCall) {
        DMJS.Request("user.initType",
        	{
            data:{type:type},
            type: "get",
            dataType: "jsonp",
            cancelLightbox: true,
			"noCache":true,
			"success":function(response){
				if(!response.data.agreementName&&!response.data.agreementType)
				    $("#"+eleId).addClass("uhide");
				   typeof successCall=='function'&&successCall();
			},
			'error':function(response){console.log(response);}
        	});
        
    };
});
//request.js
define("commonClass/request", ['Lib/base64', 'DMJSAll',  'commonClass/commonTools', 'commonConfig/url'], function(Base64, DMJS,  x, url) {
    // 请求的唯一标识
    var uuid = 1;
    // 请求中的XHR队列
    var xhrs = {};
    var requestData = {};
    var limits = {};
    var base64 = new Base64(Config.base("trunKey"));
    var length;

    var ajaxSettings = $.ajaxSettings;

    var responseCache = {
        'user.myAccount': false
    }

    // 接口数据缓存对象
    DMJS.removeCache = function(key) {
        for (var _key in responseCache) {
            if (!key || key == _key) {
                responseCache[key] = false;
            }
        }
    }
    DMJS.killRequest = function(urlList) {
        // urlList 需要取消掉的url的地址     如果urlList为空 表示取消掉所有的请求
        if (urlList) {
            if (!$.isArray(urlList)) {
                urlList = [urlList];
            }
            $.each(urlList, function(i, url) {
                if (url in xhrs) {
                    xhrs[url].isAbort = "1";
                    xhrs[url].abort();
                    delete xhrs[url];
                }
            });
        } else {
            for (key in xhrs) {
                if (!xhrs[key].unBort) {
                    xhrs[key].isAbort = "1";
                    xhrs[key].abort();
                }
            }
            if (window.wrapView) {
                wrapView.lightBox.hide();
                if(wrapView.FlipPrompt){
                	wrapView.FlipPrompt.closeFlayer();
                }
                
            }
        }
        ajaxSettings.lightboxHide = true;
    };
    DMJS.getRequestLength = function() {
        return xhrs.length;
    }
    //去掉挡板的Element
    function removeElement(obj, o) {
        var my = arguments.callee;
        for (var key in obj) {
            var val = obj[key],
                    isObj = Object.prototype.toString.call(val) == "[object Object]";
            if (isObj) {
                if (val.Element) {
                    $.isArray(val.Element)
                            ? o[key] = val.Element
                            : o[key] = [val.Element]
                } else {
                    o[key] = {};
                    my(val, o[key]);
                }
            } else {
                o[key] = val;
            }
        }
    }

    //格式化 options
    function formatOptions(options) {
        var isJson = !Config.base("isPADock"),
                channelType = Config.base("channelType");
        options.urlKey = options.url;
        options.url = Config.url(options.url,options.dataType);

        //60秒后断开请求....
        options.timeout = options.timeout || 60000;
        // 响应后处理
        var complete = options.complete || function() {
        };
        // 成功回调函数
        var success = options.success || function() {
        };
        var error = options.error || function() {
        };
        var doRetry = options.doRetry || false;
        // 为当前请求生成唯一标识
        //options.xhrID = uuid++;
        !options.type
                && (options.type = "post");

        options.lightboxHide == false
                ? ajaxSettings.lightboxHide = false
                : ajaxSettings.lightboxHide = true;

        ajaxSettings.cancelLightbox = options.cancelLightbox;

        if (!options.dataType) {
            if (isJson) {
                options.dataType = 'json';
                options.data.responseDataType = "JSON";
            } else {
                options.dataType = 'text/xml';
            }
        }

        options.error = function(response, type) {
            //alert("请求error"+"type"+":"+response);
            $.ajaxSettings.complete();
            if (!response) {
                return;
            }
            if (response.isAbort) {
                return;
            }
            //如果ajax的请求是要求json格式而接口返回非json数据 也会进入error 类型是parsererror
            if (doRetry) {
                if (typeof doRetry == "object" && doRetry.before) {
                    doRetry.before();
                }
                var request = requestData[response.url];
                wrapView.FlipPrompt.confirm({
                    title: Config.lang("alertCommonTitle"),
                    content: "<span>网络连接超时,请检查您的网络设置或重试？</span>",
                    FBntconfirm: "稍后再试",
                    FBntcancel: "重试",
                    FBntCancelColor: "pop_btn_orange"
                }, function() {
                }, function() {
                    setTimeout(function() {
                        if (typeof doRetry == "function") {
                            doRetry(function() {
                                DMJS.Request(response.url, request);
                            });
                        } else if (typeof doRetry == "object" && doRetry.after) {
                            doRetry.after(function() {
                                DMJS.Request(response.url, request);
                            });
                        } else {
                            DMJS.Request(response.url, request);
                        }
                    }, 100);
                });
            } else {
                error(response);
                return;
            }
//			if(type == "parsererror"){
//				error(response);
//				return;
//			}
//			if(type == "error" && !response.result ){
//				error(response);
//				return;
//			}
            //如果是手动取消掉的   不需要弹框			
//			if(!response.isAbort){
//				if(!response.noerror){
//					if(!option.doRetry){
//						error(response);
//						return;
//					}
//					
//				}
//			}
        }

        options.complete = function(response) {
            // 移除队列
            delete requestData[options.urlKey];
            delete xhrs[options.urlKey];
            try {
                if (complete) {
                    complete(response);
                }
            } catch (e) {
                $.ajaxSettings.complete();
                if (wrapView && wrapView.FlipPrompt) {
                    wrapView.FlipPrompt.colse(true);
                }
            }
            $.ajaxSettings.complete();
        }
        var data = options.data;
        if (data && Config.base("requestEncrypt") && !data.sign) {
            var strData = JSON.stringify(data);
            console.log(strData);
            options.data = {
                "sign": base64.encode(strData)
            }
        }
    }

    /*
     * 串行发送请求
     */
    function processResquestSyn(lists, responseLists, errorList, callback, error) {
        //alert("调用process request")
        var my = arguments.callee,
                isJson = !Config.base("isPADock"),
                options = lists.shift();

        formatOptions(options);
        //alert("请求URL:"+options.url);
        options.error = function(response) {
            responseLists.push("error");
            //alert("请求error:"+error);
            errorList.push(true);
            var n = length - lists.length - 1;
            if (wrapView.headerView) {
                wrapView.headerView.enableEvent();
            }
            //如果还有其他请求  并且没有限制条件        	
            if (lists.length > 0 && !limits[n]) {
                my(lists, responseLists, errorList, callback, error);
            } else {
                length > 1
                        && callback.apply(null, responseLists);
                error.apply(null, errorList);
            }
        }

        var success = function(response) {
            //alert("请求成功");
            //如果是挡板 并且是 没有缓存数据		                        
            if (!isJson && !responseCache[options.urlKey]) {
                //result = $.xml2json(response);
                response = {};
                removeElement(result, response);
            }
            responseLists.push(response);
            errorList.push(undefined);


            if (lists.length > 0) {
                var n = length - lists.length - 1;
                if (!limits[n] || (limits[n] && limits[n](response))) {
                    my(lists, responseLists, errorList, callback, error);
                } else {
                    $.each(new Array(length - responseLists.length), function() {
                        responseLists.push("error");
                    });

                    try {
                        //当请求全部正确的时候
                        callback.apply(null, responseLists);
                    } catch (e) {
                        console.log("exception,error:" + e.message);
                        wrapView.FlipPrompt.alert({
                            title: Config.lang("alertCommonTitle"),
                            content: "网络异常，请稍后重试！"
                        }, function() {

                        });
                    }
                }
            } else {
                try {
                    callback.apply(this, responseLists);
                    errorList.join("") != ""
                            && error.apply(null, errorList);
                } catch (e) {
                    console.log("exception,error:" + e.message);
                    wrapView.FlipPrompt.alert({
                        title: Config.lang("alertCommonTitle"),
                        content: "网络异常，请稍后重试！"
                    }, function() {

                    });
                }
            }
        }

        //如果设置了缓存  并且存在缓存的数据  不从服务器拉数据.......
        if (!options.noCache && responseCache[options.urlKey]) {
            success(responseCache[options.urlKey]);
        } else {
            options.success = success;
            if (typeof options.beforeSendCallback == "function") {
                ajaxSettings.beforeSendCallback = function(xhr) {
                    options.beforeSendCallback(xhr)
                }
            }
            var xhr = $.ajax(options);
            xhr.url = options.urlKey;
            xhrs[options.urlKey] = xhr;

        }
    }

    /*
     同步发送请求
     */
    function processResquest(lists, responseLists, callback, error) {
        //alert("请求process request")
        var isJson = !Config.base("isPADock"),
                len = lists.length,
                errArr = new Array(len),
                arr = new Array(len);

        $.each(lists, function(i, options) {
            options.error = function(response) {
                //alert("请求error:");
                len--;
                arr[i] = "error";
                errArr[i] = true;
                if (wrapView.headerView) {
                    wrapView.headerView.enableEvent();
                }
                if (len == 0) {
                    error(response);
                }
            };
            formatOptions(options);
            //alert("请求url"+options.url);
            var success = function(response) {
                try {
                    if (responseCache[options.urlKey] != undefined) {
                        responseCache[options.urlKey] = response;
                    }
                    //当请求全部正确的时候
                    callback.apply(null, [response]);
                    //errArr.join("")!=""
                    //	&&error.apply(null,errArr); 						
                } catch (e) {
                    console.log("exception,error:" + e.message + "\r\n stack:" + e.stack);
                    wrapView.FlipPrompt.alert({
                        title: Config.lang("alertCommonTitle"),
                        content: "网络异常，请稍后重试！"
                    }, function() {
                    });
                }
            }
            //如果设置了缓存  并且存在缓存的数据  不从服务器拉数据.......
            if (!options.noCache && responseCache[options.urlKey]) {
                success(responseCache[options.urlKey]);
            } else {
                options.success = success;
                if (typeof options.beforeSendCallback == "function") {
                    ajaxSettings.beforeSendCallback = function(xhr) {
                        options.beforeSendCallback(xhr)
                    }
                }
                var xhr = $.ajax(options);
                xhr.url = options.urlKey;
                xhr.unBort = options.unBort;
                xhrs[options.urlKey] = xhr;
            }

        });
    }


    DMJS.Request = function(name, options) {
        try {
            limits = {};
            var success = $.isFunction(options.success) ? options.success : function() {
            },
                    error = $.isFunction(options.error) ? options.error : function() {
            };
            if ($.isArray(name)) {
                length = name.length;
                if (options.syn) {
                    $.each(name, function(i, d) {
                        requestData[d.url] = options;
                        if (typeof d.limit == "function")
                            limits[i] = d.limit;
                    });
                    //alert("流程1");
                    processResquestSyn(name, [], [], success, error);
                } else {
                    //alert("流程2");
                    processResquest(name, [], success, error);
                }
            } else {
                //alert("流程3")
                options.url = name || '';
                requestData[name] = options;
                processResquest([options], [], success, error);
                length = 1;
            }
        } catch (e) {
            //alert("请求error:"+e.message)
        }
    }
    return DMJS.Request;
});
//commonTools.js
define("commonClass/commonTools", ['commonConfig/base', 'zepto', 'underscore', 'commonClass/scroll/iscroll','commonData/code','commonTool/slide',"Lib/native/weixin",'commonClass/dateTools'],
        function(config, $, _, iscroll,responseCodes,Slide,wx) {

            DMJS.CommonTools = {
            	hash_clear:function(){
				           	window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
				            console.log("hash length: "+window.listHash.length);
				},
				transferCode:function(code){
					return responseCodes(code);
				},
                 tongLian:function(){
                var str="<div id='layer' style='height:100%;width: 100%; position: fixed;  top :0;background:rgba(0,0,0,.8)'>"
						+"<div class='hei-inherit  ub  ub-pc'><div class='img-rechargeTL' >"
						+"</div></div></div>";
				 var dom=$(str);
				 $(dom).click(function(){
				 	dom.toggle();
				 });
				 $('body').append(dom);
                },
                isStatus:function(type){
                	if(!isNaN(type)){
                		switch(parseInt(type)){
                		case  1:
                			return '待提交';
                			break;
                		case  2:
                			return '待审核';
                			break;
                		case  3:
                			return '审核不通过';
                			break;
                		case  4:
                			return '待发布';
                			break;
                		case  5:
                			return '预热中';
                			break;
                		case  6:
                			return '众筹中';
                			break;
                		case  7:
                			return '众筹失败';
                			break;
                		case  8:
                			return '众筹成功';
                			break;
                		case  9:
                			return '项目失败';
                			break;
                		case  10:
                			return '项目成功';
                			break;
                		default:
                			return '已作废'
                			
                		
                		}
                		
                	}else{
                		return "";
                	}
                	
                },
                isComplaintType:function(type){
                	if(!isNaN(type)){
                		switch(parseInt(type)){
                		case  1:
                			return '退款(退货)';
                			break;
                		case  2:
                			return '换货';
                			break;
                		case  3:
                			return '未收到货';
                			break;
                		case  4:
                			return '其它';
                			break;
                		
                		default:
                			return '没这个选项'
                			
                		
                		}
                		
                	}else{
                		return "";
                	}
                	
                },
                isOrderStatus:function(type){
                	if(!isNaN(type)){
                		switch(parseInt(type)){
                		case  1:
                			return '待支付';
                			break;
                		case  2:
                			return '交易关闭';
                			break;
                		case  3:
                			return '已支付';
                			break;
                		case  4:
                			return '待发货';
                			break;
                		case  5:
                			return '待收货';
                			break;
                		case  6:
                			return '投诉中';
                			break;
                		case  7:
                			return '已收货';
                			break;
                		case  8:
                			return '待退款';
                			break;
                		case  9:
                			return '已退款';
                			break;
                		case  10:
                			return '已删除';
                			break;
                		case  11:
                			return '支付失败';
                			break;
                		case  12:
                			return '待退款';
                			break;
                		case  13:
                			return '已终止';
                			break;
                		default:
                			return ''
                		}
                		
                	}else{
                		return "";
                	}
                	
                },
               handleStrLen:function(str,num){
            	return   str.replace(/<[^>]+>/g,"").replace(/\s/g,"").substring(0,num);
               },
               wxConfig:function(proid){//微信公众号分享设置
            	   DMJS.Request("common.getJsTicketInfo", {
                       type: "get",
                       dataType: "jsonp",
                       data: {url: location.href.split('#')[0]},
                       unBort: true,
                       cancelLightbox: true,
                       success: function(response) {
                    	   DMJS.Request("index.projectDetailsCon", {
                               type: "post",
                               dataType: "json",
                               data: {projectId:proid,},
                               unBort: true,
                               cancelLightbox: true,
                               success: function(response) {
                            	   var data = response.data.singleResult;
                            	   wx.ready(function () {
                               		var shareImg=Config.url('imgAddress')+data.coverImgUrl;//注意必须是绝对路径
                                      	var shareTitle=data.title;//分享title
                                      	var descContent=data.projectIntro;//分享给朋友或朋友圈时的文字简介
                                      	var shateUrl=window.location.origin + window.location.pathname + "#index/index/projectDetails/" + proid;//同样，必须是绝对路径
                                      	//分享功能只能在认证过的公众号上测试
                                          wx.onMenuShareTimeline({
                                       	   title: shareTitle, // 分享标题
                                              link: shateUrl,
                                              imgUrl: shareImg,
                                              success: function (res) {
                                              },
                                              cancel: function (res) {
                                              },
                                            });
                                           wx.onMenuShareAppMessage({
                                              title: shareTitle, // 分享标题
                              	            link: shateUrl, // 分享链接,将当前登录用户转为puid,以便于发展下线
                              	            desc: descContent, // 分享描述
                              	            imgUrl: shareImg, // 分享图标
                                              type: '', // 分享类型,music、video或link，不填默认为link
                                              dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                                              success: function () {
                                                  // 用户确认分享后执行的回调函数
                                              },
                                              cancel: function () {
                                                  // 用户取消分享后执行的回调函数
                                              }
                                           });
                                           wx.onMenuShareQQ({
                                          	    title: shareTitle, // 分享标题
                                          	    desc: descContent, // 分享描述
                                          	    link: shateUrl, // 分享链接
                                          	    imgUrl: shareImg, // 分享图标
                                          	    success: function () { 
                                          	       // 用户确认分享后执行的回调函数
                                          	    },
                                          	    cancel: function () { 
                                          	       // 用户取消分享后执行的回调函数
                                          	    }
                                          	});
                                           wx.onMenuShareWeibo({
                              		        	title: shareTitle, // 分享标题
                              		     	    desc: descContent, // 分享描述
                              		     	    link: shateUrl, // 分享链接
                              		     	    imgUrl: shareImg, // 分享图标
                              		     	    success: function () { 
                              		     	       // 用户确认分享后执行的回调函数
                              		     	    },
                                          	    cancel: function () { 
                                          	        // 用户取消分享后执行的回调函数
                                          	    }
                                          	});
//                                           wx.onMenuShareQZone({
//                              	            	title: shareTitle, // 分享标题
//                              	         	    desc: descContent, // 分享描述
//                              	         	    link: shateUrl, // 分享链接
//                              	         	    imgUrl: shareImg, // 分享图标
//                              	         	    success: function () { 
//                              	         	       // 用户确认分享后执行的回调函数
//                              	         	    },
//                                          	    cancel: function () { 
//                                          	        // 用户取消分享后执行的回调函数
//                                          	    }
//                                          	});
           	                   	    });
                            	   
                               }
                           });
                       }
                   });
            	   
               },
               isWeiXin:function (){
								var ua = window.navigator.userAgent.toLowerCase();
								if(ua.match(/MicroMessenger/i) == 'micromessenger'){
								        return true;
								    }else{
								        return false;
								    }
								},
                 fmoney:function(s , n){
               if(s > 0){
                    n = n > 0 && n <= 20 ? n : 2;  
                    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
                    var l = s.split(".")[0].split("").reverse(),  
                    r = s.split(".")[1];  
                    t = "";  
                    for(i = 0; i < l.length; i ++ )  
                    {  
                       t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
                    }  
                    return t.split("").reverse().join("") + "." + r;   
                }else if(s == 0){
                    return "0.00";
                }else{
                    return s;
                }
           },
                // js 遍历所有Cookie
                delCookies: function()
                {
                    var strCookie = document.cookie;
                    var arrCookie = strCookie.split("; "); // 将多cookie切割为多个名/值对
                    for (var i = 0; i < arrCookie.length; i++)
                    { // 遍历cookie数组，处理每个cookie对
                        var arr = arrCookie[i].split("=");
                        if (arr.length > 0)
                            DMJS.CommonTools.delCookie(arr[0]);
                    }
                },
                getCookieVal: function(offset)
                {
                    var endstr = document.cookie.indexOf(";", offset);
                    if (endstr == -1)
                        endstr = document.cookie.length;
                    return decodeURIComponent(document.cookie.substring(offset, endstr));
                },
                delCookie: function(name)
                {
                    var exp = new Date();
                    exp.setTime(exp.getTime() - 1);
                    var cval = DMJS.CommonTools.getCookie(name);
                    if(name=='userInfo'){
                    	cval=encodeURI(cval);
                    }
                    document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
                },
                
                imgDown:function($img){
                	var imgL=$img.length,self=this;
            	    
	          		  var timer = setInterval(function() {
	          			  var num=0;
	          			  for(var i=0;i<imgL;i++){
	          				  if ($($img[i]).height()!=0) {
	                           	 num++;
	                             }
	          				  
	          			  }
	          			  if(num==imgL){
	          				self.loadScroller();
	                           	
	                            clearInterval(timer);
	          			  }
	          			
	                    }, 100);
                },
                setImgUrl : function(e,fileFilter,toplimit,size,DelFuncName){//e 上传本身 fileFilter文件数组 size 图片大小限制 toplimit图片上限 DelImgfunc样式绑定事件
					var self = this,num = fileFilter.files.length,toplimit=toplimit||8,
					files = e.target.files || e.dataTransfer.files;//获取上传图片
					files = self.filter(files,size);
					var allowNum = toplimit - num;//允许上传图片数
					if(files.length > allowNum){
						files.splice(allowNum - files.length,files.length-allowNum);//自动移除后面多余图片
					}
					fileFilter.files = fileFilter.files.concat(files);//存储所选图片
					for(var i in files){
						objUrl = self.getObjectURL(files[i]);
						if (objUrl) {
							num++;
							console.log(num);
							//图片html
							var imgHtml = "<div class='LookImg upload-file upload-file-img mg-t-10 mg-r-5' style='float: left;background-image: url("+
							objUrl + ");'>";
							if(DelFuncName){
								imgHtml +="<div class='del-img' action='action:"+DelFuncName+"'></div>";
							}
							imgHtml +="</div>";
							if(num >= toplimit){//最多上传8张图
								$(e.target).parent().addClass("uhide");//隐藏上传文件
							}
//							$(e.target).val("");//防止上传同一图片不触发事件
			                $(e.target).parent().before(imgHtml) ;
			            }
						fileFilter.filesUrl.push(objUrl);
					}
					return fileFilter;
				},
				//建立一個可存取到該file的url
		        getObjectURL : function (file) {
		            var url = null ;
		            if (window.createObjectURL!=undefined) { // basic
		                url = window.createObjectURL(file) ;
		            } else if (window.URL!=undefined) { // mozilla(firefox)
		                url = window.URL.createObjectURL(file) ;
		            } else if (window.webkitURL!=undefined) { // webkit or chrome
		                url = window.webkitURL.createObjectURL(file) ;
		            }
		            return url ;
		        },
				filter:function(files,size){
					var arrFiles = [],notImg="",bigImg="",size=size||10485760;//默认10M
					for (var i = 0, file; file = files[i]; i++) {
						if (file.type.indexOf("image") == 0) {
							if (file.size >= size) {
								bigImg += file.name + " ";
							} else {
								arrFiles.push(file);
							}			
						} else {
							notImg += file.name + " ";
						}
					}
					if(notImg!=""){
						DMJS.CommonTools.popTip('文件"' + notImg + '"不是图片。');
					}
					if(bigImg!=""){
						DMJS.CommonTools.popTip('"'+ bigImg +'"过大');
					}
					return arrFiles;
				},
				lookBigPicture : function(presentUrl,allUrl){//查看大图
					var self = this,point = 0;
        			$("#bigImg").parent().removeClass("uhide");
					var urlHtml = "";
					for(var i=0 ;i< allUrl.length;i++){
						if(presentUrl.indexOf(allUrl[i]) != -1 &&allUrl[i] != Config.url("imgAddress")){
							point = parseInt(i);
						}
						urlHtml += "<div class='width100 look_bigimg tx-ac'><img style='max-width: "+ document.body.clientWidth +"px;max-height: "+ document.body.clientHeight +"px;' src='"+allUrl[i]+"' /></div>";
					}
					$("#bigImg").html(urlHtml);
					self.noticeSlider=new Slide("bigImg", "H", function(e){
	        				},false,function(e){
	        			},undefined,function(index){
	        			},point);
        			setTimeout(function(){
	        			$("#bigImg").parent().addClass("opacity1");
        			},500);
					$("#bigImg").parent()[0].addEventListener('click',self.CloseImg,false);
				},
				CloseImg:function(e){
		        	$("#bigImg").parent().addClass("uhide");
		        	$("#bigImg").parent().removeClass("opacity1");
		        },
                delImg :function(e,fileFilter){//多图上传删除图
		        	var dom = e.target||e;
		        	var i = $(dom).parent().index();//获取当前图的序号
		        	fileFilter.files.splice(i,1);//移除图片
		        	fileFilter.filesUrl.splice(i,1);//移除图片地址
		        	if(fileFilter.files.length < 1){
		        		$(dom).parent().parent().find("input").val("")
		        	}
		        	$(dom).parent().remove();//移除整个图
		        	return i;
		        	
		        },
		        replaceCoBack:function(routeUrl){//替换掉浏览器返回地址的地址，防止ios设备微信自带回退按钮回退登录界面
		        	var proUrl = window.location.origin + window.location.pathname + "#";
					window.history.replaceState(null,null,proUrl + routeUrl);
		        },
                getCookie: function(name)
                {
                    var arg = name + "=";
                    var alen = arg.length;
                    var clen = document.cookie.length;
                    var i = 0;
                    while (i < clen)
                    {
                        var j = i + alen;
                        if (document.cookie.substring(i, j) == arg)
                            return DMJS.CommonTools.getCookieVal(j);
                        i = document.cookie.indexOf(" ", i) + 1;
                        if (i == 0)
                            break;
                    }
                    return null;
                },
                /**
                 * 登入区外加签时间［@"yyyyMMddhhmmss"］
                 */
                getSignTime: function() {
                    var curTime = DMJS.CommonTools.getSystemTime("yyyyMMddhhmmss");
                    return curTime;
                },
                removeMoneyNumberComma: function(moneyNum) {
                    moneyNum = (moneyNum + '').replace(/,/g, "");
                    moneyNum = isNaN((1 * moneyNum).toFixed(2)) ? (new Number(0).toFixed(2)) : (1 * moneyNum).toFixed(2);
                    return (moneyNum + '').replace(/\.00/g, '');

                },
                /**
                 * 保持session临时解决方案
                 */
                keepSessionAlive: function() {
                    var timerId = setInterval(function() {
//                        DMJS.Request("sys.keepSession", {
//                            type: "jsonp",
//                            cancelLightbox: true,
//                            success: function(response) {
//                                alert("response")
//                            },
//                            error: function(response) {
//                            }
//                        });
                    }, 600 * 1000);
                },
                /**
                 * 登入区外加签［@"channelType#yyyyMMddhhmmss"］
                 */
                getSignData: function() {
                    var channelType = Config.base("channelType");
                    var curTime = DMJS.CommonTools.getSignTime();
                    var sign = channelType + "#" + curTime;
                    var result = DMJS.CommonTools.desEncode(sign);
                    return result;
                },
                /**
                 *
                 * [根据手机网银规范格式化金额数字]
                 * moneyNum:格式化前的金额数字或金额数字字符串
                 * ruturn:格式化后的金额数字
                 *
                 * 规则：
                 * 1.金额数字小数后小于两位，补零到小数位两位
                 * 2.金额数字小数后两位，不处理
                 * 3.金额数字小数大于两位，四舍五入至小数位两位
                 *
                 * 注意：
                 * 1.这里利用了JS的类型转换特性，永远不会报错
                 * 2.isNaN==true默认给值0.00
                 */
                formatMoneyNumber: function(moneyNum) {
                    var result = isNaN((1 * moneyNum).toFixed(2)) ? (new Number(0).toFixed(2)) : (1 * moneyNum).toFixed(2);
                    return /\./.test(result) ? result.replace(/(\d{1,3})(?=(\d{3})+\.)/g, "$1,") : result.replace(/(\d{1,3})(?=(\d{3})+\b)/g, "$1,");
                },
                getTextForPwdKeyboard: function(inputField) {

                    var resultText = "";
                    if (inputField.hasClass == null) {
                        return inputField.val();
                    }
                    //android对进行掩码了的数据，得采用另外的形式进行获取
                    if (inputField.hasClass("keyboard_bank_pwd") ||
                            inputField.hasClass("keyboard_login_pwd") ||
                            inputField.hasClass("keyboard_acc_num") ||
                            inputField.hasClass("keyboard_otp")) {
                        //取款密码得采用这种方式获取  否则获取的是********
                        resultText = inputField.attr("paText");
                    } else {
                        resultText = inputField.val();
                    }
                    return resultText;
                },
                setTextForPwdKeyboard: function(inputField, changeText) {
                    if (inputField.hasClass == null) {
                        return inputField.val(text);
                    }
                    //android对进行掩码了的数据，得采用另外的形式进行获取
                    if (inputField.hasClass("keyboard_bank_pwd") ||
                            inputField.hasClass("keyboard_login_pwd") ||
                            inputField.hasClass("keyboard_acc_num") ||
                            inputField.hasClass("keyboard_otp")) {
                        //取款密码得采用这种方式获取  否则获取的是********
                        inputField.attr("paText", changeText);
                        var isNeedHide = false;
                        if (inputField.hasClass("keyboard_otp")) {
                            isNeedHide = false;
                        }
                        else if (inputField.hasClass("keyboard_login_pwd")) {
                            isNeedHide = true;
                        }
                        else if (inputField.hasClass("keyboard_bank_pwd")) {
                            isNeedHide = true;
                        }
                        else if (inputField.hasClass("keyboard_acc_num")) {
                            isNeedHide = false;
                        }

                        var showValue = "";
                        //如果需要掩码
                        if (isNeedHide) {
                            for (var i = 0; i < changeText.length; i++) {
                                showValue = showValue + "*";
                            }
                        } else {
                            showValue = changeText;
                        }
                        //如果内容为空
                        if (showValue.length <= 0) {
                            var placeholder = inputField.attr("placeholder");
                            //如果不需要处理placeholder
                            if (placeholder == null || placeholder.length <= 0) {
                                //删除文字置灰色  placeholder属性
                                inputField.removeClass("f_c_grey");
                                inputField.val("");
                            }
                            //如果需要处理placeholder
                            else {
                                //删除文字置灰色  placeholder属性
                                inputField.removeClass("f_c_grey");
                                //添加文字置灰色 placeholder属性
                                inputField.addClass("f_c_grey");
                                inputField.val(placeholder);
                            }
                        } else {
                            //删除文字置灰色  placeholder属性
                            inputField.removeClass("f_c_grey");
                            inputField.val(showValue);
                        }
                    } else {
                        inputField.val(changeText);
                    }
                },
                /**
                 *  @author EX-LUOCHUN001  2013.03.28
                 *  一个简单的枚举类,主要和 getDataByKey方法配合使用
                 */
                DateType: {
                    //枚举对象
                    OBJECT: "object",
                    //枚举字符
                    STRING: "String",
                    //枚举数组
                    ARRAY: "Array",
                    /**
                     *  @author EX-LUOCHUN001  2013.03.28
                     *  如果找不到相应数据,则根据dataType给出一个默认值
                     *  parm:
                     *      @param {String} dataType 想要获取的数据类型,与DMJS.CommonTools.DateType枚举相对应起来
                     *  return: 默认值
                     */
                    getDefaultValue: function(dataType) {
                        if (dataType === DMJS.CommonTools.DateType.OBJECT) {
                            return null;
                        } else if (dataType === DMJS.CommonTools.DateType.STRING) {
                            return "";
                        } else if (dataType === DMJS.CommonTools.DateType.ARRAY) {
                            var emptyArray = [];
                            return emptyArray;
                        } else {
                            return null;
                        }
                    },
                    /**
                     *  @author EX-LUOCHUN001  2013.03.28
                     *  想要获取的数据类型是否是能处理的数据类型
                     *  parm:
                     *      @param {String} dataType 数据类型,与DMJS.CommonTools.DateType枚举相对应起来
                     *  return: 对应数据类型默认值
                     */
                    isContainType: function(dataType) {
                        if (dataType === DMJS.CommonTools.DateType.OBJECT || dataType === DMJS.CommonTools.DateType.STRING || dataType === DMJS.CommonTools.DateType.ARRAY) {
                            return true;
                        }
                        return false;
                    }
                },
              
                /**
                 *获取剪贴板数据方法
                 */
					getClipboardText:function (event){
						var clipboardData = event.clipboardData || window.clipboardData;
						return clipboardData.getData("text");
					},
					
					
					
					/**
	                 *设置剪贴板数据
	                 */
					setClipboardText:function (event, value){
						if(event.clipboardData){
							return event.clipboardData.setData("text/plain", value);
						}else if(window.clipboardData){
							return window.clipboardData.setData("text", value);
						}
					},
                
                /**
                 *获取光标的位置 
                 */
				getPositionForInput: function(ctrl) {
                    var CaretPos = 0;
                    if (document.selection) {// IE Support
                        ctrl.focus();
                        var Sel = document.selection.createRange();
                        Sel.moveStart('character', -ctrl.value.length);
                        CaretPos = Sel.text.length;
                    } else if (ctrl.selectionStart || ctrl.selectionStart == '0') {// Firefox support
                        CaretPos = ctrl.selectionStart;
                    }
                    return (CaretPos);
                },
                showLightBoxAlert: function() {
                    wrapView.lightBox.show(true);
                },
                showLightBoxAlert1: function() {
                    wrapView.lightBox.show(false);
                },
                hideLightBoxAlert: function() {
                    setTimeout(function() {
                        wrapView.lightBox.hide();
                        wrapView.FlipPrompt.closeFlayer();
                    }, 500);
                },
                alertCommon: function($title, $content, func, $btnName) {
                    $("input,select").each(function() {
                        $(this)[0].blur();
                    });
                    DMJS.CommonTools.showLightBoxAlert1();
                    wrapView.FlipPrompt.alert(
                            {title: $title, content: $content, displaySure: func ? "yes" : 'no',btnName: $btnName},
                    function() {
                            	
                        DMJS.CommonTools.hideLightBoxAlert();
                        if (func) {
                            func();
                        }
                    }
                    );
                },
                shareToFriend: function() { //分享组件
                	DMJS.CommonTools.showLightBoxAlert1();
                    wrapView.FlipPrompt.shareToFriend(
                    		function() {
                                DMJS.CommonTools.hideLightBoxAlert();
                            }
                   );
                },
                popTip: function(tip, count) {
                    wrapView.FlipPrompt.tip(tip, false);
                    setTimeout(function() {
                        wrapView.FlipPrompt.colse(true);
                    }, count || 800);
                },
                showBrowser: function(option) {
                    require(['commonView/BrowserView'], function(BrowserView) {
                        var propView = new BrowserView(option);
                        return propView.render();
                    });
                },
                showOptionMenu: function(option) {
                    require(['commonView/OptionMenuView'], function(optionMenuView) {
                        var optionMenuView = new optionMenuView();
                        return optionMenuView.render();
                    });
                },
                autoClearLoadMoreDom: function(pageBean, loadMoreObject) {
                    if (!pageBean) {
                        return;
                    }
                    if (pageBean.totalResults == 0
                            || pageBean.currentPage == pageBean.totalPageSize) {
                        loadMoreObject.hide();
                    }
                },
                dealWithNoData: function(pageBean, lastItemDom) {
                    if (pageBean.totalResults == 0) {
                        lastItemDom.before("<div id='noDataTips'>暂无此数据！</div>");
                    }
                },
                clearFooter: function() {
                    if ($("footer")[0]) {
                        $("footer").remove();
                        wrapView.footerView = null;
                    }
                },
                clearHeader: function() {
                    if ($("header")[0]) {
                        $("header").remove();
                        wrapView.headerView = null;
                    }
                },
                /**
                 *函数说明：日期控件通用函数
                 *参数说明：
                 *       id:     控件ID
                 *       params: 传给日期控件的参数(其中的type: 控件格式(month-显示年月, date-显示年月日, datetime-显示年月日时分, time-显示时分))
                 *       pattern:样式
                 *               (theme: 外观,有android,ios,wp等外观,可传参数--android, android-ics light, android-ics, ios,
                 *                       jqm, sense-ui, wp light, wp, 默认是sense-ui；
                 *                mode:  滚动样式: scroller-滚动; clickpick-单击加减; mixed-滚动单击加减混合;
                 *                display:显示位置： modal-模态弹出, inline-内嵌到页面, bubble-箭头注释的形式, top-顶部弹出, bottom-底部弹出;
                 *                lang:  语言，默认是英语en-US，zh为中文)
                 */
                commonDateSelect: function(DateParam, callback) {

                    var id = DateParam.id;
                    var params = DateParam.type;
                    var maxYear = DateParam.maxDate;
                    var minYear = DateParam.minDate;
                    //设置日期控件显示顺序 年-月-日
                    if ('undefined' == typeof params.dateOrder) {
                        params.dateOrder = 'yymmdd';
                    }
                    //设置返回的日期格式
                    if ('undefined' == typeof params.dateFormat) {
                        if ('month' == params.preset) {
                            params.dateFormat = 'yy-mm';
                        }
                        else if ('date' == params.preset) {
                            params.dateFormat = 'yy-mm-dd';
                        }
                        else if ('datetime' == params.preset) {
                            params.dateFormat = 'yy-mm-dd';
                        } else if ('year' == params.preset) {
                            params.dateFormat = 'yy';
                        }
                    }
                    //设置控件显示样式
                    var pattern = {
                        theme: 'android-ics light',
                        mode: 'scroller',
                        display: 'modal',
                        lang: 'zh',
                        setText: '确定',
                        cancelText: '取消',
                        maxDate: maxYear,
                        minDate: minYear
                    };
                    if (callback != undefined && typeof callback == 'function') {
                        params.callback = callback;
                    }
                    //弹出控件
                    jQuery('#' + id).val('')
                            .scroller('destroy')
                            .scroller(
                                    jQuery.extend(
                                            params,
                                            pattern
                                            )
                                    );
                },
                /**
                 * textareaId  显示出来的textarea文本输入域的id 
                 * divID 需要模拟的元素标签的高度
                 * maxHeight 允许改变高度的最大高度
                 * minHeight 最小高度（就是textarea本身的高度）
                 */
                autoHeight: function(textareaId, divID, maxHeight, minHeight) {
                    if (!typeof textareaId == 'string' && !typeof divID == 'string' && !typeof maxHeight == 'number' && !typeof minHeight == 'number') {
                        console.log('textarea自适应高度传入参数不对');
                        return;
                    }
                    if (maxHeight < minHeight) {
                        var min_height = maxHeight;
                        maxHeight = minHeight;
                        minHeight = min_height;
                    }
                    var textarea = document.getElementById(textareaId);
                    var cloneTextarea = document.getElementById(divID);
                    cloneTextarea.innerHTML = textarea.value;
                    cloneTextarea.style.height = 'initial';
                    var height = cloneTextarea.offsetHeight;
                    if (height > minHeight && height < maxHeight) {
                        textarea.style.height = cloneTextarea.offsetHeight + 'px';
                    } else if (height <= minHeight) {
                        textarea.style.height = minHeight + 'px';
                    }
                    if (height >= maxHeight) {
                        cloneTextarea.style.overflow = 'hidden';
                        textarea.style.height = maxHeight + 'px';
                        cloneTextarea.style.height = maxHeight + 'px';
                        return;
                    }
                },
                /**
                 * 显示级联菜单
                 */
                showCascadeList: function(listParam) {

                    var id = listParam.id;
                    var parentText = listParam.parentText;
                    var childrenText = listParam.childrenText;

                    var listHtml = "";

                    for (var i = 0; i < childrenText.length; i++) {
                        listHtml += "<li>" + parentText[i] + "<ul>";
                        for (var j = 0; j < childrenText[i].length; j++) {
                            listHtml += "<li>" + childrenText[i][j] + "</li>";
                        }
                        listHtml += "</ul></li>";
                    }
                    jQuery("#" + id).html(listHtml);

                    var opt = {
                        tree_list: {preset: 'list'}
                    }
                    jQuery('#' + id).val('').scroller('destroy').scroller(jQuery.extend(opt['tree_list'], {
                        theme: 'android-ics light',
                        mode: 'scroller',
                        display: 'modal',
                        lang: 'zh',
                        setText: '确定',
                        cancelText: '取消'
                    }));
                },
                /**
                 * 显示多选框控件 
                 */
                commonCheckBox: function(self, $flag) {
                    var thisView = $("#" + self.id);
                    var flag = $flag;
                    var checkBoxHtml = "";
                    checkBoxHtml += "<div id='" + flag + "_showInfo' class='checkbox_accreditNotice' style='display:none' >";
                    checkBoxHtml += "<div class='checkbox_innerContent' style='position: relative;'>";
                    checkBoxHtml += "<div class='checkbox_dwv'>请选择</div>";
                    checkBoxHtml += "<div id='" + flag + "_selectWarpper'>";
                    checkBoxHtml += "<div id='" + flag + "_showIns' class='checkbox_showIns' >";
                    checkBoxHtml += "</div></div><div class='checkbox_dwbc'>";
                    checkBoxHtml += "<div class='checkbox_btn'  id='" + flag + "_sureBtn'>确定</div>";
                    checkBoxHtml += "<div class='checkbox_btn checkbox_right'  id='" + flag + "_cancelBtn'>取消</div>";
                    checkBoxHtml += "</div></div></div>";
                    thisView.after(checkBoxHtml);
                    var itemValue = self.itemValue;
                    var displayValue = self.displayValue;
                    var liHTML = "";
                    for (var i = 0; i < itemValue.length; i++) {
                        liHTML += "<li><input type='checkbox' value=" + itemValue[i] + " displayValue=" + displayValue[i] + " name='" + flag + "_checkInput' /><span>" + displayValue[i] + "</span></li>"
                    }
                    jQuery("#" + flag + "_showIns").append(liHTML);

                    jQuery(':checkbox').iCheck({
                        checkboxClass: 'icheckbox_square-orange',
                        increaseArea: '20%'
                    });
                    jQuery("#" + flag + "_showIns li").bind("tap", function() {
                        jQuery(this).find(".iCheck-helper").click();
                    });
                },
                /*弹出多选框*/
                showCheckBox: function($flag, checkBoxID) {
                    var flag = $flag;
                    var showInfo = jQuery("#" + flag + "_showInfo");
                    showInfo.show();
                    showInfo.height(screen.height);
                    //绑定点击确定的事件
                    jQuery("#" + flag + "_sureBtn").bind("tap", function() {
                        var s = '';
                        jQuery("input[name='" + flag + "_checkInput']:checked").each(function() {
                            s += jQuery(this).attr('displayValue') + ',';
                        });
                        jQuery("#" + flag + "_showInfo").hide();
                        s = s.substr(0, s.length - 1);
                        jQuery("#" + checkBoxID).val(s);
                    });
                    //绑定点击取消的事件
                    jQuery("#" + flag + "_cancelBtn").bind("tap", function() {
                        jQuery("#" + flag + "_showInfo").hide();
                    });
                    this.loadScroll2(flag);
                },
                /*多选框滚动条*/
                loadScroll2: function(flag) {
                    var wraper = $("#" + flag + "_selectWarpper");
                    wraper.height(155);
                    if (!this.checkBoxScroller) {
                        this.checkBoxScroller = new iscroll(wraper[0], {
                            hideScrollbar: true
                        });
                    }
                    $("#scrollBar").css("top", "37px");
                    $("#scrollBar").css("bottom", "40px");
                    this.checkBoxScroller.refresh();
                },
                /**
                 * 日期格式的处理:位数补齐
                 * @param strDate
                 */
                dealDate: function(strDate) {
                    var strDateSplit = strDate.split("-");
                    var strDateYear = strDateSplit[0], strDateMonth = strDateSplit[1], strDateyDay = strDateSplit[2];
                    if ((strDateMonth.length == 1) || (strDateyDay.length == 1)) {
                        if (strDateMonth.length == 1) {
                            strDateMonth = "0" + strDateMonth;
                        }
                        if (strDateyDay.length == 1) {
                            strDateyDay = "0" + strDateyDay;
                        }
                        var strDate2 = strDateYear + '-' + strDateMonth + '-' + strDateyDay;
                        return strDate2;
                    } else {
                        return strDate;
                    }
                },
                /**
                 * 计算两个日期的差
                 */
                 DateDiff:function (sDate1,sDate2,fg){    //sDate1和sDate2是日期;fg是分隔符
				       var  aDate,  oDate1,  oDate2,  iDays  
				       aDate  =  sDate1.split(fg);
				       oDate1  =  new  Date(aDate[1]  +  fg  +  aDate[2]  +  fg  +  aDate[0]) //转换为12-18-2006格式  
				       aDate  =  sDate2.split("-")  
				       oDate2  =  new  Date(aDate[1]  +  fg  +  aDate[2]  +  fg  +  aDate[0])  
				       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24) //把相差的毫秒数转换为天数  
				       return  iDays  
				   } ,
                /**
                 * 根据生日计算年龄
                 */
                operAge: function(birth, nowdate) {
                    var age;
                    var nowDateFormat = nowdate.replace(/-/g, "");
                    var birthFormat = birth.replace(/-/g, "");
                    var years = parseInt(nowDateFormat.substr(0, 4), 10);
                    var month = parseInt(nowDateFormat.substr(4, 2), 10);
                    var days = parseInt(nowDateFormat.substr(6, 2), 10);
                    var birthYear = parseInt(birthFormat.substr(0, 4), 10);
                    var birthMoth = parseInt(birthFormat.substr(4, 2), 10);
                    var birthDate = parseInt(birthFormat.substr(6, 2), 10);
                    if (month - birthMoth < 0) {
                        age = years - birthYear - 1;
                    } else if (month - birthMoth > 0) {
                        age = years - birthYear;
                    } else {
                        if (days - birthDate - 1 >= 0) {
                            age = years - birthYear;
                        } else {
                            age = years - birthYear - 1;
                        }
                    }
                    if (age < 0) {
                        age = 0;
                    }
                    return age;
                },
                formatAddZero: function(i) {
                    if (i < 10)
                        return "0" + i;
                    else
                        return i;
                },
                renderStringLen: function(str, length) {
                    length = length ? length : 10;
                    if (str && str.length > length) {
                        return str.substring(0, length) + "...";
                    }
                    return str;
                },
                /**
                 * 显示下拉列表
                 */
                showList: function(selectParam, callback) {
                    var inputId = selectParam.inputID;
                    var id = selectParam.id;
                    var optionVals = selectParam.optionVals;
                    var optionText = selectParam.optionText;
                    var params = {};
                    var selectHtml = "";
                    for (var i = 0; i < optionVals.length; i++) {
                        selectHtml += "<option value=" + "'" + optionVals[i] + "'" + ">" + optionText[i] + "</option>";
                    }
                    jQuery("#" + id).html(selectHtml);

                    params = {preset: 'select'};
                    if (callback != undefined && typeof callback == 'function') {
                        params.callback = callback;
                    }
                    if (inputId != undefined) {
                        params.inputID = inputId;
                    }
                    var pattern = {
                        theme: 'android-ics light',
                        mode: 'scroller',
                        display: 'modal',
                        lang: 'zh',
                        setText: '确定',
                        cancelText: '取消'
                    };
                    jQuery('#' + id).val('').scroller('destroy').scroller(jQuery.extend(params, pattern));
                },
                toggleLoadingInPage: function(view, isShow) {
                    require(["text!commonTemplate/inPageLoading.html"], function(inPageLoading) {
                        if (view.$el.find("div.inPageLoading").length > 0) {
                            !isShow && view.$el.find("div.inPageLoading").remove();
                        } else {
                            isShow && view.$el.append(inPageLoading);
                        }
                    });
                },
              	
                getMarginTop:function(view,content,pageInfo,menuHeight){
                	var windowHeight= (window.innerHeight > 0) ? window.innerHeight : screen.height; 
        			var contentHeight=view.$el.find("#"+content).height();
        			
        			var bottomH=view.$el.find("#bottom").height();  
        			var headerHeight=$("#header").height();
        			var top=0;
        			if(pageInfo!=undefined){
        				var $dom=view.$el.find("div[items='"+pageInfo.id+"']");
        				var pullHeight=$dom.find("#pullUpLoadMore").height();
        			    var listH=$dom.find(".ListArea").height();
        			        bottomH=$dom.find("#bottom").height();
        			      if(menuHeight!=undefined){  //有menu的上拉下拉刷新滚动页面
        				
                           if($dom.find("#noData").length!=0){
                        	  var noDataH=$dom.find("#noData").height();
                        	 
                        	  top=contentHeight-noDataH-bottomH-menuHeight;
                        	  
                           }else{                     

                        	   top=contentHeight-listH-menuHeight+7.5;
                           }
                          
        				}else{                        //无menu的上拉下拉刷新滚动页面
        					if($dom.find("#noData").length!=0){
                          	    var noDataH=$dom.find("#noData").height();
                          	 
                          	    top=contentHeight-noDataH-bottomH;
                          	  
                             }else{                     

                            	 top=contentHeight-listH+13.5;
                             }
        					
        					
        				}
        				if(top>0){
                           return top;
                        }else{
                       	   return 0;
                        }
        			}
        			if(pullHeight==undefined){         //无刷新的滚动页面
	        			if(headerHeight+contentHeight<windowHeight){  
	        				top=windowHeight-headerHeight-contentHeight;
	        				return top;
	        			}else{
	        				return 0;
	        			}
        			}
               },
            hash_clear:function(){
           			window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
            		console.log("hash length: "+window.listHash.length);
           }
            }
            return DMJS.CommonTools;
        });
//commonClass/ActionFilter.js
//单例过滤链，注意逻辑BUG
define("commonClass/ActionFilter", [], function() {
    var link = {};
    var filters = {};
    var doFilter = function(viewId, mothodName, func, params) {
        if (this != window) {
            _.extend(this, viewId);
            this.extend();
            return this;
        }
        if (link[viewId + "." + mothodName] || link[viewId + ".*"]) {
            var triggerObj = new Array().concat(link[viewId + "." + mothodName] || [], link[viewId + ".*"] || []);
            for (var i = 0; i < triggerObj.length; i++) {
                var filterName = triggerObj[i];
                var nextFilterName = triggerObj[i + 1];
                if (nextFilterName) {
                    filters[filterName]._doNext = _.bind(filters[nextFilterName]._func, filters[nextFilterName]);
                } else {
                    filters[filterName]._doNext = func;
                }
            }
            filters[triggerObj[0]]._func(viewId, mothodName, params);
        } else {
            func();
        }
    }
    doFilter.prototype.extend = function() {
        console.log("load filter");
        if (!filters[this.id]) {
            for (var i = 0; i < this.triggers.length; i++) {
                !link[this.triggers[i]] && (link[this.triggers[i]] = []);
                link[this.triggers[i]].push(this.id);
            }
            filters[this.id] = this;
            console.log("load filter:" + this.id + " success");
        } else {
            console.log("filter:" + this.id + " loaded");
        }
    }
    doFilter.prototype.doNext = function(viewId, methodName) {

        this._doNext(this.lastViewId, this.lastMethodName, this.args);
    }
    doFilter.prototype._func = function(viewId, methodName, params) {
        this.lastViewId = viewId;
        this.lastMethodName = methodName;
        if (params && params.length > 0) {
            this.args = params;
        }
        this.func(viewId, methodName);
    }
    require.config({
        paths: {
            filters: 'app/modules/filter'
        }
    });
    return doFilter;
});


//filters/userFilter.js
define("filters/userFilter", ['commonClass/ActionFilter'], function(ActionFilter) {
    return new ActionFilter({
        "id": "userStatusFilter",
        "triggers": ['cardManage.goRegisterThird','userContent.recharge','userContent.withdraw'],
        'func': function(_viewId, _methodName) {
            var self = this;
            if (!DMJS.userInfo) {
                DMJS.router.navigate("user/personal/login", true);
                return;
            }
            DMJS.currentView.controller.userModel.userInfoForApp({"noCache": true,"data": {'id':DMJS.userInfo.userId}, cancelLightbox: true,
                "success": function(response) { 
                	    var userDate=response.data.singleResult;
                	 	self.tgFunc(userDate,_viewId, _methodName);
                	
                },
                 'error':function(response){DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response&&response.description);}});
        },
        tgFunc: function(accountInfo,_viewId, _methodName) {
        	var self=this;
        	if(self.safeInfo(accountInfo)){
        		//判断是否第三方注册
        		if(DMJS.userInfo.userType=='1'&&accountInfo.safeStatus=='1'){//个人
        			
        			self.doNext();
        		}else{
        			wrapView.FlipPrompt.confirm({
			   	   				title:"温馨提示",
			   	   				content:"您尚未注册第三方，请先注册！",
			   	   				FBntconfirm:"取消",
			   	   				FBntcancel:"注册",
			   	   				FBntCancelColor:"pop_btn_orange"
			   	       			},function(){},function(){
			   	       			
			   	       			DMJS.currentView.controller.userModel.thirdPartyUrl({
				   	    			 "data":{userId:DMJS.userInfo.userId,userType:DMJS.userInfo.userTypeuserId},
				   	                 "success":function(response){
				   	    		            	if(response.data){//跳转第三方注册
				   	    		            		$("#thirdForm").html(response.data);
				   	    		     	 		}
				   	    					}
				   	                });
			   	       			
			   	       		   });
        		}
        	}
        },
        
        unTgFunc: function(accountInfo,flag) {
        	var self=this;
        	if(self.safeInfo(accountInfo,flag)){
        		self.doNext();
        	}
        },
       
        safeInfo:function(accountInfo){
			var tipContent="您必须先进行";
			var returnFlag=true;
			if(accountInfo.phoneStatus!='1'){returnFlag=false;  tipContent+="手机认证、"};
			if(accountInfo.userStatus!='1'){returnFlag=false;  tipContent+="实名认证、"};
			//if(accountInfo.emailStatus!='1'){returnFlag=false;   tipContent+="邮箱认证、"};
			//if(!accountInfo.tg&&!accountInfo.withdrawPsw){returnFlag = false;tipContent += "交易密码设置、"; }
			if(!returnFlag){
				tipContent=tipContent.substring(0,tipContent.length-1);
    			tipContent+="!";
				wrapView.FlipPrompt.confirm({
	   				title:Config.lang("alertCommonTitle"),
	   				content:tipContent,
	   				FBntconfirm:"取消",
	   				FBntcancel:"设置",
	   				FBntCancelColor:"pop_btn_orange"
	       			},function(){},function(){if(!returnFlag){DMJS.router.navigate("user/personal/safetyCertificate",true);}});
			}
            return returnFlag;
       }
     
      
    });

});


//filters/sessionFilter.js
//部分view不允许非登录访问       	
define("filters/sessionFilter", ['commonClass/ActionFilter'], function(ActionFilter) {
    return new ActionFilter({
        "id": "sessionFilter",
        "triggers": ['router.navigate'],
        'func': function(_viewId, _methodName) {
            var goHash = this.args[0];
            console.info("navigate:info:" + goHash);
            var nowHash = window.location.hash.substring(1);
	        if(nowHash == "user/personal/registerInfo" && goHash == ""){   
	          	return DMJS.router.navigate("user/personal/login", true);
	        }
	        if (goHash && !DMJS.userInfo) {
	                if(goHash.indexOf("index/index/index")!=0
	                		  &&goHash.indexOf("user/personal/login")!=0
	                		  &&goHash.indexOf("user/personal/qqlogin")!=0
	                		  &&goHash.indexOf("user/personal/wblogin")!=0
	                		  &&goHash.indexOf("other/Message/agreement")!=0
	                		  &&goHash.indexOf("index/index/information")!=0
	                		  &&goHash.indexOf("start/start/start")!=0
	                		  &&goHash.indexOf("start/start/startDonate")!=0
	                		  &&goHash.indexOf("index/index/projectDetails")!=0
	                		  &&goHash.indexOf("index/index/myLabel")!=0
	                ){
	                   DMJS.beforeLoginHash = goHash;
	                  return DMJS.router.navigate("user/personal/login", true);
	                }
	        }
           
            this.doNext();
            
        }
    });
});

define("filters/weixinFilter", ['commonClass/ActionFilter'], function(ActionFilter) {
    return new ActionFilter({
        "id": "weixinFilter",
        "triggers": ['router.navigate'],
        'func': function(_viewId, _methodName) {
            var goHash = this.args[0];
            if (goHash == "index/index/more" ||
                    goHash == "user/password/pwdManage"
                    ) {
                return DMJS.navigate("user/personal/userInfo");
            }
            require(["commonClass/weixin"], function(weixin) {
                weixin.step();
            });
            DMJS.beforeLoginHash = goHash;
            this.doNext();
        }
    });
});


//filters/authorizeFilter
//部分view不允许非登录访问       	
define("filters/authorizeFilter", ['commonClass/ActionFilter'], function(ActionFilter) {
    return new ActionFilter({
        "id": "authorizeFilter",
        "triggers": ['request.success'],
        'func': function(_viewId, _methodName) {
            var response = this.args[1];
            if (response == undefined) {
                this.doNext();
            } else if (response.code == "000048" || response.code == "000049") {
                delete DMJS.userInfo;
                DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response.description, function() {
                    DMJS.navigate("user/personal/login", true);
                });
            } else if (response.code == "000047") {
                DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response.description, function() {
                    DMJS.currentView.success = function() {
                        DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "授权成功", function() {
                            DMJS.navigate("user/personal/userInfo", true);
                        });
                    }
                    Native.openChildWebActivity(response.data.url, {title: "账 号 授 权"});
                });
            } else {
                this.doNext();
            }

        }
    });
});


//filters/main.js
define("filters/main", ['filters/userFilter', 'filters/sessionFilter', 'filters/authorizeFilter', 'filters/weixinFilter'],
        function() {
            console.log("DMJS APP LOGIC FILTER STARTED ... ");
//	require(['filters/cardManageFilter.sq'], function(){});
        });






//commonTool/Console.js

define("commonTool/Console", [], function() {
    var core = window.console;
    window.console = {
        "log": function(message) {
            this.debug(message);
        },
        "debug": function(message) {
            if (Config.base("logLever") >= 2) {
                //core.log("DEBUG:" + message);
            }
        },
        "info": function(message) {
            if (Config.base("logLever") >= 1) {
                core.log("INFO:" + message);
            }
        }
    }
    return window.Console
});



//commonTool/date.js
define("commonTool/date", [], function() {
    var _Date = Date;
    window.Date = function() {
        var _result = new _Date(arguments);
        if (DMJS && DMJS.systemTimeSync) {
            _result.setTime(_result.getTime() + DMJS.systemTimeSync);
            return _result;
        }
    }
    return window;
});
//commonTool/validator.js
//校验  公共
define("commonTool/validator",['commonClass/stringTools', "commonTool/tool"], function(stringTools,tool) {
    var ruler = {
    	
    	'notEmpty': {
            'logic': stringTools.isNotEmpty,
            'text': '<%=$dom.attr("title")%>不能为空'
       },
        'length': {
            'logic': function(val, min, max) {
                var length = val ? val.length : 0;
                if (min && min != -1 && min > length) {
                    return false;
                }
                return true;
            },
            'text': '<%=$dom.attr("title")%>格式有误，请重试！'
        },
        'textMinLength': {
        	'logic': function(val, min) {
        		var length = val ? val.length : 0;
        		if (min && min != -1 && min > length) {
        			return false;
        		}
        		return true;
        	},
        	'text': '<%=$dom.attr("title")%>长度不足<%=params[1]%>个字'
        },
        'checkPd': {
            'logic': function(val, min, max) {
                var length = val ? val.length : 0;
                if (min && min != -1 && min > length) {
                    return false;
                }
                return true;
            },
            'text': '<%=$dom.attr("title")%>4-16个字符，区分大小写'
        },
        'reg': {
            'logic': function(val, reg) {
                return reg.test(val);
            },
            'text': '<%=$dom.attr("title")%>格式有误，请重试！'
        },
        'Int':{
        	'logic':function(val, min, max) {
        		if(isNaN(val)||val==""||val.indexOf('.')!=-1)  return false; 
        		return true;
        	},
        	'text': '<%=$dom.attr("title")%>必须是整数'
        },
        'val': {
            'logic': function(val, min, max) {
                if (min != undefined && min != -1 && min > val) {
                    return false;
                }
                if (max != undefined && max != -1 && max < val) {
                    return false;
                }
                return true;
            },
            'text': '<%=$dom.attr("title")%>输入范围在<%=params[1]%>-<%=params[2]%>之间'
        },
        //整数倍
		'multiple':{
			'logic':function(val,value){
			val=val*1,value=value*1;
				if(val%value!=0){
					return false;
				}
				return true;
			},
			'text':'<%=$dom.attr("title")%>必须是<%=params[1]%>的倍数'
		},
        'amountMin': {
            'logic': function(val, min) {
                if (min && min != -1 && min > val) {
                    return false;
                }
                return true;
            },
            'text': '<%=$dom.attr("title")%>不能小于<%=params[1]%>'
        },
        'isNumber': {
            'logic': function(val) {
                if (!/^[1-9]+[0-9]*$/.test(val)) {
                    return false;
                }
                return true;
            },
            'text': '<%=$dom.attr("title")%>的值必须为数字'
        },
        'equal': {
            'logic': function(val, compVal) {
                return val == compVal;
            },
            'text': '两次密码不一致'
        },
        'noequal': {
            'logic': function(val, compVal) {
                return val != compVal;
            },
            'text': '<%=$dom.attr("title")%>不能和原密码相同'
        },
        'checked': {
            'logic': function() {
                return this.is(":checked");
            },
            'text': '<%=$dom.attr("title")%>'
        },
		'checkidcard':{
			'logic':function(val){
				 if (val.length == 18) {   
				        var a_idCard = val.split("");  // 得到身份证数组  
				        if(tool.isValidityBrithBy18IdCard(val) && tool.isTrueValidateCodeBy18IdCard(a_idCard)) { //进行18位身份证的基本验证和第18位的验证
				        	return true;
				        }else{
				        	return false;
				        }
				        
				 }else {
				        return false;   
				    }   
			},
			'text':'请输入正确的身份证号码'
		},
        "radioChecked": {
            "logic": function() {
                var name = this.attr("name");
                return $("input[name='" + name + "']:checked").length > 0
            },
            "text": '请选择<%=$dom.attr("title")%>'
        }
        
    };
    var validator = {
        'check': function($range) {
        	var tag='input,select,textarea';
            var return_flg = true;
            var self = this;
            if($range.is(tag)){
            	if (!self.triggerCheckItem($range)) {
                    return_flg = false;
                    return false;
                }
            }else{
            	  $range.find(tag).each(function() {
                if (!self.triggerCheckItem($(this))) {
                    return_flg = false;
                    return false;
                }
            });
            }
          
            return return_flg;
        },
        'checkItems': function($range) {
            var return_flg = true;
            var self = this;
            $range.each(function() {
                if (!self.triggerCheckItem($(this))) {
                    return_flg = false;
                    return false;
                }
            });
            return return_flg;
        },
        'removeCheckItem': function($dom, removeItem) {
            if ($dom.attr("validator")) {
                var checkItems = $dom.attr("validator").split(";"), newCheckItems = [];
                for (var i = 0; i < checkItems.length; i++) {
                    if (checkItems[i].indexOf(removeItem) != 0) {
                        newCheckItems.push(checkItems[i]);
                    }
                }
                $dom.attr("validator", newCheckItems.join(";"));
            }
        },
        'addCheckItem': function($dom, addItem) {
            var _itemsStr = $dom.attr("validator") ? $dom.attr("validator") : "";
            var checkItems = _itemsStr.split(";"),
                    newCheckItems = [],
                    checkStr = addItem.indexOf("[") == -1 ? addItem : addItem.substring(0, addItem.indexOf("["));
            for (var i = 0; i < checkItems.length; i++) {
                if (checkItems[i].indexOf(checkStr) != 0) {
                    newCheckItems.push(checkItems[i]);
                }
            }
            newCheckItems.push(addItem);
            $dom.attr("validator", newCheckItems.join(";"));
        },
        'triggerCheckItem': function($dom, triggerItems) {
            if (!triggerItems) {
                triggerItems = $dom.attr("validator");
            }
            if (triggerItems) {
                var checkItems = triggerItems.split(";");
                var definemsg = 0;//自定义提示语位置
                for (var i = 0; i < checkItems.length; i++) {
                	var isZDY = checkItems[i].indexOf("{");//自定义提示 {}包住校验项
                    var _index = checkItems[i].indexOf("["), 
                    	//如果存在自定义就需要去掉页面的   {}
                    	rule = isZDY == 0?ruler[checkItems[i].substring(1,checkItems[i].length-1)]:ruler[checkItems[i]], 
                    	params = [];
                    if (_index != -1) {
                    	rule = ruler[checkItems[i].substring(0, _index)];
                    	if(isZDY == 0){
                    		rule = ruler[checkItems[i].substring(1,_index)];
                    		params = eval(checkItems[i].substring(_index,checkItems[i].length-1));
                    	}else{
	                        params = eval(checkItems[i].substring(_index));
                    	}
                    }
                    params.unshift($dom[0].value);
                    if (rule && !rule.logic.apply($dom, params)) {
                		var text = rule.text;
                    	if(isZDY == 0){//如果是自定义就需要取自定义消息进行提示
                    		var msg = $dom.attr("definemsg");
                    		if(msg){
	                    		text = msg.split(";")[definemsg]?msg.split(";")[definemsg]:text;
	                    		definemsg++;
                    		}else{
                    			text = rule.text;
                    		}
                    	}
                        if (text) {
                            var resultText = _.template(text, {'$dom': $dom, 'params': params});
                            DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), resultText);
                        }
                        return false;
                    }
                }
            }
            return true;
        }
    }
    return validator;
});

//commonTool/thread.js
define("commonTool/thread", ['DMJSAll'], function() {
    var threads = {};
    var setTimeout = window.setTimeout;//window.setTimeout=undefined;
    var setInterval = window.setInterval;//window.setInterval=undefined;
    var clearInterval = window.clearInterval;//window.clearInterval=undefined;
    var Thread = function(alternation, times, func) {
        var core = {
            "timer": undefined,
            "times": 0,
            "startTime": undefined,
            "start": function() {
                if (!this.timer) {
                    this.startTime = new Date();
                    this.timer = setInterval(function() {
                        console.log("运行线程[" + new Date() + "]：" + func);
                        func(core.startTime);
                        core.times++;
                        if (core.times > times && times != -1) {
                            core.stop();
                        }
                    }, alternation);
                } else {
                    console.log("线程已经处于运行状态：" + func);
                }
            },
            "stop": function() {
                clearInterval(this.timer);
                this.timer = undefined;
            }
        }
        return core;
    }
    DMJS.setTimeout = setTimeout;
    DMJS.startThread = function(key, alternation, times, func) {
        console.log("创建thread[" + new Date() + "]：key:" + key);
        if (threads[key]) {
            DMJS.removeThread(key);
        }
        var thread = new Thread(alternation, times, func);
        thread.start();
        threads[key] = thread;
        return thread;
    }
    DMJS.getThread = function(key) {
        return key ? (threads[key]) : (threads);
    }
    DMJS.stopThread = function(key) {
        if (key && threads[key]) {
            threads[key].stop();
        } else {
            for (var key in threads) {
                threads[key].stop();
            }
        }
    }
    DMJS.removeThread = function(key) {
        DMJS.stopThread(key);
        if (key && threads[key]) {
            console.info("销毁线程:" + key);
            delete threads[key];
        } else {
            for (var key in threads) {
                delete threads[key];
            }
        }
    }
    return null;
});

//commonTool/localData.js
define("commonTool/localData", ["Lib/base64"], function(Base64) {
    var localDB = {core: localStorage || DimengFileLocalStrong};
    var base64 = new Base64(Config.base("trunKey"));
    var localData = {
        "loginUserName": '',
        'loginUserPassword': '',
        'loginStatus': 'N'
    };
    var localUserData = {
        'handPasswordSwitch': 'on',
        'handPassword': '',
        'nextHPWDChance': 5
    }
    var nowUserData = {};

    function jons(callback) {
        (localDB.__getItem = localDB.getItem) && (localDB.getItem = function(key) {
            return base64.decode(localDB.__getItem(key));
        });
        (localDB.__setItem = localDB.setItem) && (localDB.setItem = function(key, val) {
            return localDB.__setItem(key, base64.encode(val));
        });
        callback();
    }
    //对外方法禁止变动
    var funcs = {
        "get": function(key) {
            return localDB.getItem(key);
        },
        "set": function(key, val) {
            localData.key = val;
            localDB.setItem(key, val);
        },
        "getByUser": function(key) {
            return 	nowUserData[key];
        },
        "setByUser": function(key, value) {
            if (!DMJS.userInfo) {
                return;
            }
            nowUserData[key] = value;
            localDB.setItem("user:" + DMJS.userInfo.accountName, JSON.stringify(nowUserData));
        },
        "initUser": function(userName) {
            if (!DMJS.userInfo && !userName) {
                return;
            }
            userName = userName ? userName : DMJS.userInfo.accountName;
            var val_local = localDB.getItem("user:" + userName);
            if (val_local && val_local != "") {
                nowUserData = JSON.parse(val_local);
            } else {
                nowUserData = _.extend({}, localUserData);
                localDB.setItem("user:" + userName, JSON.stringify(nowUserData));
            }
        },
        "delUser": function() {
            if (!DMJS.userInfo) {
                return;
            }
            var userId = DMJS.userInfo.id;
            localDB.removeItem("user:" + userId);
        }
    };
    (function(callback) {
        localDB.getItem = function(key) {
            var result = base64.decode(this.core.getItem(key));
            if (!result || result == "") {
                this.core.removeItem(key);
                return undefined;
            }
            return result;
        };
        localDB.setItem = function(key, val) {
            return this.core.setItem(key, base64.encode(val));
        };
        (function() {
            var args = arguments;
            for (var i = 0; i < this.core.length; i++) {
                this.getItem(this.core.key(i));
            }
            _.each(args, function(ins) {
                ins();
            });
        }).apply(localDB, [callback]);
    })(function() {
        for (var key in localData) {
            var val_local = localDB.getItem(key);
            if (val_local) {
                localData[key] = val_local;
            } else if (localData.key) {
                localDB.setItem(key, localData.key);
            }
        }
        for (var i = 0; i < localDB.length; i++) {
            var key_local = localDB.key(i);
            if (!localData[key_local]) {
                if (key_local.indexOf("user:") == 0) {
                    //var userName=key_local.substring(5);
                } else {
                    localDB.removeItem(key_local);
                }
            }
        }
        funcs.initUser(funcs.get("loginUserName"));
    });
    DMJS.localData = funcs;
    return funcs;
});


/**
 * 定义DMJS对象
 */
//DMJS.js
define("DMJS", ['backbone', 'Lib/md5', 'commonClass/ActionFilter'], function(_backbone, MD5, ActionFilter) {
    // 将DMJS原型引用为Backbone, 便于调用和扩展
    var DMJSConstructor = new Function();
    DMJSConstructor.prototype = Backbone;
    DMJSConstructor.prototype.constructor = DMJSConstructor;

    // 创建并扩展DMJS对象
    _.extend(window.DMJS = new DMJSConstructor(), {
        // 框架版本号
        VERSION: '0.0.1',
        lastHash: '',
        htmlView: {},
        hashView: {},
       
        // 初始化创建Router对象
        init: function() {
        	//从cookie中取出user
            var cuserInfo = DMJS.CommonTools.getCookie("userInfo");
            var searchItem = DMJS.CommonTools.getCookie("searchItem");
            if(cuserInfo){
            	 DMJS.userInfo = JSON.parse(cuserInfo);
            } 
            if(searchItem){
           	 DMJS.searchItem = searchItem;
            } 
              //初始化存放hash的数组
		    if(!window.listHash){
				window.listHash=[];
			}
            this.router = new DMJS.DMJSRouter();
            var _callFunc = this.router.navigate;
            this.router.navigate = function() {
                var _params = arguments;
                ActionFilter("router", "navigate", function() {
                    _callFunc.apply(DMJS.router, _params);
                }, _params);
            }
            this.history.start({
                pushState: false
            });
			window.erroHash=[];
            this.naviVal=[/.+/];
            this.pushNavi(this.naviVal);
            var self = this;
        },
        // 导航到当前的action
        navigate: function(fragment) {
        	var router = this.router, fragment = fragment || location.hash.substring(1);
        
            router.navigate('', {
                trigger: false,
                replace: true
            });

            router.navigate(fragment, {
                trigger: true,
                replace: true
            });
            },
        pushNavi:function(arr){
        	for(var i=0;i<arr.length;i++){
        		DMJS.history.handlers.push({
                    callback: _.bind(this.autoload, this),
                    route: arr[i]
                });
        	}
        },
        // 自动解析并加载模块入口
        autoload: function(hash) {
            this.lastHash = hash;
            var hashArr = hash.split('/');
            var module = hashArr.splice(0, 1)[0], controller = hashArr.join('/');
            if (module && module != 'common') {
                var mainPath = 'app/modules/' + module + '/main';
                require([mainPath], _.bind(function(moduleMain) {
            	if(hash.split('/')[2].indexOf("&code=")!="-1"||hash.split('/')[2].indexOf("?code=")!="-1"){//第三方授权回来是xxx/xxx/xxx&code=xxxxxx
                	hash = hash.replace("&","/").replace("?","/");//获取正确路由
                	
                }
                if(!this.stopRouteLock(hash)){return ;}
                    moduleMain();
                    this.navigate(hash);
                    

                }, this));
            }
        },
    
        removeViewCache: function(key) {
            if (key && this.hashView[key]) {
                delete this.hashView[key];
            } else {
                for (var key in this.hashView) {
                    delete this.hashView[key];
                }
            }
        },
       stopRouteLock:function(hash){
        		window.erroHash&&hash.indexOf("code=")=="-1"&&window.erroHash.push(hash);
                	if(window.erroHash.length>=2&&(window.erroHash[window.erroHash.length-2]==window.erroHash[window.erroHash.length-1])){
                		if(location.hash.indexOf('#index')!=-1){
                			this.navigate('index/index/index');
                		}
                		else if(location.hash.indexOf('#user')!=-1){
                			this.navigate('user/personal/userCenter');
                		}
                		else{
                			this.navigate('index/index/index');
                		}
                		if(window.erroHash.length>10){
                    		window.erroHash.length>0 ? window.erroHash.splice(0,window.erroHash.length) : null;
                    	}
                		console.log("错误地址:"+hash);
                		return false;
                	}
                	
                	return true;
        }
    });

    return DMJS;
});

/**
 * 重载Backbone.Collection
 */
define("DMJSCollection", ['backbone'], function() {
    var DMJSCollection = DMJS.DMJSCollection = Backbone.Collection.extend({
        initialize: function(options) {
            this.init.apply(this, arguments);
        },
        init: function(options) {
        }
    });

    return DMJSCollection;
});

/**
 * 创建Controller控制器, 控制器作为执行业务逻辑的容器, 并负责创建调度模型和视图
 */
define("DMJSController", function() {
    var DMJSController = DMJS.DMJSController = function(options) {
        this.initialize.apply(this, arguments);
    };
    // Controller继承Backbone.Events, 因此允许使用Events中的事件方法
    _.extend(DMJSController.prototype, Backbone.Events, {
        initialize: function(options) {
            var actions = this.actions;
            if (actions) {
                var router = DMJS.router, list = [], route = null, prefix = this.module + '/' + this.name + '/';

                for (var key in actions) {
                    list.unshift([key, this[actions[key]]]);
                }

                for (var i = 0, len = list.length; i < len; i++) {
                    route = list[i];
                    router.route(prefix + route[0], '', _.bind(route[1], this));
                }
            }

            this.init.apply(this, arguments);
        },
        // 模块名
        module: '',
        // 控制器名, 用于模块路由时定义规则
        name: '',
        // 模块规则
        actions: null,
        // 初始化方法
        init: function(options) {
        },
        // 在销毁控制器时同时移除URL中的Action监听
        destroy: function() {
            var actions = this.actions;
            if (actions) {
                var router = DMJS.router, handlers = DMJS.history.handlers, handler = null, prefix = this.module + '/' + this.name + '/';
                for (var key in actions) {
                    var exp = router._routeToRegExp(prefix + key).toString();

                    for (var i = 0, len = handlers.length; i < len; i++) {
                        handler = handlers[i];
                        if (handler.route.toString() == exp) {
                            handlers.splice(i, 1);
                            break;
                        }
                    }
                }
            }
        }

    });

    // 添加控制器的继承方法, 在继承子控制器时自动添加getInstance获取单例的方法
    DMJSController.extend = function(protoProps, classProps) {
        var Controller = DMJS.DMJSModel.extend.call(this, protoProps, classProps);
        //var Controller=_.extend(this,protoProps,classProps);
        Controller.getInstance = function(options) {
            if (!this._instance) {
                this._instance = new this(options);
            }

            return this._instance;
        }
        return Controller;
    }
    return DMJSController;
});



/**
 * 重载Backbone.History
 */
define("DMJSHistory", ['backbone'], function() {
    var DMJSHistory = DMJS.DMJSHistory = Backbone.History.extend({
        initialize: function(options) {
            this.init.apply(this, arguments);
        },
        init: function(options) {
        }
    });

    return DMJSHistory;
});


/**
 * 重载Backbone.Model DMJSModel.js
 */
define("DMJSModel", ['backbone', 'commonClass/ActionFilter'], function(_backbone, ActionFilter) {
    var DMJSModel = DMJS.DMJSModel = Backbone.Model.extend({
        initialize: function(options) {
            this.init.apply(this, arguments);
        },
        init: function(options) {
        },
        'commonRequest': function(param,method) {
        	if(!navigator.onLine){
        		DMJS.CommonTools.alertCommon("温馨提示", "当前无网络链接");
        		return false;
        	}
            var self = this;
            var dataType ="jsonp";
            var type = "get";
	        if(method&&method.toLowerCase()=='post'){
	                dataType ="json";
	                type = "POST";
	        }
            param = _.extend({
                "error": function(response) {
                    DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
//                    if (param.commonError) {
//                        param.commonError(response);
//                    }
                },
                "dataType":dataType,
                "type" :type,
                "beforeSend": function(xhr){
                	 if(method&&method.toLowerCase()=='post'){
                     	xhr.setRequestHeader('Accept', 'application/json');
                        xhr.setRequestHeader('contentType', 'application/json;charset=UTF-8');
                        if("user.login"!=param["urlKey"]){
	                      	 var authorization = DMJS.userInfo ? DMJS.userInfo.token : DMJS.CommonTools.getCookie("authorization");
	                      	 DMJS.authorization = authorization; 
	                       	 xhr.setRequestHeader('Authorization', authorization);
                        }
     	            }

                },
                "beforeSendCallback": function(xhr) {
                    xhr.withCredentials = true;
                }
            }, param);
            var successInvoke = param.success;
            param.success = function(response) {
                console.log("请求:" + param.urlKey + ', success Response: ' + response);
//        		 ActionFilter();
                ActionFilter("request", "success", function() {
                    if ((response && "000000" == response.code) ||(response &&response.status=="ok")) {
                        successInvoke(response);
                        return;
                    }
                    else if(response.baseDataResp && "000000" == response.baseDataResp.code){//返回结构不一致，特殊处理
                    	 successInvoke(response);
                         return;
                    }
                    else if (response && response.code == "200001") {
                    	//200001 未登录状态 移除cookie 和 缓存  重新登录
                        DMJS.userInfo = undefined;
                        DMJS.removeCache("user.myAccount");
                        DMJS.router.navigate("user/personal/login", true);
                        DMJS.CommonTools.delCookies();
                        DMJS.CommonTools.hash_clear();
                }else if (response && response.description) {
                        if (param.logicError) {
                            param.logicError(response);
                        } else if(param.error){
                        	param.error(response);
                        }
                        else {
                            DMJS.CommonTools.alertCommon("温馨提示", DMJS.CommonTools.transferCode(response.code));
                        }
//                        if (param.commonError) {
//                            param.commonError(response);
//                        }
                    } else {
                        if (param.logicError) {
                            param.logicError(response);
                        }else if(param.error){
							param.error(response);
                        } 
                        else {
                            DMJS.CommonTools.alertCommon("温馨提示", "数据请求失败，请刷新页面！");
                        }
//                        if (param.commonError) {
//                            param.commonError(response);
//                        }
                    }
                }, [param, response]);

            }
            DMJS.Request(param.urlKey, param);
        }
    });

    // 用于存放应用中共享的模型对象
    DMJSModel.shareModels = {
        // @private
        _shareList: {},
        /**
         * 添加共享的模型
         */
        add: function(name, model) {
            DMJSModel.shareModels._shareList[name] = model;
        },
        /**
         * 获取共享的模型
         */
        get: function(name) {
            return DMJSModel.shareModels._shareList[name];
        },
        /**
         * 移除模型
         */
        remove: function(name) {
            var shareList = DMJSModel.shareModels._shareList;
            shareList[name] = null;
            delete shareList[name];
        }
    }

    return DMJSModel;
});


/**
 * 重载Backbone.Router, 将规则解析到DMJSController中的方法
 */
define("DMJSRouter", ['backbone'], function() {
    var DMJSRouter = DMJS.DMJSRouter = Backbone.Router.extend({
        initialize: function(options) {
            this.init.apply(this, arguments);
        },
        init: function(options) {

        }
    });

    return DMJSRouter;
});





/**
 * 重载Backbone.View DMJSView.js
 */
define("DMJSView", ['commonClass/scroll/iscroll', 'commonClass/ActionFilter',], function(iscroll, ActionFilter) {
    var DMJSView = DMJS.DMJSView = Backbone.View.extend({
        // 用于视图关联时的标识
        name: '',
        // 存放所有子视图对象
        children: [],
        // 根据名称存放所有子视图对象
        childrenAsName: {},
        // 根据表达式存放所有子视图列表
        childrenAsEl: {},
        // 等待加入到视图中的子视图对象列表
        awaitChildren: [],
        // 视图所引用的Controller
        controller: null,
        resizable: false,
        initialize: function(options) {
            if (options) {
                this.controller = options.controller;
            }
            this.init.apply(this, arguments);
            var cancelScroll = this.type != "control" && "wrapView" in  window && wrapView.myScroll,
                    render = this.render,
                    self = this;
            if (this.render) {
                this.render = function() {
                    var ret = render.apply(self, arguments);
                    return ret;
                }
            }
            self.events = _.extend({//'focus input': '_inputFocus',
                'keydown input': 'turnNextInput',
                'tap div[action]': 'goAction',
                'tap dl[action]': 'goAction',
                'tap li[action]': 'goAction',
                'tap span[action]': 'goAction',
                'tap a[action]':'goAction',
                'tap input[type="checked"]': 'goAction',
                'tap #clear':'clear',
                'blur input': '_inputBlur',
                'focus input': '_inputFocus',
                'tap .t-btn-a4':'runScrollerTop'
            }, self.events)
        },
        init: function(options) {
            //
        },
        // 显示视图对象
        show: function() {
            this.$el.show();
        },
        // 隐藏视图对象
        hide: function() {
            this.$el.hide();
        },
        /**
         * 添加一个子视图对象到当前视图中
         * @param {String} el 添加到视图的节点表达式
         * @param {String} name 子视图名称
         * @param {View Object} view 子视图对象
         * @param {Boolean} await 当节点不存在时是否将子视图加入到待渲染列表
         */
        addChild: function(el, name, view, await) {
            // 子视图添加的节点
            var $node = this.$el;
            if (el) {
                $node = $node.find(el);
            }

            if ($node.length) {
                // 节点存在, 立即添加到视图
                $node.append(view.el);
                view.parent = this;

                this.children.push({
                    el: el,
                    name: name,
                    view: view
                });
                this.childrenAsName[name] = view;

                if (!this.childrenAsEl[el]) {
                    this.childrenAsEl[el] = [view];
                } else {
                    this.childrenAsEl[el].push(view);
                }
            } else if (await || await === undefined) {
                // 节点不存在, 存储在待添加列表
                this.awaitChildren.push({
                    el: el,
                    name: name,
                    view: view
                });
            }

            return this;
        },
        /**
         * 渲染所有待添加的子视图列表
         */
        renderChildren: function() {
            var awaitChildren = this.awaitChildren, child = null;

            for (var i = 0, len = awaitChildren.length; i < len; i++) {
                child = awaitChildren[i];
                this.addChild(child.el, child.name, child.view, false);
            }
        },
        /**
         * 清除所有的待添加子视图列表
         */
        clearAwaitChildren: function() {
            this.awaitChildren.length = 0;
        },
        /**
         * 根据视图名称获取视图对象
         */
        getChildByName: function(name) {
            return this.childrenAsName[name];
        },
        /**
         * 根据表达式获取视图对象
         */
        getChildsByEl: function(el) {
            return this.childrenAsEl[el];
        },
        /**
         * 获取所有子视图列表
         */
        getChildren: function() {
            return this.children;
        },
        // @private
        _destroyChild: function(type, value) {
            var children = this.children, child = null, childName = '', childEl = '', childValue = '';

            for (var i = 0, len = children.length; i < len; i++) {
                child = children[i];
                childName = child.name;
                childEl = child.el;
                childValue = child[type];

                if (childValue == value) {
                    child.view.destroy();

                    this.childrenAsName[childName] = null;
                    this.childrenAsEl[childEl] = null;
                    delete this.childrenAsName[childName];
                    delete this.childrenAsEl[childEl];
                    break;
                }
            }
        },
        /**
         * 根据名称销毁子视图
         * @param {String} name
         */
        destroyChildByName: function(name) {
            this._destroyChild('name', name);
        },
        /**
         * 根据表达式销毁子视图
         * @param {String} el
         */
        destroyChildByEl: function(el) {
            this._destroyChild('el', el);
        },
        /**
         * 销毁所有子视图对象
         */
        destroyChilds: function() {
            var children = this.children;
            for (var i = 0, len = children.length; i < len; i++) {
                child = children[i];
                child.remove();
            }

            this.clearAwaitChildren();
            this.childrenAsName = {};
            this.childrenAsEl = {};
            this.children.length = 0;
        },
        /**
         * 销毁当前视图对象, 同时将销毁所有子视图
         */
        destroy: function() {
            this.onDestroy && this.onDestroy();
            // 销毁子视图对象
            this.destroyChilds();
            // 解除事件绑定
            this.undelegateEvents();
            if (self.scroller) {
                self.scroller.destroy();
                self.scroller = undefined;
            }
            // 移除DOM元素
            this.$el.remove();
            delete this;
        },
        "turnNextInput": function(e) {
            var self = this;
            if (e.keyCode == 13) {
                $(e.target)[0].blur();
                //$(e.target).nexts("input")[0].focus();
                var nextFocus = $(e.target).attr("nextFocus");
                var nextAction = $(e.target).attr("nextAction");
                if (nextFocus && nextFocus != "" && $("input[name='" + nextFocus + "']").length > 0) {
                    $("input[name='" + nextFocus + "']")[0].focus();
                } else if (nextAction && nextAction != "") {
                    self[nextAction] && self[nextAction]();
                }
            }
            var kkkkk = $(e.target).val();
            if (/[\ud83d\ud83c][\u0000-\ueeee]/g.test(kkkkk)) {
                kkkkk = kkkkk.replace(/[\ud83d\ud83c][\u0000-\ueeee]/g, "");
                $(e.target).val(kkkkk);
            }
        },
        'goAction': function(e) {
            var self = this;
            var $dom = $(e.target);
            if (!$dom.is("[action]")) {
                $dom = $(e.target).parents("[action]");
            }
            var hash = $dom.attr("action");
            if (hash && hash != "") {
//        		$dom.removeClass("btn_activity").addClass("btn_activity");
                var arrs = hash.split(":");
                if (arrs.length > 1) {
                    var params = [], funcName = arrs[1];
                    var _index = arrs[1].indexOf("[");
                    if (_index != -1) {
                        funcName = arrs[1].substring(0, _index);
                        params = eval(arrs[1].substring(_index));
                    }
                    params.push($dom);
                    ActionFilter(self.id, funcName, function() {
                        self[funcName].apply(self, params);
                    }, params);
                } else {
                    DMJS.router.navigate(hash, true);
                }
            }
        },
        loadScroller: function(scrollerId,titH) {
            var self = this;
            scrollerId = scrollerId ? scrollerId : self.id;
            titH = titH ? titH : 0;
            if (!self.scroller) {
                var wraper = $("#"+scrollerId);
                //var wraper = self.$el;
                wraper.height(wrapView.height -
                        $("#header").height()-titH - $("#footer").height());
                     
                this.scroller = new iScroll(wraper[0], {
                  
                });
            } else {
                this.scroller.refresh();
            }
        },
        reflush: function() {
            if (this.scroller) {
                this.scroller.destroy  ? this.scroller.destroy() : null;
                delete this.scroller;
            }
            this.init();
            this.render();
        },
        lazyRender: function() {
            var self = this;
            DMJS.CommonTools.toggleLoadingInPage(self, true);
            self._lazyRender = setTimeout(function() {
                self.render();
            }, Config.base("lazyRender") || 500);
        },
       
        _inputFocus: function(e) {
            $(e.target).parents("div.uinput").addClass("input-focus");
        },
        _inputBlur: function(e) {
            $(e.target).parents("div.uinput").removeClass("input-focus");
        },
        clear:function(e){
        	var $dom=$(e.target);
        	$dom.siblings('p').find('input').val('');
        },
        tipsSave:function(tit,type){
        	wrapView.FlipPrompt.confirm({    //设置头像
   				title: "温馨提示",
   				content: "当前"+tit+"有变化，是否保存当前"+tit+"设置？",
   				FBntconfirm: "否",
				FBntcancel: "是",
				FBntCancelColor: "pop_btn_orange"
				}, function() {
					 DMJS.userInfo.cityId="";
					 DMJS.router.navigate('user/personal/basicInfo', true);
				}, function() {
					if(type==5){
						DMJS.currentView['setNickN'].apply(DMJS.currentView);
						return false;
					}
					DMJS.currentView['setDz'].apply(DMJS.currentView);
					
				});
        }
    });

    // 用于存放应用中共享的视图对象
    DMJSView.shareViews = {
        // @private
        _shareList: {},
        /**
         * 添加共享的视图
         */
        add: function(name, view) {
            this._shareList[name] = view;
        },
        /**
         * 获取共享的视图
         */
        get: function(name) {
            return this._shareList[name];
        },
        /**
         * 移除视图
         */
        remove: function(name) {
            var shareList = this._shareList;
            shareList[name] = null;
            delete shareList[name];
        }
    }

    return DMJSView;
});


/**
 * DMJSAll用于一次性导入所有DMJS模块
 */
define("DMJSAll", ['DMJS', //
    'DMJSModel', //
    'DMJSCollection', //
    'DMJSView', //
    'DMJSRouter', //
    'DMJSHistory', //
    'DMJSController'], function(DMJS) {
    return DMJS;
});


require(["commonConfig/base", 'commonTool/Console'], function(baseConfig) {
    baseConfig.configDone(function() {
        require(['DMJSAll',
            'commonController/MainController',
            "filters/main",
            'Native', 'Lib/base64',
            'commonConfig/logic',
            'commonConfig/url',
            'commonConfig/lang',
            'commonClass/request',
            'commonClass/scroll/iscroll',
            'commonTool/thread'
        ],
                function(DMJS, MainController) {
                    require(['jQuery', 'common/Context','mobiscrollAll'], function(jQuery, appContext) {
                        jQuery.noConflict();//防止跟其他库冲突 (名字)
                        console.log("进入主要流程");
                        DMJS.init();
                        MainController.createWrapView();
                        appContext.onAppStart(function() {
                            $("#_initLoading").remove();
                            if (window.location.hash && window.location.hash != "") {
                                var goWhereTem = (window.location.hash).substring(1);
                                DMJS.navigate(goWhereTem);
                            } else {
                                DMJS.navigate("index/index/index");
                            }
                        });
                    });
                 });
    });
});




      