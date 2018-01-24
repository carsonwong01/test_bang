define(['zepto'], function($) {
    var tp1 =  {
		templates:{},
		loadTemplates : function(names,callback){
			var that = this;
			var loadTemplate = function(index){
				var name= names[index];
				that.templates[name] = $('#'+name).html();
				index ++;
				if(index < names.length){
					loadTemplate(index)
				}else{
					callback();
				}
			}
			loadTemplate(0);
		},
		get : function(name){
			return this.templates[name];
		}
	}
	return tp1;
});


