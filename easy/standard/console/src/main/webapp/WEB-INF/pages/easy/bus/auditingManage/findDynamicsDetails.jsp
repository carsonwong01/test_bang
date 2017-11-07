<!--项目动态审核列表-项目详情-->
<!--项目动态-->
<form action="projectDynamicsDetailsAjax.do" method="post" id="dataForm">
	<!-- 项目Id -->
	<input type="hidden" value="${projectId }" name="id" />
	<div class="tabnav-container">
		<ul class="clearfix">
			<li><a href="javascript:void(0);" class="tab-btn select-a"
				id="projectBasicInfoId">项目动态</a></li>
		</ul>
	</div>
	<div class="tab-content-container p20">
		<div class="p20">
			<div>项目编号：${projectNo }</div>
			<div class="pa right0 top5 mr5"><a
						class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link"
						data-url="bus/auditingManage/findDynamicsList.do">返回</a></div>
			<br/>
			<div class="newtime-item-container lh24"
				id="findDynamicsDetailsData">
				<!--box-->
				<!--box end-->
				<!--分页-->

				<!--分页 end-->
			</div>
			<div class="paging clearfix pt20" id="findDynamicsDetailsTag"></div>
		</div>
	</div>
</form>
<!-- 动态状态（1待审核， 2审核不通过，3审核通过，4作废） -->
<script id="findDynamicsDetailsTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
  <div class="newtime-item pl120 pr">
      <div class="main-bg radius-round w20 h20 pa top0"></div>
      <div class="border-l-s pb30 ml10">
        <div class="tc w110 pa left0 top0 gray6" style="width:110px;">
		  <p>{{= data.dateCreate}}</p>
        </div>
        <div class="ml20 border-b-d pb20">
          <h4 class="h30">
                <span class="fr btn-blue2 btn white radius-6 pl20 pr20 ml50 toDeleteDialog" id="{{= data.id}}">删除</span>
          </h4>
          <p class="gray6">{{= data.content}}</p>
          <div class="pt10">
            <ul class="gray6 input-list-container clearfix">
               {{each(i,object) data.imgsUrl}} 
                 <li>
                     <div class="pr30"><img src="{{= object.addr}}" class="border p4 w120 h80 imgPreviewNew"></div>
                  </li>
 		      {{/each}}
            </ul>
          </div>
			
        </div>
      </div>
    </div>
{{/each}}
</script>
<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/findDynamicsDetails.js"></script>