
define(['otherModel/OtherModel',
        'commonController/MainController',
        'commonTool/tool'
       ], function(OtherModel, MainController,tool){
    var otherController = MainController.extend({

        module: 'other',
        name: 'Message',
        actions: {
        	'agreement/:id':'agreement',//注册协议
        },
        init: function(){
        	this.otherModel = new OtherModel();
        },
        //注册协议
        agreement:function(id){
        	var self=this;
        	self.commonModel.clauseList({
        		"data":{'id':id},
                'cancelLightbox':false,
    			"noCache":true,
    			"success":function(response){
    				var list=response.data.list.filter(function(item){ 
						 return item.id == id;
					 });
    			  	
	           self.setHeader({
		       		"key":"none",
					"title":list[0].protocolTitle
		       }); 
		       self.setFoot({
		        	"key":"none"
		       });
		       require(['otherView/agreement'], function(agreement){
		    	   self.setContent(agreement,{
		       			"controller":self,
		       			"data":{
		       				"centent":list
		       			}
		    		}).render();
		       });
		       
	    		},
	    	  'error':function(response){console.log(response);}
        });
	       
        },
    });
    return otherController;
});
