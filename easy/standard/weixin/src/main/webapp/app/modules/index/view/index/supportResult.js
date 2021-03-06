define([ 'text!indexTemplate/supportResult.html',
		'commonTool/validator','Lib/native/weixin',"Lib/share/jquery.share.min"], function(supportResultTemplate,Validator,wx,share) {
	var supportResultView = DMJS.DMJSView.extend({
		id : 'supportResultContent',
		name : 'supportResultContent',
		tagName : 'div',
		className : "bg-c-white",
		events : {
			"tap .h5-share-weibo":"shareWeibo",//微博分享
            "tap .h5-share-qq":"shareQQ",//qq分享
            "tap .h5-share-qqzone":"shareQqzone",//空间分享
            "tap .h5-share-weixin":"shareWexin",//微信分享
            "tap .wxBg":"removeWxBg",
		},
		init : function(options) {
			_.extend(this, options);
		},
		data:{
			userId:'',
			proData:{},
		},
		render : function() {
			var self = this;
			DMJS.CommonTools.wxConfig(self.orderData.projectId);
			self.$el.html(_.template(supportResultTemplate, self)); // 将tpl中的内容写入到
			self.loadScroller();
			self.loadOrderDetail();
			self.loadProDetialsDatas();
			return this;
		},
		loadOrderDetail:function(){//
			var self = this;
			self.controller.userModel.supportDetail({ //订单详情
				'data': {
					"orderId":self.orderid,//订单id
				 },
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
						self.data = response.data.singleResult;
				}
					
			});
		},
		loadProDetialsDatas:function(){
			var self = this;
			if(DMJS.userInfo){
				self.data.userId = DMJS.userInfo.userId;
			}
			self.controller.startModel.projectDetailsCon({ //获取项目详情内容
				'data': {
					projectId:self.data.projectId,  
				    projectNo:"",
				    userId:self.data.userId,
				},
				'cancelLightbox': true,
				"noCache": true,
				"success": function(response) {
					self.data.proData.proDetList = response.data.singleResult;
					if(self.data.proData.proDetList.coverImgUrl){//分享图片
						var shareImages = Config.url('imgAddress')+self.data.proData.proDetList.coverImgUrl;
					}
					if(self.data.proData.proDetList.title){//分享标题
						var shareTitle = self.data.proData.proDetList.title;
					}
					if(self.data.proData.proDetList.projectIntro){//分享描述
						var shareDes = self.data.proData.proDetList.projectIntro;
					}
					var url = window.location.origin+window.location.pathname+"#"+"index/index/projectDetails/"+self.data.projectId;
					jQuery('#shareComponent').share(
							{
								url:url, // 网址，默认使用 window.location.href
								source:'', // 来源（QQ空间会用到）, 默认读取head标签：<meta name="site" content="http://overtrue" />
								title:shareTitle, // 标题，默认读取 document.title 或者 <meta name="title" content="share.js" />
								description:shareDes, // 描述, 默认读取head标签：<meta name="description" content="PHP弱类型的实现原理分析" />
								image:shareImages, // 图片, 默认取网页中第一个img标签
								sites:['weibo','qq','qzone'], // 启用的站点
							}
						);
				 }
			});
	    },
		shareWeibo:function(e){
			var self = this;
			var href = $(".icon-weibo").attr("href");
			window.open(href,"_self");
		},
		shareQQ:function(e){
			var self = this;
			var href = $(".icon-qq").attr("href");
			window.open(href,"_self");
		},
		shareQqzone:function(e){
			var self = this;
			var href = $(".icon-qzone").attr("href");
			window.open(href,"_self");
		},
		shareWexin:function(e){
			var self = this;
			$('.wxBg').css('display','block');
		},
		removeWxBg:function(e){
			var self = this;
			$('.wxBg').css('display','none');
		},
	});

	return supportResultView;
});
