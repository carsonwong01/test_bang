/**
 * 控制器
 * 
 */
var AboutUsLeftMenu=DM.Controller.sub({

    /*
     *  记录列表 
     */
    loadRecordLeft:function(){
    	//查询数据
    	DM.ajax({"formId":null,"serialize":true,"url":"home/queryAboutUsLeftMenu.do","success":this.pageCallBack});
    },
    
    /*
     * 分页回调
     */
    pageCallBack:function(data){
    	var review=$("#review").val();
 		//清空表格数据
 		$("#aboutUsLeftMenu").empty();
 		//填充数据
		 $('#aboutUsLeftMenuTemple').tmpl({object:data.list,review:review}).appendTo("#aboutUsLeftMenu");
 	},
 	  aboutUsTypeFooterClick:function(type){
 	    	var _self = this;
 	    	DM.ajax({
 				 url:"home/aboutUsAjax.do",
 				 data:{type:type},
 			     success:function(data){
 			    		_self.setAboutUsLists(data);	
 			     },
 			     error:function(data){
 			     }
 			 });	
 	    
 	    },
 	    
 	   setAboutUsLists:function(data){
	   		  $("#cur_"+data.type+"").addClass("active").siblings("li").removeClass("active");
		      var _self=this;
 			  $("#aboutUsId").empty();
 			  //填充数据
 			  $('#aboutUsTemplate').tmpl(data.pageResult).appendTo("#aboutUsId");
 			  $("#spanId").text(data.pageResult.list[0].title);		//标题
 			  $("#divTitleId").text(data.pageResult.list[0].title);		//标题
 	}
});   

var aboutUsLeftMenu=new AboutUsLeftMenu();
//页面加载时调用
DM.Page.ready({
	"事件监控":function(){
		//初始化查询
		aboutUsLeftMenu.loadRecordLeft();
	}
});


