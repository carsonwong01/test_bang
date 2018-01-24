define(['text!otherTemplate/agreement.html','commonTool/tool'
], function(agreementTemplate, tool) {
    var agreementView = DMJS.DMJSView.extend({
        id: 'agreementContent',
        name: 'agreementContent',
        tagName: 'div',
        className: "agreementContent",
        events: {
           'tap #hasRead':'hasRead'//已阅读并同意
        },
        init: function(options) {
            var self = this;
            _.extend(self, options);
        },
        render: function() {
            var self = this;
            this.noDestroy=false;
            var imgUrl = "$1"+Config.url("imgAddress");
            self.data.centent[0].protocolContent=self.data.centent[0].protocolContent.replace(/\<a\s/g,'<a style="color:blue;" ').replace(/(<img[^>]*?src="(?!http))/g,imgUrl);
            self.$el.html(_.template(agreementTemplate,self.data));
            DMJS.CommonTools.imgDown.apply(self,[$('img')]);          	
            return this;
        },
        initType:function(callback){
        	var self=this;
        	self.controller.commonModel.initType({'data':{type:self.data.type},'cancelLightbox':false,
			"noCache":true,
			"success":function(response){
				callback.apply(self,[response.data]);
			},
			'error':function(response){console.log(response);}
        	});
        	
        },
        hasRead:function(e){
        	tool._Navi_default('user/personal/userCenter');
        },
       
    });
    return agreementView;
});
