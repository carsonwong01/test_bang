<!--运营管理->意见反馈-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
 <!-- 搜索框 -->
	<form action="feedbackListAjax.do" method="post" id="feedbackForm">
  <div class="border">
   
		<div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>意见反馈</div>
	    <div class="content-container pl40 pt30 pr40">
	      <ul class="gray6 input-list-container clearfix">
	        <li><span class="display-ib mr5">反馈人</span>
	        <input type="text" class="text border pl5 mr20" name="userName" value="" />
	        </li>
	        <li><span class="display-ib mr5">昵称</span>
	          <input type="text" class="text border pl5 mr20" name="nickName" value="" />
	        </li>
	       <li><span class="display-ib mr5">提交时间</span> 
	          <input class="text border pl5 w120 date" name="startTime" id="startTime" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})"   type="text"> 
	          <span class="pl5 pr5">至</span> 
	          <input class="text border pl5 w120 mr20 date" name="endTime" id="endTime" onclick="WdatePicker({minDate: '#F{$dp.$D(\'startTime\')}'})"  type="text"> 
	       </li>
	        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="feedbackController.getProjectList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
	        <li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="export"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
	      </ul>
	    </div>
  </div>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc">序号</th>
          <th>反馈人</th>
          <th>昵称</th>
          <th>邮箱地址</th>
          <th>反馈意见</th>
          <th>提交时间</th> 
        </tr>
      </thead>
      <!-- List -->
      <tbody class="f12" id="feedbackListData"></tbody>
    </table>
  </div>
  
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="userName">反馈人</th>
          <th exp-name="nickName">昵称</th>
          <th exp-name="contactEmail">邮箱地址</th>
          <th exp-name="feedbackDetails">反馈意见</th>
          <th exp-name="dateCommit">提交时间</th> 
        </tr>
      </thead>
    </table>
  
  <!--分页-->
  <div class="paging clearfix pt20" id="paging"></div>
  <!--分页 end--> 
   </form>
</div>
 
<!--  {{if index %2 == 0}}class="tr-even" {{/if}} {{each(index) list}}{{/each}}-->
<script id="feedbackListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
      <tr>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.userName}}</td>
          <td>{{= data.nickName}}</td>
          <td>{{= data.contactEmail}}</td>
 		  <td style="max-width: 200px;white-space: initial;line-height: 20px;text-align: left;">{{= data.feedbackDetails}}</td>
          <td>{{= data.dateCommit}}</td>
     </tr>
{{/each}}
</script>

<script>
dmCheck.init("#feedbackForm");
var FeedbackController=DM.Controller.sub({
	 getProjectList:function(){
		if(!dmCheck.check("#feedbackForm")){ 
			return false;
        }
	    var _self=this;
		DM.ajax({
			url:"operations/feedbackListAjax.do",
			data:$("#feedbackForm").serialize(),
			success:function(data){
				if(data.code=="000000"){
					_self.setProjectList(data.data);		
				}
			},
			error:function(data){
				 Dialog.show("系统异常，请联系管理员","error");
			}
		});
	},
	setProjectList:function(data){
		var _self=this;
          $("#feedbackListData").empty();
		  //填充数据
		  $('#feedbackListTemp').tmpl(data.pageResult).appendTo("#feedbackListData");
		  //初始化分页标签
		  DM.PageTags.init({
			  	divId:"paging",     //放入分页的div的id
		        formId:"feedbackForm",  //表单id
		        curPage:data.pageResult.pageIndex,  //当前页
		        totalCount:data.pageResult.recordCount,//总记录数
		        pageCount:data.pageResult.pageTotal,//总页数
		        showPages:10,  //显示记录数
		        url:basePath+"operations/feedbackListAjax.do",  //请求路径
		        isAjax:true,  //是否为ajax提交  true 为是  false为表单提交
		        toPageCallBack:function(data){   //返回函数
		        	_self.setProjectList(data.data);
		        }
		 });
	}
});

var feedbackController=new FeedbackController();
//页面加载时调用
DM.Page.ready({
	"页面加载":function(){
		feedbackController.getProjectList();
	},
	"导出列表":function(){
		// 绑定导出事件
		$("#export").bind("click", function() {
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "feedbackForm",
				"fileName" : "意见反馈列表.xls",
				"url" : "operations/feedbackListExport.do"
			});
		});
	}
});
</script>