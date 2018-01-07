<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
	<input type="hidden" id="projectType" name="projectType"/>
	<input type="hidden" id="to" name="to"/>
</form>

<!-- 我发起的项目 -->
<div class="personal-con clearfix">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>我发起的
	</h2>
	<ul class="user-tab-til clearfix">
		<li id="one0" onclick="myInitProjectListController.setTab('one',0,3)"
			class="hover">全部</li>
		<li id="one1" onclick="myInitProjectListController.setTab('one',1,3)">众筹中</li>
		<li id="one2" onclick="myInitProjectListController.setTab('one',2,3)">众筹结束</li>
		<li id="one3" onclick="myInitProjectListController.setTab('one',3,3)">众筹失败</li>
		<p class="animate_p">
			<span class="xmjt-arrow"></span>
		</p>
	</ul>

	<div id="con_one_1">
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
			<ul id="myInitProjectListData">


			</ul>
		</div>
	</div>
	<!--分页-->
	<div class="paging" id="pagingMyInitProjectList"></div>
	<!--分页  --END-->
</div>
<script id="myInitProjectListTemplate" type="text/x-jquery-tmpl">
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
		                            {{if data.projectStatus == '1' && parseInt(data.remainingDay)>0}}<em class="f16 gray3">{{= data.remainingDay}}</em><em>天</em>{{else  data.projectStatus == '1' &&  parseInt(data.remainingDay)==0}}<em class="f16 gray3">即将结束</em>{{else}}<em class="f16 gray3">已结束</em>{{/if}}</li>
		                        </ul>
		                      </div>
		                    </div>
		                    <div class="mod_01">{{= data.facTarget}}</div>
		                    <div class="mod_02">{{if data.projectStatus == '1'}}众筹中{{/if}}
										{{if data.projectStatus == '2'}}<span class="highlight2">众筹结束</span>{{/if}}
										{{if data.projectStatus == '3'}}<span class="red">众筹失败</span>{{/if}}
										{{if data.projectStatus == '4'}}已删除{{/if}}</div>
		                    <div class="mod_r">
		                      <div class="con">
									<a href="javascript:void(0)" onclick="userCenterController.goProjectManage('{{= data.projectId}}','{{= data.projectType}}','zcdd')" class="highlight">项目管理</a>
									{{if data.projectStatus == '3'}}
										<a href="javascript:void(0)" class="highlight operateReason" id="{{= data.projectId}}">失败原因</a>
									{{/if}}
							  </div>
		                    </div>
		                  </div>
		                </li>

		
		
	{{/each}}
</script>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/project/myInitProjectList.js"></script>