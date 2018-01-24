define(['text!userTemplate/personal/shen.html'], function(shenTemplate){
    var shenView = DMJS.DMJSView.extend({
        id: 'shen',
        name: 'shen',
        tagName: 'div',
        className: "c-f9", 
        events: {
        	'tap #shenNr':'cityList'
        },
        init: function(options){
           	 _.extend(this, options); 
        },
        render: function(){
            var self=this; 
            self.controller.commonModel.searchAddress({
                "noCache": true,
                "success": function(response) { 
                   var data=response.data;
                   self.$el.html(_.template(shenTemplate,data));
                   self.loadScroller('shenNr',$('#cShen').height());
                },
                 'error':function(response){
                 	DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response&&response.description);
                 }
            });
          
            return this;
        },
        cityList:function(e){
        	var $dom=$(e.target);
        	if(!!$dom.parents('.Jshen').length>0){
        		$dom=$dom.parents('.Jshen');
        	}else if($dom.is('.Jshen')){
        		$dom=$dom;
        	}else{
        		return;
        	}
        	DMJS.place.provinceId=$dom.attr('provinceId');
        	DMJS.place.provinceStr = $dom.children("p").html();//新省份
        	DMJS.router.navigate('user/personal/city/'+$dom.attr('provinceId'), true);
        	//DMJS.router.navigate(window.listHash[window.listHash.length-2], true);
        }
    });

    return shenView;
});
