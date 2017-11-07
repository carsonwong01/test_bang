<!--运营管理->意见反馈-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
 <!-- 搜索框 -->
	<form action="textInstructionsListAjax.do" method="post" id="feedbackForm">
  <div class="border">
	<div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>文本说明</div>
  </div>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc">序号</th>
          <th>文本说明</th>
          <th>最后更新人</th>
          <th>最后更新时间</th>
          <th class="w200">操作</th>
        </tr>
      </thead>
      <!-- List -->
      <tbody class="f12" id="textInstructionsListData"></tbody>
    </table>
  </div>
</div>
 
<script id="textInstructionsListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
      <tr>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.textTitle}}</td>
          <td>{{= data.operatorName}}</td>
          <td>{{= data.dateUpdate}}</td>
 		  <td>
              <a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/textInstructDetail.do?textId={{= textId}}">查看</a>
              <a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/textInstructDetail.do?textId={{= textId}}&isEdit=1">修改</a>
		  </td>
     </tr>
{{/each}}
</script>

<script>
dmCheck.init("#feedbackForm");
var TextInstructionsController=DM.Controller.sub({
	 getProjectList:function(){
		if(!dmCheck.check("#feedbackForm")){ 
			return false;
        	}
	    var _self=this;
		DM.ajax({
			url:"site/textInstructionsListAjax.do",
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
          $("#textInstructionsListData").empty();
		  //填充数据
		  $('#textInstructionsListTemp').tmpl(data).appendTo("#textInstructionsListData");
	}
});

var textInstructionsController=new TextInstructionsController();
//页面加载时调用
DM.Page.ready({
	"页面加载":function(){
		textInstructionsController.getProjectList();
	}
});
</script>