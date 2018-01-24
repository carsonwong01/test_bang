
define(['userModel/UserModel',
        'commonController/MainController',
        'commonTool/tool'
       ], function(UserModel, MainController,tool){
    var PasswordController = MainController.extend({
    	

        module: 'user',
        name: 'password',
        actions: {
          'passManager':'passManager',//密码管理
          'verifyTransP':'verifyTransP',//验证原交易密码
          'updateWithdrawP':'updateWithdrawP',//修改提现密码
          'forgetWithdrewP':'forgetWithdrewP'//忘记提现密码
        },
        init: function(){
        	this.userModel = new UserModel();
        	
        },
        passManager:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"密码管理"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/password/passManagerView'], function(passManagerView){
	    	   self.setContent(passManagerView,{
	       			"controller":self
	    		}).render();
	       });
        },
        
        verifyTransP:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"修改提现密码"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/password/verifyTransPView'], function(verifyTransPView){
	    	   self.setContent(verifyTransPView,{
	       			"controller":self
	    		}).render();
	       });
        },
        
        updateWithdrawP:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"修改提现密码"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/password/updateWithdrawPView'], function(updateWithdrawPView){
	    	   self.setContent(updateWithdrawPView,{
	       			"controller":self
	    		}).render();
	       });
        },
       
       forgetWithdrewP:function(){
        	var self=this;
        	self.setHeader({
        		"key":"none",
	       		"title":"修改提现密码"
        	});
        	self.setFoot({
	        	"key":"mainFoot",
	        	"hash":"userInfo"
	        });
	         require(['userView/password/forgetWithdrawPView'], function(forgetWithdrawPView){
	    	   self.setContent(forgetWithdrawPView,{
	       			"controller":self
	    		}).render();
	       });
        }
    });
    return PasswordController;
});
