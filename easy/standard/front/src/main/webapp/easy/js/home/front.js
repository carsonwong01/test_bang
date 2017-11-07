$(function(){
	//产品列表筛选
	$(".xm-leixing-con a").click(function(){
		$(this).addClass("cur").siblings("a").removeClass("cur");
		var next_dl=$(this).parents("dl").next(".sub-dl");	
		if(next_dl.length>0)
		{
			next_dl.slideDown(400);
		}
		else
		{
			next_dl.slideUp(400);
		}
	});
	
	/*项目详情切换*/
	toggleTab('.p-detail .control','.p-tabCont .list');



	//发起项目按钮效果
	var makeProjectBtn = $('.makeProject .control em').eq(0);
	makeProjectBtn.click(function() {
		var self = $(this);
		if(!self.hasClass('active')){
			self.addClass('active');
			$('.makeProject .friendly').slideDown();
		}
	
	});
	
});