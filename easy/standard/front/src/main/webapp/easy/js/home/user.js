$(function(){
		//左侧菜单展开
   $(".sidemenu .item").click(function(){
		   $(this).parents(".group").siblings(".group").find(".item").siblings("ul").slideUp("slow");
		   if($(this).hasClass("up")){
				$(this).removeClass("up");
				$(this).siblings("ul").slideToggle("slow");
		   }else{
			   $(this).addClass("up");
			   $(this).siblings("ul").slideToggle("slow");
			   $(this).parents(".group").siblings(".group").find(".item").removeClass("up");
		   }
	});

   //删除默认地址
   var delBtn = $('.user-ShippingAddress .del-handle');
   delBtn.click(function(){
   		var that = $(this),
   			father = that.parent(),
   			delbox = father.siblings(),
   			top = father.parent(),
   			prev = top.prev().children(),
   			fasle_btn = delbox.find('.cancle'),
   			width = that.siblings().width();
   		father.hide();
   		prev.css('visibility','hidden');
   		top.addClass('active');
   		fasle_btn.click(function(){
   			top.removeClass('active');
   			setTimeout(function(){
   				father.show();
   				prev.css('visibility','visible');
   			},320);
   			
   		});
   });
	
});


