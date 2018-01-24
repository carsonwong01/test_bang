define(['text!commonTemplate/bshare.html','commonTool/tool'
], function(bshareTemplate, tool) {
    var bshareView = DMJS.DMJSView.extend({
        id: 'bshareContent',
        name: 'bshareContent',
        tagName: 'div',
        className: "bshareContent",
        events: {
        
        },
        init: function(options) {
            var self = this;
            _.extend(self, options);
        },
        render: function() {
            var self = this,js4,js5;
            this.noDestroy=false;
            js4 = document.createElement('script');
									js4.src = "http://static.bshare.cn/b/buttonLite.js#style=-1";
									document.body.appendChild(js4);
									js4.onload = function() {
									     js5 = document.createElement('script');
										js5.src = "http://static.bshare.cn/b/bshareC2P.js";
										document.body.appendChild(js5);	
									}
          self.$el.html(_.template(bshareTemplate));
            return this;
        },
     
    });
    return bshareView;
});

