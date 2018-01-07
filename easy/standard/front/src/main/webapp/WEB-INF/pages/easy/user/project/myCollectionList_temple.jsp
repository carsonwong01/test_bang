<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
</form>
<!-- 我关注的项目 -->
<div class="personal-con clearfix">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>我关注的
	</h2>
	<div id="con_one_1" class="pt30">
		<form action="" id="dataForm">
			<!-- 项目状态 -->
			<input type="hidden" name="projectStatus" id="projectStatus" value="" />
		</form>
		<div class="project_til">
			<ul class="clearfix">
				<li class="mod_l"><span class="ml20">项目信息</span></li>
				<li class="mod_01">目标金额(元)</li>
				<li class="mod_02">项目状态</li>
				<li class="mod_r">操作</li>
			</ul>
		</div>
		<div class="project_con">
			<ul id="myCollectionListData">


			</ul>
		</div>
	</div>
	<!--分页-->
	<div class="paging" id="pagingMyCollectionList"></div>
	<!--分页  --END-->
</div>
<script id="myCollectionListTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}

		<li class="item">
		                  <div class="clearfix">
		                    <div class="mod_l">
		                      <div class="pic">
		                        <a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')"><img src="{{= data.coverImgUrl}}" /></a>
		                      </div>
		                      <div class="info">
		                        <div class="til"><a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')">{{= data.title}}</a></div>
		                     <ul class="clearfix">
		                          <li>筹款进度<br /><em class="f16 gray3">{{= data.raiseRate}}</em><em>%</em></li>
		                          <li>已筹金额<br /><em class="f16 gray3">{{= data.supportAmt}}</em><em>元</em></li>
		                          <li class="last">剩余时间<br />
		                            {{if  data.projectStatus == '1' &&  parseInt(data.remainingDay)>0}}<em class="f16 gray3">{{= data.remainingDay}}</em><em>天</em>{{else  data.projectStatus == '1' &&  parseInt(data.remainingDay)==0}}<em class="f16 gray3">即将结束</em>{{else}}<em class="f16 gray3">已结束</em>{{/if}}</li>
		                         </ul>
		                      </div>
		                    </div>
		                    <div class="mod_01"><span class="highlight2">{{= data.facTarget}}</span></div>
		                    <div class="mod_02">
										{{if data.projectStatus == '1'}}众筹中{{/if}}
										{{if data.projectStatus == '2'}}<span class="highlight2">众筹结束</span>{{/if}}
										{{if data.projectStatus == '3'}}<span class="red">众筹失败</span>{{/if}}
										{{if data.projectStatus == '4'}}已删除{{/if}}</div>
		                    <div class="mod_r">
		                      <div class="con"><a href="javascript:void(0)" class="highlight unFocusProject" id="{{= data.projectId}}">取消关注</a></div>
		                    </div>
		                  </div>
		                </li>

		
		
	{{/each}}
</script>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/project/myCollectionList.js"></script>