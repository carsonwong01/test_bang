
require.config({
    paths: {
        otherController : 'app/modules/other/controller',
        otherModel : 'app/modules/other/model',
        otherView : 'app/modules/other/view',
        otherTemplate : 'app/modules/other/template'
    }
});

//拉起对应controller单例
define(['otherController/MessageController'], 
        function(MessageController){
    return function(){ 
    	MessageController.getInstance();
    }
});