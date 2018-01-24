define([ 'text!userTemplate/personal/cashPostDetails.html'], function(cashPostDetails) {
	var cashPostDetailsView = DMJS.DMJSView.extend({
		id : 'cashPostDetailsView',
		name : 'cashPostDetailsView',
		tagName : 'div',
		className : "",
		events : {
		    
		},
		data:{
			cashData:{
				tradeAmount:"",
				tradeType:"",
				dateCreate:""
			}
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			self.data.cashData.tradeAmount = self.tradeAmount;
			self.data.cashData.tradeType = self.tradeType;
			self.data.cashData.dateCreate = DMJS.formatDate(new Date(parseInt(self.dateCreate)));
			
			self.$el.html(_.template(cashPostDetails,self.data.cashData)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		
			
	});
		
	return cashPostDetailsView;
});