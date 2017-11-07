<!--运营管理->基本设置--项目标签-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="p20">
  <div class="border">
    <div class="title-container">
    	<i class="icon-i w30 h30 va-middle title-left-icon"></i>
    	修改标签
    </div>
    <div class="tab-content-container p20"> 
      <form id="industryModifyForm">
      <div class="tab-item" style="display: block;">
      <ul>
          <li class="mb20">
			<div class="pr mh30 pl140">
				<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
					<em class="red pr5">*</em>项目类型：
				</span>
				<span class="lh30 pr tl clearfix">
                  <label>
                  	<c:if test="${proType eq '1'}">产品急销</c:if>
                  	<c:if test="${proType eq '2'}">实现梦想</c:if>
                  </label>
                  <input type="hidden" id="proType" value="${proType}">
				</span>
			</div>
          </li>
          <li class="mb20">
			<div class="pr mh30 pl140">
				<span class="display-ib w120 lh30 tr mr5 pa left0 top0">
					<em class="red pr5">*</em>项目标签：
				</span>
				<span class="lh30 pr tl clearfix">
                    <input type="text" validate="q" maxlength="4" id="AddXiangMuName" class="text border h30 w300" onkeyup="this.value=this.value.replace(/[, ]/g,'')" placeholder="自定义最多4个字">
                    <span class="pl5"><a href="javascript:void(0)" class="btn-blue2 btn white radius-6 pl20 pr20" id="AddXiangMuNameBtn">添加</a></span></div>
				</span>
                <p class="prompt" id="AddXiangMuNameMsg"></p>
			</div>
			<div class="pr mh30 pl140">
				<span class="lh30 pr tl clearfix">
                    <ul class="gray6 input-list-container clearfix" id="HangYeList">
	              		<c:forEach var="label" items="${list}" >
	                		<li name="lableLi">
		               			<div class="h30 lh30 bg-fafafa mr20">${label.labelName}
			               			<a href="javascript:void(0);" class="zoom-in-btn icon-i delete-btn" onclick="deleteLable(this)">-</a>
			               			<input type="hidden" name="labelId" value="${label.labelTypeId}">
			               			<input type="hidden" name="labelName" value="${label.labelName}">
		               			</div>
	               			</li>
	                	</c:forEach>
	               	</ul>
				</span>
			</div>
          </li>
       </ul>
		<div class="tl pl120 f16 pb20">
			<a href="javascript:void(0);" class="click-link btn-blue2 btn white radius-6 pl20 pr20" data-url="operations/projectLabelSetPage.do">返回</a>
		</div>
       </div>
       </form>
      </div>
  </div>
</div>
<script>
dmCheck.init("#industryModifyForm");
var projectType = $("#proType").val();
$("#AddXiangMuNameBtn").click(function(){
	if(!dmCheck.check("#industryModifyForm")){
		return;
	}
	var labelName = $("#AddXiangMuName").val().replace(/\s+/,'');
	if(labelName.length>0)
	{
		//判断标签名称是否重复
		var flag = true;
		$("input[name='labelName']").each(function(index,node){
			if(labelName == $(node).val()){
				flag = false;
			}
		});
		if(!flag){
			Dialog.show("重复的标签名称","tip");
			return false;
		}
		//新增项目标签
		DM.ajax({
			"data" : {"projectType":projectType,"labelName":labelName},
			"url" : "operations/insertProjectLabel.do",
			"success" : function(data){
				if(data && data.code=='000000' && data.data.singleResult.labelTypeId){
					var li_str="<li name='lableLi'><div class=\"h30 lh30 bg-fafafa mr20\">"+labelName+
					"<a href=\"javascript:void(0);\" onclick=\"deleteLable(this)\" class=\"zoom-in-btn icon-i delete-btn\">-</a>"
					+"<input type='hidden' name='labelId' value='"+data.data.singleResult.labelTypeId+"'>"+
					"<input type='hidden' name='labelName' value='"+labelName+"'>"+
					"</div></li>";
					$("#HangYeList").append(li_str);
					$("#AddXiangMuName").val("");
				}else{
					Dialog.show("添加标签失败","error");
				}
			}
		});
	}
	else
	{
		Dialog.show("请输入项目标签","tip");
	}
	
});

function deleteLable(_this){
	var labelId = $($(_this).siblings()[0]).attr("value");
	var lableLi=$("li[name='lableLi']");
	if(lableLi.length<=1){
		Dialog.show("项目标签不能为空，不能删除","tip");
	}else{
		DM.ajax({
			"data" : {"labelTypeId":labelId},
			"url" : "operations/deleteProjectLabel.do",
			"success" : function(data){
				if(data && data.code=='000000'){
					$(_this).parent().parent().remove();
				}else{
					Dialog.show(data.description,"error");
				}
			}
		});
	}
}
</script>