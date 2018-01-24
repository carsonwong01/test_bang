
require.config({
    paths: {
        startController : 'app/modules/start/controller',
        startModel : 'app/modules/start/model',
        startView : 'app/modules/start/view',
        startTemplate : 'app/modules/start/template'
    }
});

//拉起对应controller单例
define(['startController/StartController'], 
        function(StartController){
    return function(){ 
    	StartController.getInstance();
    }
});