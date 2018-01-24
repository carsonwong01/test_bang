
require.config({
    paths: {
        indexController : 'app/modules/index/controller',
        indexModel : 'app/modules/index/model',
        userModel : 'app/modules/user/model', 
        indexView : 'app/modules/index/view',
        indexTemplate : 'app/modules/index/template'
    }
});

//拉起对应controller单例
define(['indexController/IndexController'], 
        function(IndexController){
    return function(){ 
    	IndexController.getInstance();
    }
});