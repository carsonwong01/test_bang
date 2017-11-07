/*首页导航 选中状态*/
$("#HEADER_MENUS>li").removeClass("cur");
$("#HEADER_MENUS>li:eq(0)").addClass("cur");

//首页控制器
var HomePageController=DM.Controller.sub({
	//初始化事件
	init:function(){
		this.getHomePageBody();
		this.linkClick();
	},
	//链接点击事件
	linkClick:function(){
		var _self=this;
		$("#newInfos_more").click(function(){
			var type=_self.getLinkType();
			 if(type=="three1"){//跳转平台公告
				 window.location.href=basePath+"home/newsInfos.html?investmentInfoType=1";
			 }else{//跳转新闻资讯
				 window.location.href=basePath+"home/newsInfos.html?investmentInfoType=2";
			 }
		});
	},
	//获取链接类型
	getLinkType:function(){
		var type="three1";//平台公告
		$(".home_newInfos").each(function(){
			if($(this).hasClass("hover")){
				type=$(this).attr("id");
			}
		});
		return type;
	},
	//点击项目进入项目详情
	projectClick:function(projectId){ 
		//跳转项目详情
		window.location.href = basePath+"project/projectDetails.do?projectId=" + projectId;
	},
	//加载首页数据（广告图片、平台优势、热门项目等等）
	getHomePageBody:function(){ 
		DM.ajax({
			url:"frontHome/homePageBody.do",
			data:{},
			success:function(data){
				$("#homeContent").empty();
				$("#homeContentTmpl").tmpl(data).appendTo($("#homeContent"));
			},
			error:function(data){
				 Dialog.show("系统异常，请联系管理员","error");
			}
		});

		
	}
});

var homePageController=new HomePageController();
