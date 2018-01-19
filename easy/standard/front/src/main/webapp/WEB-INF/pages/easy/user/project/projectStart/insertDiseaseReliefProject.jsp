<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sicknessPage sicknessbox">
	<div class="layout">
		<h2>大病救助<a class="explain highlight"><i></i>筹款说明</a></h2>
		<form id="projectForm" action="" >
			<li class='ldr' datr='${currUser.userId}'></li>
			<li class='ldrType' datr='${currUser.userType}'></li>
			<input type="hidden" id="projectType" name="projectType" value="${projectType}">
			<div class="formpage">
				<dl>
					<dt>项目标题</dt>
					<dd>
						<input type="text" id="projectName" name="projectName" class="input_txt wid92" validate="q|leng" leng="1,20" maxlength="20" placeholder="请填写项目标题20字以内">
						<span class="limitWord">0/20</span>
						<p class="prompt" id="projectNameMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt>目标金额</dt>
					<dd>
						<input type="text" id="targetAmount" name="targetAmount" class="input_txt" validate="q|range|z" range="${projectAmountMin},9999999" maxlength="7" placeholder="请填写目标金额">
						<span class="unit">元</span>
						<p class="prompt" id="targetAmountMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt>项目简介</dt>
					<dd>
						<input type="text" id="projectIntro" name="projectIntro" class="input_txt wid92" validate="q|leng" leng="1,30" maxlength="30" placeholder="请填写项目简要说明或用途30字以内">
						<span class="limitWord">0/30</span>
						<p class="prompt" id="projectIntroMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt>筹资期限</dt>
					<dd>
						<p class="beg-timeBox">今日起至<span class="redCol"></span>结束</p>
						<div class="setTimeBox borderMain">
							<a class="l_btn"><i></i></a>
							<input type="text" id="financingDays" name="financingDays" readonly="readonly" value="2">
							<a class="r_btn"><i></i></a>
							<span class="unit dateBox highlight">天</span>
						</div>
					</dd>
				</dl>
				<dl>
					<dt>项目详情</dt>
					<dd>
						<textarea id="projectDetails" name="projectDetails" class="wid92" cols="30" rows="14"></textarea>
						<p id="projectDetailsTip" class="red display-table"></p>&nbsp;&nbsp;<p class="prompt display-table" id="projectDetailsMsg"></p>
						<p class="tips">项目内容和项目图片禁止透露任何<span class="redCol">联系方式</span>和<span class="redCol">银行卡</span>等收款信息，包括但不限于手机号码、座机号码、微信号、支付宝账号、银行卡号等。违反以上规定，项目验证和提现申请均不予通过。</p>
						<ul id="projectImageUl" class="addCover clearfix">
							<li class="fileListAfter">
								<a id="filePicker" class="addCoverIcon">
									<span>上传图片<br>（最多8张）</span>
								</a>
							</li>
						</ul>
						<p class="prompt" id="coverImageIdMsg"></p>
						<input type="hidden" id="coverImageId" validate="q" info="q:请至少上传一张图片" name="coverImageId">
						<input type="hidden" id="coverImageUrl" name="coverImageUrl">
						<p class="tips">大病救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明等照片，提高项目可信度。建议图片尺寸大小640px * 360x。</p>
					</dd>
				</dl>
			</div>
			<div class="login-reading tc f16 mb20">
				<input id="agreeCheckBox" type="checkbox" checked="checked" class="mr10">
				<span><span class="color999">我已阅读并同意</span><a href="<%=basePath%>common/showAgreement.do?id=2" target="_blank" class="highlight">${protocolModel}</a></span>
			</div>
			<p class="tc mb10">
				<a id="initProjectBtn" class="btn-public btn-w310 btn-blue">发布项目</a>
			</p>
		</form>
	</div>
</div>
<!-- 弹窗 -->
<div id="raiseExplain" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog">
	    <div class="title"><a href="#" class="out"></a>筹款说明</div>
	    <div class="content">
	        <div class="dia_auto width-full">
	            <div class="tip_information">
	              <div class="tips">
	                  <span class="f20 gray3">${textInstruct}</span>
	              </div> 
	            </div>
	        </div>
	        <div class="tc mt20"><a id="closeBtn" href="#" class="btn-public btn-w50h25 btn-blue">知道了</a>
	    </div>
	</div>
</div>
<!-- 弹窗 end-->
<form id="successForm" method="post">
	<c:if test="${currUser.userType==1}">
		<input type="hidden" name="validationType" value="4">
	</c:if>
	<c:if test="${currUser.userType==2}">
		<input type="hidden" name="validationType" value="1">
	</c:if>
	<input type="hidden" name="projectType" value="${projectType}">
	<input type="hidden" id="projectId" name="projectId">
</form>
<!-- 富文本编辑器的css和js文件begin -->
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<!-- 富文本编辑器的css和js文件end -->
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/formcache.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectStart.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectStart/projectDiseaseRelief.js"></script>