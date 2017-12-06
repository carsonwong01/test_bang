<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/index_new.css">
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

<div class='txt-yo'>
	<div>
		<p>“帮你筹”是全国性的公益众筹平台。平台致力于重大疾病防治网络建设，以提高贫困患儿及时接受治疗机率，缓解家庭困境，促进贫困地区儿童健康成长 ，切断贫困代际传递。平台由中国社会工作联合会、《公益时报》社和中海软银财富管理有限公司联合发起，与中国华侨公益基金会等基金会合作开始爱心筹款项目。平台将积极整合爱心企业、个人 、慈善机构等慈善资源，通过移动互联网O2O模式，打通慈善筹款与爱心救助的爱心之路 。</p>
		<ul class='liu-cfr'>
			<li><img src="<%=basePath%>easy/images/cn07.png"><p>75道审核拨付流程</br>工作人员实地探访</p></li>
			<li><img src="<%=basePath%>easy/images/cn09.png"><p>全国26个省（市）</br>百家三甲医院</p></li>
			<li><img src="<%=basePath%>easy/images/cn06.png"><p>《中国公益时报》发起</br>数十家公益基金会联合参与</p></li>
			<li><img src="<%=basePath%>easy/images/cn08.png"><p>开放性数据平台</br>多家平台数据共享策略</p></li>
			<div class='clear'></div>
		</ul>
	</div>
</div>
<%--
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
--%>
<!-- 推荐项目 -->
<div class='tui-ja'>
	<div class='cyio'>
		<div class='ph'>
			<h1>推荐项目</h1>
			<span>recommendable projects</span></br>
			<i></i>
		</div>
		<ul class='im-tx'>
			{{each(staInfo, objInfo) hotProject}}
			<li>
				<img src="{{= objInfo.projectImg}}">
				<div class='detailed'>
					<p class='ti-m' style="width:330px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
						<a href="<%=basePath %>project/projectDetails.do?projectId={{= objInfo.projectId}}">{{= objInfo.projectName}}</a></p>
					<p class='yi-b'><b></b><span>{{= objInfo.hospitalName}}</span><i></i> <span>{{= objInfo.foundationName}}</span></p>
					<div class='dao-t' id='dao-t'>
						<p><span id="progress">{{= objInfo.rate*100}}%</span></p>
					</div>
					<ul class='ul-num'>
						<li>目标金额（元）</br> <span>{{= objInfo.targetAmount}}</span></li>
						<li>已筹金额（元）</br> <span>{{= objInfo.raiseTotal}}</span></li>
						<li>捐助人次（次）</br> <span>{{= objInfo.supportCount}}</span></li>
						<div class='clear'></div>
					</ul>
					<p class='but-a'><a href="<%=basePath %>project/projectDetails.do?projectId={{= objInfo.projectId}}">我要捐款</a></p>
				</div>
			</li>
			{{/each}}
			<div class='clear'></div>
		</ul>
		<h3 class="til"><a href="<%=basePath%>project/projectList.do" target="_blank" class="more">查看更多&gt;</a></h3>
	</div>
</div>
<!-- 合作医院 -->
<div class='he-hospital'>
	<div class='hos-hz'>
		<div class='ph'>
			<h1>合作医院</h1>
			<span>cooperative hospital</span></br>
			<i></i>
		</div>
		<div class='add-eas'>
			<p class='fl'><img src="<%=basePath%>easy/images/WechatIMG59.png"></p>
			<div class='fr wid-ad'>

				<%--需要重构--%>

				<p>全国26个省（市），百家三甲医院，《中国公益时报》发起
					</br>数十家公益基金会联合参与
					</br>让爱心传播无界限</p>
				<ul class='hospital-name'>
					<li><a href="">北京大学第一医院</a></li>
					<li><a href="">北京大学第一医院</a></li>
					<li><a href="">北京大学第一医院</a></li>
					<li><a href="">北京大学人民医院</a></li>
					<li><a href="">北京大学人民医院</a></li>
					<li><a href="">北京医科大学第一医院</a></li>
					<li><a href="">北京阜外医院</a></li>
					<li><a href="">北京阜外医院</a></li>
					<li><a href="">北京首医大附儿童医院</a></li>
					<li><a href="">北京海军总医院</a></li>
					<li><a href="">重庆医科大学附儿童医院</a></li>
					<li><a href="">北京海军总医院</a></li>
					<li><a href="">北京空军总医院</a></li>
					<li><a href="">江苏省南京市鼓楼医院</a></li>
					<li><a href="">北京空军总医院</a></li>
					<li><a href="">北京空军总医院</a></li>
					<li><a href="">北京空军总医院</a></li>
					<li><a href="<%=basePath%>hospital/hospitalList.do">查看更多医院>></a></li>
					<div class='clear'></div>
				</ul>
			</div>
			<div class='clear'></div>
		</div>
	</div>
</div>
<!-- 网站公告 -->
<div class='announ'>
	<div class='acement'>
		<div class='fl'>
			<div class='hl'>
				<h1>新闻动态</h1>
				<span>news</span></br>
				<i></i>
			</div>
			<ul class='xiw-k'>
				{{each(sta, obj) InvestmentDynamicInfo}}
				<li><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= obj.id}}"><i></i>{{= obj.infoTitle}}<span>{{= obj.dateCreate}}</span></a></li>
				{{/each}}
			</ul>
			<a href="<%=basePath%>frontHome/toNewsInfos.do?investmentInfoType=2" target="_blank" class='fr gd-n'></a>
		</div>
		<div class='fr'>
			<div class='hl'>
				<h1>网站公告</h1>
				<span>Website announcement</span></br>
				<i></i>
			</div>
			<ul class='xiw-k'>
				{{each(sta, obj) InvestmentInfo}}
				<li><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= obj.id}}"><i></i>{{= obj.infoTitle}}<span>{{= obj.dateCreate}}</span></a></li>
				{{/each}}
			</ul>
			<a href="<%=basePath%>frontHome/toNewsInfos.do?investmentInfoType=1" target="_blank" class='fr gd-n'></a>
		</div>
		<div class='clear'></div>
	</div>
</div>

<%--有待重构--%>
<div class='plat'>
	<div class='palt-cen'>
		<p><span>合作平台：<span></span></span><span>轻松筹、爱心筹、滴水筹、众筹网</span><div class='clear'></div></p>
		<p><span>数据支持：<span></span></span><span>腾讯公益基金会、阿里巴巴公益基金会、百度公益基金会</span><div class='clear'></div></p>
		<p><span>媒体支持：<span></span></span><span>人民公益、新华公益、凤凰公益、腾讯公益、人民政协报公益周刊、新浪公益、中海慈善新闻网、环球网、公益中国</span><div class='clear'></div></p>
		<p><span>合作基金会：<span></span></span><span>中国华侨基金会、中华少年儿童慈善救助基金会、中国少年儿童基金会、中华社会救助基金会
                    中国人口福利基金会</span><div class='clear'></div></p>
	</div>
</div>
