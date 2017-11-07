/**
 * 在线用户统计控制器
 */
var StatisticsRecord = DM.Controller.sub({
	init : function() {
	},
	/*
	 * 查询在线用户统计记录列表
	 */
	loadRecord : function() {
		// 查询数据
		DM.ajax({
			"formId" : "form",
			"serialize" : true,
			"url" : "statistics/userOnlineStatisticsAjax.do",
			"success" : this.pageCallBack
		});
	},
	/*
	 * 分页回调
	 */
	pageCallBack : function(data) {
		var categoriesData = null;
		var datas = null;
		if (data.singleResult) {
			categoriesData = data.singleResult.categorieData;
			datas = data.singleResult.series;
		} else {
			categoriesData = [ "0", "1", "2", "3", "4", "5", "6", "7", "8",
					"9", "10", "11", "12", "13", "14", "15", "16", "17", "18",
					"19", "20", "21", "22", "23", "24" ];
			datas = [
					{
						"data" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
								0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
						"name" : "在线人数"
					},
					{
						"data" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
								0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
						"name" : "登录人数"
					} ];
		}
		// 清空表格数据
		$("#line").empty();
		var dateTime = $("[name=startTime]").val() || getDateTime();

		$("[name=startTime]").val(dateTime);
		/*
		 * var categories1 =
		 * ['0:00时','1:00时','2:00时','3:00时','4:00时','5:00时','6:00时','7:00时','8:00时','9:00时','10:00时','11:00时','12:00时','13:00时','14:00时','15:00时','16:00时','17:00时','18:00时','19:00时','20:00时','21:00时','22:00时','23:00时'];
		 */
		/* var categories1 = data.singleResult.categorieData; */
		var categories1 = categoriesData;
		/*
		 * var data1 = [{name: '在线用户数',data: data.online}, {name: '登录用户数',data:
		 * data.login}];
		 */
		/* var data1 = data.singleResult.series; */
		var data1 = datas;

		$('#line').highcharts({
			title : {
				text : '<strong>' + dateTime + '用户统计曲线图</strong>'
			},
			colors : [ '#336699', '#CC6666' ],
			chart : {
				type : 'spline'
			},
			exporting : {
				enabled : true,
				url : basePath + 'exportImg.do'
			},
			yAxis : {
				min : 0,
				title : {
					text : '单位：人'
				},
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080'
				} ]
			},
			xAxis : {
				title : {
					text : '单位：时'
				},
				categories : categories1,
				labels : {
					rotation : -45
				}

			},
			credits : {
				enabled : false
			},
			legend : {
				enabled : true
			},

			series : data1
		});

	},
	/*
	 * 枚举字段
	 */
	rechargeType : {
		"1" : ""
	}
});

// 页面加载时调用
DM.Page.ready({
	"在线用户统计事件监控" : function() {
		// 实例化控制器
		var controller = new StatisticsRecord();
		// 绑定
		// 初始化查询
		controller.loadRecord();
		// 绑定查询事件
		$("#searchStatistics").bind("click", function() {
			controller.loadRecord();
		});
		/*
		 * //绑定导出事件 $("#exportStatistics").bind("click",function(){
		 * controller.loadRecord(); });
		 */
	}
});

function getDateTime() {
	var now = new Date();
	return (now.getFullYear() + "-" + ((now.getMonth() + 1) < 10 ? "0" : "")
			+ (now.getMonth() + 1) + "-" + (now.getDate() < 10 ? "0" : "") + now
			.getDate());
}