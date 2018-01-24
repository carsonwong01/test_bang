define([ 'text!startTemplate/target.html',
		'commonTool/validator','commonTool/tool'], function(targetTemplate,Validator,tool) {
	var targetView = DMJS.DMJSView.extend({
		id : 'targetContent',
		name : 'targetContent',
		tagName : 'div',
		className : "",
		events : {
			'input input[name="supportAmount"]':'calculateFees',
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			i : 0,
		},
		render : function() {
			var self = this;
			DMJS.CommonTools.replaceCoBack("start/start/start");
			if(!DMJS.returnList){//没有回报对象直接返回
				tool._Navi_default('start/start/toStart/3');
			}
			if(self.returnId){
				for(var i=0 ; i < DMJS.returnList.length;i++){
					if(self.returnId == DMJS.returnList[i].id){
						self.data = DMJS.returnList[i];
						self.data.i = i;
					}
				}
			}
			this.$el.html(_.template(targetTemplate, self)); // 将tpl中的内容写入到
			self.loadScroller();
			return this;
		},
		calculateFees:function(e){//校正输入金额
			var self = this,amount;
			var __val=$(e.target).val();
			amount=__val.replace(/[^\d\.]/g,"");
			amount=amount*1;
			$(e.target).val(amount);
			
		},
		returnList:function(){//返回信息
			var self = this;
			if(!Validator.check($("#"+self.id))){return false}
			if(!DMJS.returnList){
				tool._Navi_default('start/start/toStart/3');
			}
			var params = _.extend(self.$el.getFormValue(), self.data);
			if(self.returnId){
				params = self.$el.getFormValue();
				params['rId'] = self.returnId;
				DMJS.returnList[self.data.i] = params;
			}else{
				params["rId"]="rId_"+DMJS.returnList.length;
				DMJS.returnList.push(params);
			}
			tool._Navi_default('start/start/toStart/3');
		},
		delRetuan:function(){//删除目标
			var self = this;
			DMJS.returnList.splice(self.data.i, 1);
			tool._Navi_default('start/start/toStart/3');
		}
	});

	return targetView;
});
