<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sicknessPage sicknessbox">
	<div class="layout">
		<h2>实现梦想<a class="explain highlight"><i></i>筹款说明</a></h2>
		<input type="hidden" id="projectAmountMin" value="${projectAmountMin}"/>
		<input type="hidden" id="targetCountMax" value="${targetCountMax}"/>
		<form id="projectForm" action="" >
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
						<span id="targetAmount" name="targetAmount" class="hei50">0</span>
						<span class="f18">元 (所有梦想目标金额的合计)</span>
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
					<dt>项目标签<br><span class="color999 pl30">（最多可选2个)</span></dt>
					<dd>
						<ul id="labels" class="clearfix link-lebal pt10">
							<c:forEach var="entity" items="${labels}" varStatus="status">
								<c:if test="${entity.projectType eq '2'}">
									<li><a href="javascript:;">${entity.labelName}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<input type="hidden" id="projectLabel" validate="q" info="q:至少选择一个标签" name="projectLabel">
						<p class="prompt" id="projectLabelMsg"></p>
					</dd>
				</dl>
				<dl>
					<dd><span class="f18 midle">需要支持者收货地址</span><input id="isNeedAddr" name="isNeedAddr" type="checkbox" class="ml10 midle"></dd>
					<input type="hidden" id="isNeddAddr" name="isNeddAddr" value="2">
				</dl>
				<dl>
					<dt>项目详情</dt>
					<dd>
						<textarea id="projectDetails" name="projectDetails" class="wid92" cols="30" rows="14"></textarea>
						<p id="projectDetailsTip" class="red display-table"></p>&nbsp;&nbsp;<p class="prompt display-table" id="projectDetailsMsg"></p>
						<p class="tips"></p>
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
						<p class="tips">请上传清晰的产品图片，建议图片尺寸大小640px * 360x。</p>
					</dd>
				</dl>
			</div>
			<div class="dreamAction">
				<h3 class="dream-title">梦想目标</h3>
				<div class="front-return-mod">
					<ul id="returnUl">
					</ul>
					<a href="javascript:;" class="addareturn" onclick="projectDreamController.addReturnDialog();"><i class="jiaohao-icon tianjia-icon"></i>添加梦想目标</a>
					<p class="prompt" id="returnUlMsg" style="min-height:20px; line-height:20px; color:red; padding-bottom:0px;color: #f66"></p>
				</div>
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
<!-- 筹款说明弹窗 start -->
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
	        <div class="tc mt20"><a id="closeBtn" href="#" class="btn-public btn-w50h25 btn-blue">知道了</a></div>
	    </div>
	</div>
</div>
<!-- 筹款说明弹窗 end-->

<!-- 项目梦想目标弹窗 start -->
<div id="returnDialog" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog dialog_big">
	    <div class="title"><a href="javascript:;" class="out"></a></div>
	    <div class="content">
	        <div id="returnDialogContent" class="dia_auto">
	            
	        </div>
	        <div class="tc mt20"><a href="javascript:;" id="okBtn" data-status="" class="btn-public btn-w50h25 btn-blue">确定</a> <a href="javascript:;" id="cancelBtn" class="btn-public btn-w50h25 btn-gray">取消</a></div>
	    </div>
	</div>
</div>
<!-- 项目梦想目标弹窗 end-->
<!-- 弹窗内容模板 start -->
<script id="returnDialogTmpl" type="text/x-jquery-tmpl">
<form id="returnForm" action="">
	<ul class="text_list2">
		<li>
			<div class="til"><span class="red">*</span>目标金额：</div>
			<div class="con">
				<span>
					<input id="supportAmount" type="text" validate="q|range|z" range="1,999999" maxlength="6" class="text_style" style="width:460px;" placeholder="请填写目标金额" value="{{= supportAmount}}"/>元
					<p class="prompt" id="supportAmountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til"><span class="red">*</span>资金用途：</div>
			<div class="con">
			<span>
				<textarea id="returnDescribe" cols="38" rows="4" validate="q|leng" leng="1,500" maxlength="500" class="textarea_style" style="width:460px" placeholder="填写资金用途">{{= returnDescribe}}</textarea>
				<span class="limitWord areaTips">0/500</span>
				<p class="prompt" id="returnDescribeMsg"></p>
			</span>
			</div>
		</li>   
	</ul>
</form>
</script>
<!-- 弹窗内容模板 end -->
<!-- 梦想目标添加模板 start -->
<script id="returnTmpl" type="text/x-jquery-tmpl">
<li class="front-return-list">
	<input type="hidden" name="targetList[].supportAmount" data-name="supportAmount" value="{{= supportAmount}}">
	<input type="hidden" name="targetList[].returnDescribe" data-name="returnDescribe" value="{{= returnDescribe}}">

	<h6>目标 <b id="supportAmountB" class="highlight">{{= supportAmount}}</b> 元</h6>
	<p id="returnDescribeP">{{= returnDescribe}}</p>
	<div class="Btn-edit">
		<a href="javascript:;" onclick="projectDreamController.editReturnDialog(this);">编辑</a>
		<br>
		<a href="javascript:;" onclick="projectDreamController.deleteReturn(this);" class="red">删除</a>
	</div>
</li>
</script>
<!-- 梦想目标添加模板 end -->
<form id="successForm" method="post">
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
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/formcache.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectStart.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectStart/projectDream.js"></script>