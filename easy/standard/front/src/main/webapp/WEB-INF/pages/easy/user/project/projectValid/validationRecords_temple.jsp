<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>项目验证</h2>
<div class="u-stepBox clearfix public-minheight">
	<form id="recordForm" method="post">
		<input type="hidden" id="validationId" name="id" value="${validationId}">
		<div id="recordListData">
		</div>
	</form>
</div>
<!-- 审核记录模板-->
<script id="recordListTemp" type="text/x-jquery-tmpl">
<div class="dynamic">
{{each(i,data) pageResult}}
	{{if i==0}}
		{{if data.status!=2}}
			<div class="schedule active">
				<h6>{{= data.title}}<i class="ico"></i></h6>
				<p>{{= data.dateFormat}}</p>
			</div>
		{{/if}}
		{{if data.status==2}}
			<div class="schedule active">
				<h6 class="red">{{= data.title}}<i class="ico"></i></h6>
				<p>{{= data.dateFormat}}</p>
				<p class="red">驳回原因：{{= data.opinion}}</p>
			</div>
		{{/if}}
	{{/if}}
	{{if i>0}}
		{{if data.status!=2}}
			<div class="schedule">
				<h6>{{= data.title}}<i class="ico"></i></h6>
				<p>{{= data.dateFormat}}</p>
			</div>
		{{/if}}
		{{if data.status==2}}
			<div class="schedule">
				<h6>{{= data.title}}<i class="ico"></i></h6>
				<p>{{= data.dateFormat}}</p>
				<p>驳回原因：{{= data.opinion}}</p>
			</div>
		{{/if}}
	{{/if}}
{{/each}}
</div>
<br>
{{if pageResult[0].status==2}}
	<a href="javascript:void(0)" onclick="validationRecordController.toEditValidPage();" class="btn-public btn-w70 btn-blue ml100" id="editValidBtn">修改验证资料</a>
{{/if}}
</script> 
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script>
var ValidationRecordController=DM.Controller.sub({
	//审核记录
	getRecordList:function(){
		var _self=this;
		DM.ajax({
			url:"user/project/projectValidRecordAjax.do",
			data:$("#recordForm").serialize(),
			success:function(data){
				if(data.code=="000000"){
					_self.setRecordList(data.data);		
				}
			},
			error:function(data){
				Dialog.show("系统异常，请联系管理员","error");
			}
		});
	},
	//审核记录列表分页信息
	setRecordList:function(data){
		var _self=this;
	      $("#recordListData").empty();
		  //填充数据
		  $('#recordListTemp').tmpl(data).appendTo("#recordListData");
	},
	//跳转项目验证页面
	toEditValidPage:function(){
		$("#recordForm").attr("action", basePath + "user/project/editProjectValidPage.do").submit();		
	}
});
var validationRecordController=new ValidationRecordController();
//页面加载时调用
DM.Page.ready({
	"页面加载":function(){
		validationRecordController.getRecordList();
	}
});
</script>