
<!--项目动态--查看详情-->
<!--项目动态-->
<div class="p20">
	<form action="projectDynamicsDetailsAjax.do" method="post"
		id="dataForm">
		<!-- 项目Id -->
		<input type="hidden" value="${projectId }" name="id" />
		<div class="pt20">
			<span class="pt20 mt40 f16">项目动态</span>
			<hr>
		</div>
		<div class="tab-content-container p20">
			<div class="p20">
				<div class="newtime-item-container lh24"
					id="projectDynamicsDetailsData">
					<!--box-->
					<!--box end-->
					<!--分页-->

					<!--分页 end-->
				</div>
				<div class="paging clearfix pt20" id="paging"></div>
			</div>
		</div>
	</form>
</div>
<!-- 动态状态（1待审核， 2审核不通过，3审核通过，4作废） -->
<script id="projectDynamicsDetailsTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
  <div class="newtime-item pl120 pr">
      <div class="main-bg radius-round w20 h20 pa top0"></div>
      <div class="border-l-s pb30 ml10">
        <div class="tc w110 pa left0 top0 gray6" style="width:110px;">
		  <p>{{= data.dateCreate}}</p>
        </div>
        <div class="ml20 border-b-d pb20">
          
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
	src="<%=basePath%>js/easy/bus/projectDynamics/projectDynamicsDetails.js"></script>