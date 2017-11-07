/**
 * 个人中心控制器js
 * wuxiao
 */

var AboutUsControler=DM.constructor.sub({
	
	getAboutUsList:function(){
		 var _self=this;
	     var type = $("#types").val();
		 DM.ajax({
			 url:"home/aboutUsAjax.do",
			 data:{type:type},
		     success:function(data){
		    		_self.setAboutUsList(data);	
		     },
		     error:function(data){
		     }
		 });
   },
   setAboutUsList:function(data){ 
		  $("#cur_"+data.type+"").addClass("active").siblings("li").removeClass("active");
	  /*    $("#aboutUsLeftMenu li:first-child").addClass("cur");*/
	      var _self=this;
		  $("#aboutUsId").empty();
		  //填充数据
		  $('#aboutUsTemplate').tmpl(data.pageResult).appendTo("#aboutUsId");
		  $("#spanId").text(data.pageResult.list[0].title);		//标题
		  $("#divTitleId").text(data.pageResult.list[0].title);		//标题
	}
});

var controler=new AboutUsControler();
//页面加载时调用
DM.Page.ready({
	"关于我们":function(){
	    controler.getAboutUsList();
	}
});


/**
 * Created by faith on 2016/3/8.
 */
$(document).ready(function(){
  //  var navH = $(".sidemenu").offset().top; //获取要定位元素距离浏览器顶部的距离
    //滚动条事件
//    $(window).scroll(function(){
//        var scrollH = $(this).scrollTop();
//        if(scrollH >= navH){
//            $(".sidemenu").css({"position":"fixed","z-index":"999","top":0});
//        }else{
//            $(".sidemenu").css({"position":"static"});
//        }
//    });
});

