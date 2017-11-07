/**
 * 后台-财务管理-对账管理-支付对账
 * 
 */
var searchPayCheckList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 支付对账列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "searchPayCheckListForm",
					"serialize" : true,
					"url" : "finance/searchPayCheckListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#searchPayCheckListD").empty();
				if (data.pageResult) {
					var list = data.pageResult.list;
					for ( var index in list) {
						list[index].statusName = {};
						list[index].statusName = searchPayCheckList.enums.statusType[list[index]["payCheckStatus"]];
					}
				}
				// 填充数据
				$('#searchPayCheckListTemp').tmpl(data).appendTo("#searchPayCheckListD");
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "searchPayCheckListTag",
					"formId" : "searchPayCheckListForm",
					"curPage" : data.pageResult.pageIndex,
					"totalCount" : data.pageResult.recordCount,
					"pageCount" : data.pageResult.pageTotal,
					"url" : "finance/searchPayCheckListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			//支付对账
			payCheck:function(id){
				DM.ajax({
					url:"finance/payCheck.do",
					data:{id:id},
					success:function(data){
						Dialog.close();
						if(data.code=="000000"){
							 Dialog.confirm(data.description,{
								    title:"提示信息",
								    sureName:"确定",
								    showClose: false ,
								    showCancel:false,
								    picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
								    callBack:function(){
								        //回调函数
								    	searchPayCheckList.loadRecord();
								    }
							});
						}else{
							  Dialog.show(data.description,"error");
						}
					},
					error:function(data){
						 Dialog.show("系统异常，请联系管理员","error");
					}
				});
		},
			enums : {
				statusType : {
				    "1" : "未对账",	
					"2" : "成功",
					"3" : "失败"
		        }
		      },
		});

//实例化控制器
var searchPayCheckList = new searchPayCheckList();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		//绑定查询事件
		$("#search").bind('click',function(){
			searchPayCheckList.loadRecord();
		});
		searchPayCheckList.loadRecord();
		
		//绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "searchPayCheckListForm",
				"fileName" : "支付对账列表.xls",
				"url" : "finance/searchPayCheckListExport.do"
			});
		});
	}
});