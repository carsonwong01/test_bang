define(['text!userTemplate/personal/county.html',
      
], function(countyTemplate){
    var countyView = DMJS.DMJSView.extend({
        id: 'city',
        name: 'city',
        tagName: 'div',
        className: "c-f9", 
        events: {
        	'tap #countyNr':'saveAddress'
        },
        init: function(options){
           	 _.extend(this, options); 
        },
        render: function(){
            var self=this; 
            self.controller.commonModel.searchAddress({
                "noCache": true,
                'data':{'cityId':self.cityId},
              
                "success": function(response) { 
                   var data=response.data;
	               self.$el.html(_.template(countyTemplate,data));
	               self.loadScroller('countyNr',$('#cCounty').height()); 

                },
                 'error':function(response){
                 	
                 	DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), response&&response.description);
                 }
            });
            return this;
        },
        saveAddress:function(e){
        	var $dom=$(e.target),self=this;
        	if(!!$dom.parents('.Jcounty').length>0){
        		$dom=$dom.parents('.Jcounty');
        	}else if($dom.is('.Jcounty')){
        		$dom=$dom;
        	}else{
        		return;
        	}
        	
        	DMJS.place.countyId = $dom.attr('countyId');//记住选择地址id
        	DMJS.place.countyStr = $dom.children("p").html();
        	//window.listHash.length = window.listHash.length - 3;
        	DMJS.router.navigate(DMJS.place.routeRul, true);
        },
       
    });

    return countyView;
});
