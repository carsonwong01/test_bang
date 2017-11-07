/**
 * 控制器
 * 
 */
var AboutUsFooterMenu=DM.Controller.sub({

    /*
     *  记录列表 
     */
    loadRecord:function(){
    	//查询数据
    	DM.ajax({"formId":null,"async":false,"serialize":true,"url":"home/queryAboutUsLeftMenu.do","success":this.pageCallBack});
    },
    
    aboutUsTypeFooterClick:function(doc){
    	var _self = doc;
    	if(_self && _self!=undefined){
    		var type = _self.attr("type");
        	var title = _self.attr("title");
        	$('#type').val(type);
        	$('#title').val(title);
    	}
    	$('#aboutUsTypeFooterForm').submit();
    },
    aboutUsTypeFooterClickFooter:function(){
    	this.loadRecord();
    	this.aboutUsTypeFooterClick();
    },
    /*
     * 分页回调
     */
    pageCallBack:function(data){
    	 var types="";
    	 var title="";
		   for(var j=0;j<data.list.length;j++){
			   var p=data.list[j];
			   if(p.status=='1'){
				   types=p.type;
				   title=p.title;
				   break;
			   }
		   }
		   $('#type').val(types);
		   $('#title').val(title);
		   $("#cur_"+types+"").addClass("active").siblings("li").removeClass("active");
		   //$("#aboutUsTypeFooter").attr("action","home/aboutUs.do");
 		//清空表格数据
 		$("#aboutUsFooterMenu").empty();
 		//填充数据
		 $('#aboutUsFooterMenuTemple').tmpl(data).appendTo("#aboutUsFooterMenu");
 	},
 	
 	goHelpCenter:function(type){
 		$("#typeHelpCenter").val(type);
 		$("#formSubmit").submit();
 	}
 	
});   

var controller=new AboutUsFooterMenu();
//页面加载时调用
DM.Page.ready({
	"事件监控":function(){
		//初始化查询
		//controller.loadRecord();
		
	}
});


