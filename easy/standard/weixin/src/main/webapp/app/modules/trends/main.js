
require.config({
    paths: {
        trendsController : 'app/modules/trends/controller',
        trendsModel : 'app/modules/trends/model',
        trendsView : 'app/modules/trends/view',
        trendsTemplate : 'app/modules/trends/template'
    }
});

//拉起对应controller单例
define(['trendsController/TrendsController'], 
        function(trendsController){
    return function(){ 
    	trendsController.getInstance();
    }
});