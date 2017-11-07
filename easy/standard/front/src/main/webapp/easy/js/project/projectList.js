/**
 * 前台-项目列表
 */
var projectList = DM.Controller.sub({
			init : function() {
			},
			/*
			 * 项目列表
			 */
			loadRecord : function() {
				// 查询数据
				DM.ajax({
					"formId" : "projectListForm",
					"serialize" : true,
					"url" : "project/projectListAjax.do",
					"success" : this.pageCallBack
				});
			},
			/*
			 * 分页回调
			 */
			pageCallBack : function(data) {
				// 清空表格数据
				$("#projectListD").empty();
				if (data.projectList.pageResult) {
					var list = data.projectList.pageResult.list;
					for ( var index in list) {
						list[index].tags = {};
						var arr = list[index]["projectTags"];
						var projectTag1 = arr[0];
						var projectTag2 = arr[1];
						if(projectTag2 == undefined)
						{
							projectTags='<a href="javascript:void(0)" onclick="projectList.clickTag(\''+projectTag1+'\')" class="highlight">#'+projectTag1+'</a>';
						}else{
							projectTags='<a href="javascript:void(0)" onclick="projectList.clickTag(\''+projectTag1+'\')" class="highlight">#'+projectTag1+
							'</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="projectList.clickTag(\''+projectTag2+'\')" class="highlight">#'+projectTag2+'</a>';
						}
						list[index].tags = projectTags;
					}
				}
				// 填充数据
				$('#projectListTemp').tmpl(data.projectList).appendTo("#projectListD");
				DM.Event.formatChar();
				// 初始化分页标签
				DM.PageTags.init({
					"divId" : "paging",
					"formId" : "projectListForm",
					"curPage" : data.projectList.pageResult.pageIndex,
					"totalCount" : data.projectList.pageResult.recordCount,
					"pageCount" : data.projectList.pageResult.pageTotal,
					"url" : basePath+"project/projectListAjax.do",
					"toPageCallBack" : arguments.callee
				});
			},
			/**
			  * 项目状态查询
			  */
			typeQuery:function(_self,val){
				$("#projectType").val(val);
				$("#typeDD a").removeClass("cur");
				$("#sortDD a").removeClass();//清空箭头选中和排序样式变成默认
				$("#sortDD a:first").addClass("cur");
				$("#sortDD a").children().attr('class','down');
				$("#sorting").val("");//不排序
				$("#order").val("");//不排序
				$(_self).addClass("cur");
				this.loadRecord();
			 },
			 /**
			  * 项目标签类型查询
			  */
			 tagTypeQuery:function(_self,val){
					$("#tagType").val(val);
					$("#tagTypeDD a").removeClass("cur");
					$("#sortDD a").removeClass();//清空箭头选中和排序样式变成默认
					$("#sortDD a:first").addClass("cur");
					$("#sortDD a").children().attr('class','down');
					$("#sorting").val("");//不排序
					$("#order").val("");//不排序
					$(_self).addClass("cur");
					this.loadRecord();
		     },
		     /**
		      * 列表排序查询
		      */
		     sortQuery:function(_self,val){
					$("#sorting").val(val);
					var className=$(_self).attr('class'); //背景色
					var childrenName=$(_self).children().attr('class'); //箭头
					$("#sortDD a").children().attr('class','down');
					if(null == className || '' == className || 'undefined' == className){
						$("#sortDD a").removeClass();
						$(_self).attr('class','cur');
						$("#order").val('desc');//升序
					}else if('upward' == childrenName){
						$("#sortDD a").removeClass();
						$(_self).attr('class','cur');
						$(_self).children().attr('class','down');//箭头朝下
						$("#order").val('desc');//降序
					}else if('down' == childrenName){
						$("#sortDD a").removeClass();
						$(_self).attr('class','cur');
						$(_self).children().attr('class','upward');//箭头朝上
						$("#order").val('asc');//升序
					}
					this.loadRecord();
		     },
		     //进入项目详情页
		     goProjectDetails:function(projectId){
		    	//跳转项目详情
				window.location.href = basePath+"project/projectDetails.do?projectId=" + projectId;
		     },
		     //点击项目块中的标签
		     clickTag:function(tag){
		    	 $("#typeDD a").removeClass("cur");
		    	 $("#typeDD a:first").addClass("cur");
		    	 $("#projectType").val("");
		    	 
		    	 $("#sortDD a").removeClass();
		    	 $("#sortDD a:first").addClass("cur");
		    	 $("#sortDD a").children().attr('class','down');
		    	 $("#sorting").val("");
		    	 $("#tagTypeDD a").removeClass("cur");
		    	 $("#tagType").val(tag);
		    	 $("#tagTypeDD a").each(function(){
		    		    if($(this).html()==tag){
		    		    	$(this).attr('class','cur');
		    		    }
		    	  });
		    	 this.loadRecord();
		    	 //回到头部
		    	 $("html,body").animate({scrollTop:0}, 500);
		     },
		});

//实例化控制器
var projectList = new projectList();
// 页面加载时调用
DM.Page.ready({
	"监控" : function() {
		projectList.loadRecord();
	}
});