<!--banner 首页滚动广告图片-->
{{if advertise!=null && advertise.length>0}}
<div class="banner clearfix">
	<ul class="rslides">
		{{each(sta, obj) advertise}}
		<li style="background:url({{= obj.adImageUrl }}) center 0 no-repeat;">
			<a href="{{if obj.adPartnerUrl.length > 7 }}{{= obj.adPartnerUrl}}{{/if}}{{if obj.adPartnerUrl.length <= 7 }}javascript:void(0){{/if}}" {{if obj.openType == 1 }}target="_blank"{{/if}}{{if obj.openType == 2 }}target="_self"{{/if}} title=""></a>
		</li>
		{{/each}}
	</ul>
</div>
{{/if}}
<!--banner-->

<!--统计数据-->
<div class="capital">
	<div class="layout">
		<li class="posL">
			<span data-from="0.00" data-to="{{= indexTotalMessage.totalInteger}}">{{= indexTotalMessage.raiseTotal}}</span><span class="f20">元</span><br>
			<span>筹资总额</span>
		</li>
		<li>
			<span class="f36 gray3" data-from="0" data-to="{{= indexTotalMessage.projectCount}}">{{= indexTotalMessage.projectCount}}</span><span class="f20">个</span><br>
			<span>成功项目总数</span>
		</li>
		<li class="posR">
			<span class="f36 gray3" data-from="0" data-to="{{= indexTotalMessage.memberCount}}">{{= indexTotalMessage.memberCount}}</span><span class="f20">次</span><br>
			<span>支持总人次</span>
		</li>
	</div>
</div>

{{if hotProject!=null && hotProject.length>0}}
<div class="hotRecommend">
	<div class="layout">
		<h3 class="til"><span>热门推荐</span><a href="<%=basePath%>project/projectList.do" target="_blank" class="mored">查看更多&gt;</a></h3>
		<form id="projectListForm" method="post">
			<!-- 跳转项目详情页的项目ID -->
			<input type="hidden" name="projectId" id="projectId"/>
			<ul class="clearfix">
				{{each(staInfo, objInfo) hotProject}}
				{{if objInfo.projectType == 6 }}
				<li class="repayP">
					<a href="javascript:void(0)" title="{{= objInfo.projectName}}"  onclick="homePageController.projectClick('{{= objInfo.projectId}}');">
						<img src="{{= objInfo.projectImg}}" style="width: 391.63px;height: 308.7px" >
						<div class="dec">
							<h6 style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;">{{= objInfo.projectName}}</h6>
							<p >{{= objInfo.projectIntro}}</p>
						</div>
						<i class="ico iconImg"></i>
					</a>
				</li>
				{{/if}}
				{{if objInfo.projectType == 7 }}
				<li class="dreamP">
					<a href="javascript:void(0)" title="{{= objInfo.projectName}}"  onclick="homePageController.projectClick('{{= objInfo.projectId}}');">
						<img src="{{= objInfo.projectImg}}" style="width: 391.63px;height: 308.7px" >
						<div class="dec">
							<h6 style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;">{{= objInfo.projectName}}</h6>
							<p >{{= objInfo.projectIntro}}</p>
						</div>
						<i class="ico iconImg"></i>
					</a>
				</li>
				{{/if}}

				{{/each}}
			</ul>
		</form>
	</div>
</div>
{{/if}}
<div class="describeBox">
	<div class="layout clearfix">
		<img src="<%=basePath %>easy/images/describeImg.jpg" alt="">
		<div class="rightbox">
			<h2>“帮你筹”介绍</h2>
			<p>
				“帮你筹”是全国性的公益众筹平台。平台致力于重大疾病防治网络建设，以提高贫困患儿及时接受治疗机率，缓解家庭困境，促进贫困地区儿童健康成长 ，切断贫困代际传递。平台由中国社会工作联合会、《公益时报》社和中海软银财富管理有限公司联合发起，与中国华侨公益基金会等基金会合作开始爱心筹款项目。平台将积极整合爱心企业、个人 、慈善机构等慈善资源，通过移动互联网O2O模式，打通慈善筹款与爱心救助的爱心之路 。
			</p>
		</div>
	</div>
