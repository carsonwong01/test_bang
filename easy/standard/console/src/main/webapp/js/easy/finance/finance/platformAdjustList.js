/**
 * 后台-财务管理-账务管理-平台调账管理
 * 
 */
var searchPlatformAdjustList = DM.Controller.sub({
    /*
     *  查询平台调账管理列表 
     */
    loadRecord:function(){
    	//查询数据
    	DM.ajax({
    		"formId":"searchPlatformAdjustListForm",
    		"serialize":true,
    		"url":"finance/searchPlatformAdjustListAjax.do",
    		"success":this.pageCallBack
    		});
    },
    /*
     * 分页回调
     */
    pageCallBack:function(data){
 		 //清空表格数据
 		 $("#searchPlatformAdjustListD").empty();
 		//填充数据
		 $('#searchPlatformAdjustListTemp').tmpl(data).appendTo("#searchPlatformAdjustListD");
		 //第一次进页面刷新累计数据
		 var type = $("input[name='type']").val();
		 if(type == 1)
    	 {
			 $("#statU").empty();
			 $('#statTemp').tmpl(data).appendTo("#statU");
			 $("input[name='type']").val("");
    	 }
		//初始化分页标签
		DM.PageTags.init({
			"divId":"searchPlatformAdjustListTag",
			"formId":"searchPlatformAdjustListForm",
			"curPage":data.pageResult.pageIndex,
			"totalCount":data.pageResult.recordCount,
			"pageCount":data.pageResult.pageTotal,
			"url":"finance/searchPlatformAdjustListAjax.do",
			"toPageCallBack":arguments.callee
	   });
 	},	
 	//调账弹出款
 	adjustDialog:function(){  
		 var _self=this;
		 var tmpl=$('#adjustTmpl').tmpl().html();
		 Dialog.showDialog({
			    title:"调账",
			    msg:tmpl,
			    dialogWidth:"630px",
			    dialogHeight:"370px",
			    buttons:{
				    "确定":function(){
				    	if(dmCheck.check("#adjustTmplForm")){
				    		var tradeType=$("input[name='tradeType']:checked").val();//调账方式
				    		var adjustAmount=$("#adjustAmount").val();//调账金额
				    		var remark=$("#remarkId").val();//备注
				    		Dialog.close();
				    		//tradeType:调账方式   adjustAmount:调账金额    remark:备注
				    	    _self.adjustConfirmDialog(tradeType,adjustAmount,remark);//调账确认弹出款
				    	}
				     },
				    "取消":function(){
				    	Dialog.close();
				    }
			    }
	     });
		 //表单非空初始化
		 dmCheck.init("#adjustTmplForm");
	}, 
	//调账确认弹出款
	adjustConfirmDialog:function(tradeType,adjustAmount,remark){  
		    var _self=this;
		    var typeName="";
		    //判断显示标题
		    if(tradeType=="1"){
		    	typeName= "收入调账";
		    }else{
		    	typeName="支出调账";
		    }
		     //tradeType:调账方式   adjustAmount:调账金额    remark:备注     type:1、项目调账  2、平台调账
			 var tmpl=$('#adjustConfirmTmpl').tmpl({tradeType:typeName,adjustAmount:adjustAmount,remark:remark}).html();
			 Dialog.showDialog({
				    title:"调账",
				    msg:tmpl,
				    dialogWidth:"600px",
				    dialogHeight:"auto",
				    buttons:{
					    "确定":function(){
					    	//调账处理
					    	_self.adjustAddAjax(tradeType,adjustAmount,remark);
					     },
					    "取消":function(){
					    	Dialog.close();
					    }
				    }
		     });
	},
	//新增——调账处理
	adjustAddAjax:function(tradeType,adjustAmount,remark){
		    var msg= "收入调账成功!";
		    if(tradeType=="2"){
		    	msg= "支出调账成功!";
		    }
		    var _self=this;
		    var data={type:tradeType,tiaozhangAmt:adjustAmount,remark:remark};
			DM.ajax({
				url:"finance/tiaoZhangAjax.do",
				data:data,
				success:function(data){
					Dialog.close();
					if(data.code=="000000"){
						 Dialog.confirm(msg,{
							    title:"提示信息",
							    sureName:"确定",
							    showClose: false ,
							    showCancel:false,
							    picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
							    callBack:function(){
							        //回调函数
							    	_self.loadRecord();
							    }
						});
				    //刷新累计数据
				    $("input[name='type']").val("1");
					}else{
						  Dialog.show(data.description,"error");
					}
				},
				error:function(data){
					 Dialog.show("系统异常，请联系管理员","error");
				}
			});
	},
	//查看调账备注内容
	remarkShow : function(id){
		DM.ajax({
			"data" :{'id':id},
			"url" : "finance/searchTiaoZhangRemark.do",
			"success" : function(data){
				if(data && data.code=='000000'){
					var remark;
					if(data.data.singleResult.remark == '')
					{
						remark=" ";
					}else{
						remark= data.data.singleResult.remark;
					}
					Dialog.showDialog({
					    title:"调账备注",
					    msg:remark,
					    dialogHeight:"100px",
					    buttons:{
						    "关闭":function(){
						    	Dialog.close();
						    }
					    }
			        });
				}else{
					 Dialog.confirm(data.description,{
						    title:"提示信息",
						    sureName:"确定",
						    showClose: true,
						    showCancel:false,
						    picClass:"error",
						    isLeftFloating:false,
						    callBack:function(){
						    }
					});
				}
			}
		});
	},

});   

var searchPlatformAdjustList = new searchPlatformAdjustList();
//页面加载时调用
DM.Page.ready({
	"平台调账管理事件监控":function(){
		 //初始化查询
		searchPlatformAdjustList.loadRecord();
		//绑定查询事件
		$("#search").bind("click",function(){
			searchPlatformAdjustList.loadRecord();
		});
		
		//绑定调账事件
		$("#adjust").bind("click",function(){
			searchPlatformAdjustList.adjustDialog();
		});
		
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchPlatformAdjustListForm",
				"fileName" : "平台调账管理列表.xls",
				"url" : "finance/searchPlatformAdjustListExport.do"
			});
		});
	}
});
