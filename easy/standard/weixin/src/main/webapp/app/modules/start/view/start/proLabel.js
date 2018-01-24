define([ 'text!startTemplate/proLabel.html',
		'commonTool/validator','commonTool/tool'], function(proLabelTemplate,Validator,tool) {
	var proLabelView = DMJS.DMJSView.extend({
		id : 'proLabelContent',
		name : 'proLabelContent',
		tagName : 'div',
		className : "bg-c-white",
		events : {
			"tap .Select>li>span":"selLabel",
		},
		data : {
			selLabel:[],//选择标签顺序
		},
		init : function(options) {
			_.extend(this, options);
		},
		render : function() {
			var self = this;
			DMJS.CommonTools.replaceCoBack("start/start/start");
			self.controller.startModel.findLabels({
				"data" : {projectType:self.type=="2"?"1":"2"},'cancelLightbox':true,
				"success" : function(response) {
					if(DMJS.proLabel.length > 0){//之前选择过标签
						for(var i in response.data.list){
							for(var j in DMJS.proLabel){
								if(response.data.list[i].labelName == DMJS.proLabel[j]){
									response.data.list[i].selected = true;
								}
							}
						}
					}
					self.$el.html(_.template(proLabelTemplate, response.data)); // 将tpl中的内容写入到
					self.loadScroller();
				},
			});
			return this;
		},
		selLabel : function(e){//选择标签
			var self = this,
			$dom = $(e.target),
			index = $("ul").children().index($dom.parent()),//标签顺序
			domText = $dom.text();//标签名
			if($dom.hasClass("sel-label")){
				$dom.removeClass("sel-label");
				for(var i =0;i<DMJS.proLabel.length;i++){
					if(DMJS.proLabel[i]==domText){
						DMJS.proLabel.splice(i,1);//删除选中标签
						self.data.selLabel.splice(i,1);
					}
				}
			}else{
				$dom.addClass("sel-label");
				DMJS.proLabel.push(domText);
				self.data.selLabel.push(index);//记录标签在页面索引
				if(DMJS.proLabel.length > 2){
					DMJS.proLabel.splice(0,1);//删除第一个标签
					$($("li")[self.data.selLabel.splice(0,1)]).children().removeClass("sel-label");//移除样式
				}
			}
		},
		confirmLab:function(){//确认标签
			var self = this;
			if(DMJS.proLabel.length > 0){//
				tool._Navi_default('start/start/toStart/2');
			}else{
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "最少选择一个标签！");
			}
		},
	});

	return proLabelView;
});
