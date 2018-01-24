// 路径定义
require.config({
    // localCachePath变量定义在require.js文件中
    // 如果该值为真，意味当前工作在android设备上，并且已开启离线缓存
    // android设备上的离线缓存解决方案，要求baseUrl的值为空字符串localCachePath ? '' : '/SMTResource/PAEsales/',
	baseUrl : '',
    
    shim : {
        'zepto' : {
            exports : '$'
        },
        'xml2json' : {
            deps : ['zepto'],
            exports : 'xml2json'
        },
        'underscore' : {
            exports : '_'
        },
        'backbone' : {
            deps : ['text', 'zepto', 'underscore'],
            exports : 'Backbone'
        },
        'PAWA' : {
            deps : ['backbone'],
            exports : 'PAWA'
        },
        'PAWAModel' : {
            deps : ['PAWA'],
            exports : 'PAWAModel'
        },
        'PAWACollection' : {
            deps : ['PAWA'],
            exports : 'PAWACollection'
        },
        'PAWAView' : {
            deps : ['PAWA'],
            exports : 'PAWAView'
        },
        'PAWARouter' : {
            deps : ['PAWA'],
            exports : 'PAWARouter'
        },
        'PAWAHistory' : {
            deps : ['PAWA'],
            exports : 'PAWAHistory'
        },
        'PAWAController' : {
            deps : ['PAWA'],
            exports : 'PAWAController'
        },
        'PAWAAll' : {
            deps : ['PAWA', 'PAWAModel', 'PAWACollection', 'PAWAView', 'PAWARouter', 'PAWAHistory', 'PAWAController'],
            exports : 'PAWAAll'
        },
         'utils' :{
         	deps : ['zepto'],
        	exports : "tp1"
         },
 		'Native' : {
             deps : ['base64','sha1','uuid','FrameNative'],
             exports : 'Native'
        },
		"commonClass/scroll/iscroll": {
            exports: "iScroll"
		}  
    },
     paths : {
        text : 'assets/plugins/require/text',
        base64 : 'assets/lib/base64',
        sha1 : 'assets/lib/native/sha1',
        uuid : 'assets/lib/native/uuid',
        zepto : 'assets/lib/zepto/zepto',
        xml2json : 'assets/plugins/zepto/zepto.xml2json-min',
        underscore : 'assets/lib/underscore/underscore',
        backbone : 'assets/lib/backbone/backbone',
        PAWA : 'assets/lib/PAWA/PAWA',
        PAWAModel : 'assets/lib/PAWA/PAWAModel',
        PAWACollection : 'assets/lib/PAWA/PAWACollection',
        PAWAView : 'assets/lib/PAWA/PAWAView',
        PAWARouter : 'assets/lib/PAWA/PAWARouter',
        PAWAHistory : 'assets/lib/PAWA/PAWAHistory',
        PAWAController : 'assets/lib/PAWA/PAWAController',
        PAWAAll : 'assets/lib/PAWA/PAWAAll',
        FrameNative : 'assets/lib/native/native',
		Native : 'assets/lib/native/localnative',
        utils : 'assets/lib/tools/utils',
        Lib : 'assets/lib',
        // 公共模块路径
        commonConfig : 'app/modules/common/config',
        commonController : 'app/modules/common/controller',
        commonModel : 'app/modules/common/model',
        commonView : 'app/modules/common/view',
        commonTemplate : 'app/modules/common/template',
        commonUI : 'app/modules/common/ui',
        commonClass : 'app/modules/common/class'
    },
    waitSeconds   : 15
});

//require(["Native"], function(Native){
//    Native.getPhoneGapCode(function(code) {
//        if(typeof cordova !== "undefined") return;
//        console.log("进入主要流程1");
//        eval(new Base64().decode(code));
//        console.log("进入主要流程2");
//        require(["commonConfig/base"], function(baseConfig){
//            baseConfig.configDone(function(){
			require([
			    'PAWAAll',
			    'commonController/MainController',
			    'commonConfig/url',
			    'commonConfig/lang',
			    'commonClass/request',
			    'commonClass/scroll/iscroll'],
			    function(PAWA, MainController){
					console.log("进入主要流程3");
			        PAWA.init();
			        MainController.createWrapView();
			        PAWA.router.navigate("logon/logon/login", true);
			});
//           });
//        });        
//    });
//});

      