define(['Lib/md5'], function(MD5) {
    var context = {
        "onAppStart": function(calls) {
            var self = this;
            if (Config.logic("isWeixin")) {
                require(["commonClass/weixin"], function(weixin) {
                    weixin.init();
                });
            }
            calls(); 
            Native.dmjsReady();
        },
        "onLogin": function(_data) {
            if (_data) {
                DMJS.userInfo = _data;
            }
            DMJS.localData.initUser();
            DMJS.localData.set('loginStatus', 'Y'); 
        },
        "onLoginOut": function() {  
            DMJS.removeCache("user.myAccount");
            DMJS.CommonTools.delCookies();
        },
        "doVersion": function() {
            var newnessVersion = Config.base('version');
            var newnessUrl = "";
            var deviceFlag = wrapView.device == "android" ? "1" : "2";
            for (var i = 0; DMJS.timerInfo && DMJS.timerInfo.version && i < DMJS.timerInfo.version.length; i++) {
                if (DMJS.timerInfo.version[i].verType == deviceFlag && DMJS.timerInfo.version[i].isMust == '1') {
                    newnessVersion = DMJS.timerInfo.version[i].verNO;
                    newnessUrl = DMJS.timerInfo.version[i].url || DMJS.timerInfo.version[i].localUrl;
                }
            }
            if (newnessVersion > Config.base('version')) {
                console.log("doVersion");
                wrapView.FlipPrompt.confirm({
                    noRemove: true,
                    title: "关于" + Config.base("appName"),
                    content: "您的" + Config.base("appName") + "（" + Config.base('version') + "）已经不被支持。请更新到最新版本" + newnessVersion + "！",
                    FBntconfirm: "取消",
                    FBntcancel: "下载更新包",
                    FBntCancelColor: "pop_btn_orange",
                }, function() {
                    Native.exit();
                }, function() {
                    window.open(newnessUrl, "_system");
                    Native.exit();
                });
            }
        },
        "doServerUser": function(calls) {
            DMJS.Request("user.userinfo", {
                type: "post",
                dataType: "jsonp",
                unBort: true,
                cancelLightbox: true,
                success: function(response) {
                    if (response.data && (!QueryString('weixinUser') || response.data.accountName == QueryString('weixinUser'))) {
                        DMJS.userInfo = response.data;
                    }
                },
                complete: function() {
                    calls();
                }
            });
        }
    }
    return context;
});