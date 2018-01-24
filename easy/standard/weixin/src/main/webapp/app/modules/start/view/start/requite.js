define([ 'text!startTemplate/requite.html',
		'commonTool/validator','commonTool/tool'], function(requiteTemplate,Validator,tool) {
	var requiteView = DMJS.DMJSView.extend({
		id : 'requiteDiv',
		name : 'requiteDiv',
		tagName : 'div',
		className : "",
		events : {
			"change .Upload" : "setImgUrl",
			"tap .LookImg" : "LookImg",//查看图
			'input input[name="supportAmount"]':'calculateFees',
			'input input[name="upperCount"]':'calculateUpperCount',
		},
		data:{
			returnImg:{
				files:[],
				filesUrl:[]
			},//回报图片
			i:0,
		},
		init : function(options) {
			var self = this;
			_.extend(this, options);
			self.data.returnImg = {
					files:[],
					filesUrl:[]
				};//回报图片
		},
		render : function() {
			var self = this;
//			DMJS.CommonTools.replaceCoBack("start/start/start");
			if(!DMJS.returnList){//没有回报对象直接返回
				tool._Navi_default('start/start/toStart/2');
			}
			if(self.returnId){
				for(var i=0 ; i < DMJS.returnList.length;i++){
					if(self.returnId == DMJS.returnList[i].id){
						self.data = DMJS.returnList[i];
						self.data.i = i;
					}
				}
			}
			this.$el.html(_.template(requiteTemplate, self)); // 将tpl中的内容写入到
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
		calculateUpperCount:function(e){//校正输入金额
			var self = this,amount;
			var __val=$(e.target).val();
			amount=__val.replace(/[^\d]/g,"");
			$(e.target).val(amount);
			
		},
		returnList:function(){//返回添加回报
			var self = this;
			if(!Validator.check($("#"+self.id))){return false}
			if(self.data.returnImg.files.length < 1){
				DMJS.CommonTools.alertCommon(Config.lang("alertCommonTitle"), "请上传相关照片");
				return false;
			}
			if(!DMJS.returnList){
				tool._Navi_default('start/start/toStart/2');
			}
			
			var params = _.extend(self.$el.getFormValue(), self.data);
			if(self.returnId){
				params = self.$el.getFormValue();
				_.extend(DMJS.returnList[self.data.i], params);
			}else{
				params["id"]="rId_"+DMJS.returnList.length;
				DMJS.returnList.push(params);
			}
			tool._Navi_default('start/start/toStart/2');
			
		},
		setImgUrl : function(e){
			var self = this;
			self.data.returnImg = DMJS.CommonTools.setImgUrl(e,self.data.returnImg,1,"","delIdCardImg");
			self.loadScroller();
		},
        //删除图片
		delIdCardImg :function(e){
        	var self = this;
        	var  $uploadImg = $(e).parent().parent().find("#uploadImg");
        	DMJS.CommonTools.delImg(e,self.data.returnImg);
        	if($uploadImg.hasClass("uhide")){//如果上传图片框被隐藏则显示
        		$uploadImg.removeClass("uhide");
        	}
        	
        },
        LookImg:function(e){//查看大图
        	var self = this;
        	var imgUrls = [];
        	if(!$(e.target).hasClass("LookImg")){
        		return false;
        	}
        	var beginUrl = $(e.target).css("background-image");
        	for(var i=0 ; i<self.data.returnImg.filesUrl.length;i++){
	        	imgUrls.push(self.data.returnImg.filesUrl[i]);
        	}
        	DMJS.CommonTools.lookBigPicture(beginUrl,imgUrls);
        },
        delRetuan:function(){//删除回报
        	var self = this;
			DMJS.returnList.splice(self.data.i, 1);
			tool._Navi_default('start/start/toStart/2');
		}
	});

	return requiteView;
});
