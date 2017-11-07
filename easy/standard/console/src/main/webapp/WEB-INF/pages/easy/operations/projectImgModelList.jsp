<!--图片模板-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>图片模板</div>
  </div>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc">序号</th>
          <th>默认图片类型</th>
          <th>图片内容</th>
          <th class="w200">操作</th>
        </tr>
      </thead>
      <tbody class="f12" id="container">
        
      </tbody>
    </table>
  </div>
</div>

<!-- 图片模板列表模板 -->
<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(i,data) list}}
   <tr class="">
	<td>{{= i+1}}</td>
	<td>{{= data.imageTypeName}}</td>
	<td><img src="{{= data.imageUrl}}" style="width:100px;height:50px;"/></td>
	<td class="tc">
        <a class="link-blue mr20 popup-link" data-url="operations/imgModelsPageEdit.do?templateId={{= templateId}}&imageId={{= imageId}}&imageType={{= imageType}}&imageUrl={{= imageUrl}}">修改</a>
	</td>
  </tr>
{{/each}}
</script>

<script>
var ImageModelSetController=DM.Controller.sub({
	//记录列表 
    loadRecord:function(){
    	DM.ajax({"url":"operations/imgModelsPageAjax.do","success":this.pageCallBack});
    },
    /*
     * 分页回调
     */
    pageCallBack:function(data){
    	if (data.data.list) {
			var list = data.data.list;
			for ( var index in list) {
				list[index].imageTypeName = {};
				list[index].imageTypeName = imageModelController.enums.imageType[list[index]["imageType"]];
			}
		}
 		//清空表格数据
 		$("#container").empty();
 		//填充数据
		 $('#proLeadTemple').tmpl(data.data).appendTo("#container");
 	},
	/*
	 * 枚举数据
	 */
	enums : {
		imageType : {
			"1" : "用户头像",
			"2" : "项目封面",
			"3" : "身份证示例图片",
			"4" : "医疗证明示例图片",
			"5" : "结婚证示例图片"
		}
	}
});

var imageModelController=new ImageModelSetController();
//页面加载时调用
DM.Page.ready({
	"事件监控":function(){
		//初始化查询
		imageModelController.loadRecord();
	}
});
</script>

