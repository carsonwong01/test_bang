<!--运营管理->基本设置--项目标签-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
 <!-- 搜索框 -->
	<form action="projectLabelSetAjax.do" method="post" id="projectLabelForm">
  <div class="border">
   
		<div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>项目标签设置</div>
	    <div class="content-container pl40 pt30 pr40">
	      <ul class="gray6 input-list-container clearfix">
	        <li><span class="display-ib mr5">修改人</span>
	        <input type="text" class="text border pl5 mr20" name="updateUser" value="" />
	        </li>
	        <li><span class="display-ib mr5">修改时间</span>
              <input class="text border pl5 w120 date" name="staDate" id="staDate" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'})"   type="text"> 
	          <span class="pl5 pr5">至</span> 
	          <input class="text border pl5 w120 mr20 date" name="endDate" id="endDate" onclick="WdatePicker({minDate: '#F{$dp.$D(\'staDate\')}'})"  type="text">
	        </li>
	        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="labelController.getProjectLableList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
	      </ul>
	    </div>
  </div>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc">序号</th>
          <th>项目类型</th>
          <th>项目标签</th>
          <th>修改人</th>
          <th>修改时间</th>
          <th class="w50">操作</th>
        </tr>
      </thead>
      <!-- List -->
      <tbody class="f12" id="projectLabelListData"></tbody>
    </table>
  </div>
   </form>
</div>
<script id="projectLabelListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
      <tr>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.proTypeName}}</td>
          <td>{{= data.labelNames}}</td>
          <td>{{= data.updateUser}}</td>
          <td>{{= data.updateTime}}</td>
          <td class="tc">
 			 <a href="javascript:void(0);" class="click-link link-blue" data-url="operations/updateProjectLabelSetPage.do?proType={{= proType}}&proTypeName={{= proTypeName}}">修改</a>
 		  </td>
     </tr>
{{/each}}
</script>
<script>
//运营管理->基本设置--项目标签
dmCheck.init("#projectLabelForm");
var ProjectLabelListController=DM.Controller.sub({
	 //项目标签列表查询
	 getProjectLableList:function(){
		if(!dmCheck.check("#projectLabelForm")){ 
			return false;
     	}
	    var _self=this;
		DM.ajax({
			url:"operations/projectLabelSetAjax.do",
			data:$("#projectLabelForm").serialize(),
			success:function(data){
				if(data.code=="000000"){
					_self.setProjectLabelList(data.data);		
				}
			},
			error:function(data){
				 Dialog.show("系统异常，请联系管理员","error");
			}
		});
	},
	//项目标签信息
	setProjectLabelList:function(data){
		var _self=this;
		
		if (data.list) {
			var list = data.list;
			for ( var index in list) {
				list[index].proTypeName = {};
				list[index].proTypeName = labelController.enums.proType[list[index]["proType"]];
			}
		}
		
        $("#projectLabelListData").empty();
		//填充数据
		$('#projectLabelListTemp').tmpl(data).appendTo("#projectLabelListData");
	},
	editLabel:function(proType,proTypeName,labelNames){
		
	},
	/*
	 * 枚举数据
	 */
	enums : {
		proType : {
			"1" : "产品急销",
			"2" : "实现梦想"
		}
	}
});

var labelController=new ProjectLabelListController();
//页面加载时调用
DM.Page.ready({
	"页面加载":function(){
		labelController.getProjectLableList();
	}
});
</script>