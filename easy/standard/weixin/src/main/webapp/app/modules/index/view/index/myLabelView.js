define([ 'text!indexTemplate/myLabel.html',
         'text!indexTemplate/labels.html',
         'text!indexTemplate/choiceLabels.html',
         ], function(myLabel,labels,choiceLabels) {
	var myLabelView = DMJS.DMJSView.extend({
		id : 'myLabelContent',
		name : 'myLabelContent',
		tagName : 'div',
		className : "",
		events : {
			'tap .label-tab-tap': 'lableTabAction',
			'tap #currLabelItem': 'getUpLabels',
			'tap #newLabelItem': 'cleanDownLabels',
		},
		init : function(options) {
			var self = this;
			self.projectType = "1"//默认为回报项目,1回报项目,2梦想项目	
			_.extend(this, options);
			DMJS.localStorage = [];
		},
		data:{
			storageList:[],//存放选择的标签数据
			currLabelsList:[]//存储当前选中的标签id
		},
		render : function() {
			var self = this;
			this.$el.html(_.template(myLabel, self)); // 将tpl中的内容写入到
			self.loadMyLabels();
			self.loadLabels();
			self.loadScroller();
			return this;
		},
		lableTabAction:function(e){ //tags tab切换
			var self = this;
			var $dom=$(e.currentTarget);
			if($dom.hasClass('active')){
				return false;
			}
			$dom.addClass('active').siblings().removeClass('active');
			var index = $dom.index();
			console.log(index);
			self.projectType = parseInt(index+1);//获取对应的类型
			self.loadLabels();//获取对应标签数据
		},
		loadMyLabels:function(){
			var self = this;
			var storage;
			self.data.storageList = [];
			if(window.localStorage){ //是否支持localStorage
				storage = window.localStorage;
				for(var i=0;i<storage.length;i++){
	                var key=storage.key(i);
	                if(key!="loginBackUrl"){
	                	var json=storage.getItem(key);
	                	if(json.indexOf("|")==-1){
			                var jsonObj=JSON.parse(json);//将字符串转为json
				            self.data.storageList.push(jsonObj);
	                	}
	                }
	            }
				$('#newLabelList').html(_.template(choiceLabels,self.data));//填充localStorage的数据
				DMJS.localStorage = self.data.storageList;//存储在全局变量
				self.data.currLabelsList = self.data.storageList;
				//window.localStorage.clear();//清楚所有的localStorage
			} 
		},
		loadLabels:function(){ //加载系统对应标签
			var self = this;
			self.controller.indexModel.findLabels({
				"data":{
					projectType:self.projectType
				},
				"noCache": true,
				"cancelLightbox": true,
				"success": function(response) {
					if(response.code == "000000"){
						//已经添加为我的标签的就不再显示在更多标签
						if(window.localStorage){
							if(self.data.storageList.length > 0 && response.data.list.length > 0){
								for(var i = 0;i<self.data.storageList.length;i++){
									for(var j = 0;j<response.data.list.length;j++){
										if(self.data.storageList[i].labelTypeId == response.data.list[j].labelTypeId){
											response.data.list.splice(j,1); 
										}
									}
								}
							}
						}
						
						$('#labelTab').html(_.template(labels,response.data));	
							
					}else{
						DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"),response.description);
					}
				}
			});
		},
		getUpLabels:function(e){ //选择当前到我的标签
			var self = this;
			var $dom = $(e.target);
			if(!$dom.is("#currLabelItem")){
                $dom=$dom.parents("#currLabelItem");
            }
			var labelTypeId = $dom.attr('labeltypeid'); //标签id
			var projecttype = $dom.attr('projecttype'); //项目类型
			var labelname = $dom.attr('labelname'); //标签名
			
			if(self.data.currLabelsList.length < 9){
				if(window.localStorage){ //是否支持localStorage
					var storageData = window.localStorage;
					var labelData = {
							labelTypeId:labelTypeId,
							projecttype:projecttype,
							labelname:labelname
					}
					var labelInfo=JSON.stringify(labelData);//localStorage只支持存储字符串
					storageData.setItem(labelData.labelTypeId,labelInfo);
				}
				$dom.remove();
				self.loadMyLabels();
			}else{
				DMJS.CommonTools.alertCommon("温馨提示", "最多可添加9个标签");
			}
		},
        cleanDownLabels:function(e){ //在我的标签删除
        	var self = this;
			var $dom = $(e.target);
			if(!$dom.is("#newLabelItem")){
                $dom=$dom.parents("#newLabelItem");
            }
			var labelTypeId = $dom.attr('labeltypeid'); //标签id
			var projecttype = $dom.attr('projecttype'); //项目类型
			var labelname = $dom.attr('labelname'); //标签名
			if(window.localStorage){ //是否支持localStorage
				var storageData = window.localStorage;
				if(storageData.length > 0){
					for(var i=0;i<storageData.length;i++){
		                var key=storageData.key(i);
		                if(key == labelTypeId){
		                	storageData.removeItem(key); //删除对应key的标签
		                }
		            }
				}
			}
			$dom.remove();
			if(self.data.storageList.length > 0){
				for(var j=0;j<self.data.storageList.length;j++){
					if(labelTypeId == self.data.storageList[j].labelTypeId){
						self.data.storageList.splice(j,1);//删除当前选中的标签
					}
				}
			}
			DMJS.localStorage = self.data.storageList;//存储在全局变量
			self.loadMyLabels();
			self.loadLabels();
		},
	});
	return myLabelView;
});