</div>
<div class="communicateBox">
	<div class="layout">
		<img src="<%=basePath %>easy/images/communicateImg.png" alt="">
		<div class="leftbox">
			<h3>75道审核拨付流程</h3>
			<p>工作人员实地探访</p>
			<ul>
				<li>流程全程跟踪</li>
				<li>助后信息披露</li>
				<li>让爱心传播更透明</li>
			</ul>
		</div>
	</div>
</div>
<div class="classifyBox">
	<div class="layout clearfix">
		<img src="<%=basePath %>easy/images/classifyImg.png" alt="">
		<div class="rightbox">
			<h3>全国26个省（市），百家三甲医院</h3>
			<p>《中国公益时报》发起</p>
			<ul>
				<li>数十家公益基金会联合参与</li>
				<li>让爱心传播无界限</li>
			</ul>
			<p>
				<i class="iconImg icon1"></i>
				<i class="iconImg icon2"></i>
				<i class="iconImg icon3"></i>
			</p>
		</div>
	</div>
</div>
<div class="convenient">
	<div class="layout">
		<img class="botimg" src="<%=basePath %>easy/images/communicateImg2.png" alt="">
		<div class="leftbox">
			<h3>开放性数据平台</h3>
			<p>多家平台数据共享策略</p>
			<ul>
				<li>多病种数据共享策略</li>
				<li>让每一份需求都能尽快得到救助</li>
				<li>让爱心传播更快捷</li>
			</ul>
		</div>
	</div>
</div>
<div class="multiple">
	<div class="layout">
		<div class="clearfix">
			<!-- 新闻资讯 -->
			<div class="NewsBox fl">
				<h3 class="til">新闻资讯<a href="<%=basePath%>frontHome/toNewsInfos.do?investmentInfoType=2" target="_blank" class="more">更多&gt;</a></h3>
				<div class="contbox clearfix">
					{{each(sta, obj) InvestmentDynamicInfo}}
					<div class="fl list">
						<a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= obj.id}}">
							<div class="news">
								<h6>{{= obj.infoTitle}}</h6>
								<div class="dec">{{html obj.infoContent}}</div>
							</div>
						</a>
					</div>
					{{/each}}
				</div>
			</div>
			<!-- 新闻资讯 end-->
			<!-- 平台公告 -->
			<div class="NoticeBox fr">
				<h3 class="til">平台公告<a href="<%=basePath%>frontHome/toNewsInfos.do?investmentInfoType=1" target="_blank" class="more">更多&gt;</a></h3>
				<ul>
					{{each(sta, obj) InvestmentInfo}}
					<li><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= obj.id}}"><i></i>{{= obj.infoTitle}}<span>{{= obj.dateCreate}}</span></a></li>
					{{/each}}
				</ul>
			</div>
			<!-- 平台公告 -->
		</div>
	</div>
</div>
{{if friendshipUrl!=null && friendshipUrl.length>0}}
<div class="cooperationBox">
	<div class="layout">
		<!--合作伙伴-->

		<div class="wrap cooperation_mod">
			<div class="hd clearfix">合作伙伴</div>
			<div class="cooperation_bd clearfix">
				<div class="prev"><a class="">上一个</a></div>
				<div class="bd">
					<ul class="picList clearfix">
						{{each(sta, obj) friendshipUrl}}
						<li><a href="{{= obj.url}}" target="_blank" ><img src="{{= obj.imageUrl}}" alt="{{= obj.title}}"/></a></li>
						{{/each}}
					</ul>
				</div>
				<div class="next"><a class="">下一个</a></div>
			</div>
		</div>
		<div class="bord"></div>
		<!--合作伙伴 end-->
	</div>
</div>
{{/if}}
