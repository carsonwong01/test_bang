define(['text!userTemplate/personal/city.html',
      
], function(cityTemplate){
    var cityView = DMJS.DMJSView.extend({
        id: 'city',
        name: 'city',
        tagName: 'div',
        className: "c-f9", 
        events: {
        	'tap #cityNr':'saveAddress'
        },
        init: function(options){
           	 _.extend(this, options); 
        },
        render: function(){
            var self=this; 
            if(!DMJS.place.provinceId){
            	DMJS.place.provinceId = "11";//默认初始值
            }
            self.controller.commonModel.searchAddress({
                "noCache": true,
                'data':{'provinceId':DMJS.place.provinceId},
                "success": function(response) { 
                   var data=response.data;
	               self.$el.html(_.template(cityTemplate,data));
	               self.loadScroller('cityNr',$('#cShen').height()); 
                },
                 'error':function(response){
                 	DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response&&response.description);
                 }
            });
            return this;
        },
        saveAddress:function(e){
        	var $dom=$(e.target),self=this;
        	if(!!$dom.parents('.Jcity').length>0){
        		$dom=$dom.parents('.Jcity');
        	}else if($dom.is('.Jcity')){
        		$dom=$dom;
        	}else{
        		return;
        	}
        	
        	DMJS.place.cityId=$dom.attr('cityId');
        	DMJS.place.cityStr = $dom.children("p").html();//新市
        	console.log(window.listHash.length);
        	if(DMJS.place.countyId != undefined){
        		DMJS.router.navigate('user/personal/county/'+$dom.attr('cityId'), true);
        	}else{
        		DMJS.router.navigate(DMJS.place.routeRul, true);
        	}
        	

        },
       
    });

    return cityView;
});
