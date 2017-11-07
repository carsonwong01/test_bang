/**
 * 后台-财务管理-退款管理-订单退款失败
 * 
 */
var searchRefundFailedList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 订单退款失败列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchRefundFailedListForm",
					"serialize" : true,
					"url" : "finance/searchRefundFailedListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchRefundFailedListD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].refundTypeName = {};
						list[index].refundTypeName = searchRefundFailedList.enums.refundType[list[index]["refundType"]];
						list[index].supportSourceName = {};
						list[index].supportSourceName = searchRefundFailedList.enums.supportSource[list[index]["supportSource"]];
					}
				}
				// 填充数据
				$('#searchRefundFailedListTemp').tmpl(data).appendTo("#searchRefundFailedListD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchRefundFailedListTag",
					"formId" : "searchRefundFailedListForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchRefundFailedListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			//退款操作
			refundOperation:function(id){
				DM.ajax({
					url:"finance/refundOperation.do",
					data:{id:id},
					success:function(data){
						if(data.code=="000000"){
							 Dialog.confirm(data.description,{
								    title:"提示信息",
								    sureName:"确定",
								    showClose: false ,
								    showCancel:false,
								    picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
								    callBack:function(){
								        //回调函数
								    	searchRefundFailedList.loadRecord();
								    }
							});
						}else{
							  Dialog.show(data.description,"error");
						}
					},
					error:function(data){
						 Dialog.show("系统异常","error");
					}
				});
		},
			enums : {
				refundType : {
				    "1" : "项目删除退款",	
					"2" : "众筹失败退款",
					"3" : "项目超额溢出退款",
					"4" : "回报不足溢出退款",
					"5" : "项目删除溢出退款",
					"6" : "众筹失败溢出退款"
		        },
		        supportSource : {
		        	"300" : "京东支付",
				    "200" : "微信支付",
					"100" : "通联支付"
		        }
		      },
		});

//实例化控制器
var searchRefundFailedList = new searchRefundFailedList();
// 页面加载时调用
DM.Page.ready({
	"支付记录监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchRefundFailedList.loadRecord();
		});
		searchRefundFailedList.loadRecord();
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchRefundFailedListForm",
				"fileName" : "订单退款失败.xls",
				"url" : "finance/searchRefundFailedListExport.do"
			});
		});
	}
});