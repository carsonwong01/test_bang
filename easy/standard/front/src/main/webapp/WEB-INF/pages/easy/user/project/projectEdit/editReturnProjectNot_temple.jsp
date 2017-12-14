<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 20px 15px;color: #fff;text-align: center;border-radius: 3px;overflow: hidden;padding-top: 60px;top: -60px;}
</style>
<script>
var projectFiles = new Array();
var fileTemp = {};
<c:forEach var="obj" items="${projectDetail.imgs}" varStatus="status">
	fileTemp = {};
	fileTemp.imageId = "${obj.fileId}";
	fileTemp.imageUrl = "${obj.addr}";
	fileTemp.imageExt = "${obj.extension}";
	fileTemp.imageName = "${obj.name}";
	fileTemp.imageSize = "${obj.accessorySize}";
	<c:if test="${obj.fileId eq projectDetail.coverImageId}">fileTemp.isDefault = "1"</c:if>
	projectFiles.push(fileTemp);
</c:forEach>
</script>
<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>编辑项目</h2>
<div class="user-subject-fill user-subject-box">
	<input type="hidden" id="returnCountMax" value="${returnCountMax}"/>
	<form id="projectForm" action="" >
		<input type="hidden" id="projectId" name="projectId" value="${projectDetail.id}">
		<input type="hidden" name="isOrdered" value="2">
		<div class="formpage">
			<dl>
				<dt><span class="red">*</span>项目标题</dt>
				<dd>
					<input type="text" id="projectName" name="projectName" value="${projectDetail.title}" class="input_txt wid92" validate="q|leng" leng="1,20" maxlength="20" placeholder="请填写项目标题20字以内">
					<span class="limitWord">0/20</span>
					<p class="prompt" id="projectNameMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>目标金额</dt>
				<dd>
					<input type="text" id="targetAmount" name="targetAmount" value="${projectDetail.facTarget}" class="input_txt" validate="q|range|z" range="${projectAmountMin},9999999" maxlength="7" placeholder="请填写目标金额">
					<span class="unit">元</span>
					<p class="prompt" id="targetAmountMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>项目简介</dt>
				<dd>
					<input type="text" id="projectIntro" name="projectIntro" value="${projectDetail.projectIntro}" class="input_txt wid92" validate="q|leng" leng="1,30" maxlength="30" placeholder="请填写项目简要说明或用途30字以内">
					<span class="limitWord">0/30</span>
					<p class="prompt" id="projectIntroMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>筹资期限</dt>
				<dd>
					<p class="beg-timeBox"><span class="red pr5">${projectDetail.dateCreate}</span>至<span class="red pl5 pr5"></span>结束</p>
					<div class="setTimeBox borderMain">
						<a class="l_btn" minDay="${projectDetail.timeLimit}"><i class="jiaohao-icon jiaohao-icon-01"></i></a>
						<input type="text" id="financingDays" name="financingDays" readonly="readonly" value="${projectDetail.timeLimit}">
						<a class="r_btn"><i class="jiaohao-icon jiaohao-icon-02"></i></a>
						<span class="unit dateBox highlight">天</span>
					</div>
					<p class="prompt" id="financingDaysMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>运费说明</dt>
				<dd>
					<input type="text" id="freightDescribe" name="freightDescribe" value="${projectDetail.freight}" class="input_txt wid92" placeholder="请填写运费详情" validate="q|leng" leng="1,50" maxlength="50">
					<span class="limitWord">0/50</span>
					<p class="prompt" id="freightDescribeMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>发货时间</dt>
				<dd>
					<input type="text" id="deliverDescribe" name="deliverDescribe" value="${projectDetail.postTimeText}" class="input_txt wid92" placeholder="请填写发货时间" validate="q|leng" leng="1,50" maxlength="50">
					<span class="limitWord">0/50</span>
					<p class="prompt" id="deliverDescribeMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>项目标签<br><span class="f12 lh16 gray9">（最多可选2个)</span></dt>
				<dd>
					<div class="user-xmbq-til">
						<ul id="labels" class="clearfix">
							<c:forEach var="entity" items="${labels}" varStatus="status">
								<c:set var="labelTemp" value=","/>
								<c:set var="labelName" value="${labelTemp}${entity.labelName}${labelTemp}"/>
								<c:if test="${entity.projectType eq '1'}">
									<li><a href="javascript:;" <c:if test="${fn:contains(projectDetail.label,labelName)}">class="cur"</c:if>>${entity.labelName}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<input type="hidden" id="projectLabel" validate="q" info="q:至少选择一个标签" name="projectLabel" value="${projectDetail.label}">
						<p class="prompt" id="projectLabelMsg"></p>
					</div>
				</dd>
			</dl>
			<dl>
				<dd>需要支持者收货地址<input id="isNeedAddr" type="checkbox" class="ml10 midle" <c:if test="${projectDetail.isNeddAddr eq '1'}">checked="checked"</c:if>></dd>
				<input type="hidden" id="isNeddAddr" name="isNeddAddr" value="${projectDetail.isNeddAddr}">
			</dl>
			<dl>
				<dt><span class="red">*</span>项目详情</dt>
				<dd>
					<textarea id="projectDetails" name="projectDetails" cols="30" rows="14" class="u-xmxq-text">${projectDetail.content}</textarea>
					<p id="projectDetailsTip" class="red display-table"></p>&nbsp;&nbsp;<p class="prompt display-table" id="projectDetailsMsg"></p>
					<p class="tips">项目内容和项目图片禁止透露任何<span class="redCol">联系方式</span>和<span class="redCol">银行卡</span>等收款信息，包括但不限于手机号码、座机号码、微信号、支付宝账号、银行卡号等。违反以上规定，项目验证和提现申请均不予通过。</p>
					<div class="over_h">
						<ul id="projectImageUl" class="addCover clearfix">
							<li class="fileListAfter">
								<a id="filePicker" class="addCoverIcon">
									<span>上传图片<br>（最多8张）</span>
								</a>
							</li>
						</ul>
					</div>
					<p class="prompt" id="coverImageIdMsg"></p>
					<input type="hidden" id="coverImageId" validate="q" info="q:请至少上传一张图片" name="coverImageId" value="${projectDetail.coverImageId}">
					<input type="hidden" id="coverImageUrl" name="coverImageUrl" value="${projectDetail.coverImgUrl}">
					<p class="tips">请上传清晰的产品图片，建议图片尺寸大小640px * 360px。</p>
				</dd>
			</dl>
		</div>
		<div class="user-return-con">
			<div class="user-return-til">回报设置</div>
			<div class="user-return-mod">
				<ul id="returnUl">
					<c:forEach var="entity" items="${projectDetail.dreamTargets}" varStatus="status">
						<li class="user-return-list">
							<input type="hidden" name="returnList[${status.index}].returnId" data-name="returnId" value="${entity.id}">
							<input type="hidden" name="returnList[${status.index}].supportAmount" data-name="supportAmount" value="${entity.amount}">
							<input type="hidden" name="returnList[${status.index}].upperCount" data-name="upperCount" value="${entity.returnNum}">
							<input type="hidden" name="returnList[${status.index}].returnDescribe" data-name="returnDescribe" value="${entity.content}">
							<input type="hidden" name="returnList[${status.index}].imageId" data-name="imageId" value="${entity.imgId}">
							<input type="hidden" name="returnList[${status.index}].imageUrl" data-name="imageUrl" value="${entity.imgUrl}">
							<input type="hidden" name="returnList[${status.index}].imageExt" data-name="imageExt" value="jpg">
							<input type="hidden" name="returnList[${status.index}].imageName" data-name="imageName" value="temp">
							<input type="hidden" name="returnList[${status.index}].imageSize" data-name="imageSize" value="1">
							<div class="user-return-pic"><img src="${entity.imgUrl}" onclick="projectReturnController.showImage(this);"></div>
							<div class="user-return-tex01">
								<a href="javascript:;" onclick="projectReturnController.editReturnDialog(this);" class="fr">编辑</a>
								<p>支持<span id="supportAmountB" class="highlight2">${entity.amount}</span>元</p>
							</div>
							<div class="user-return-tex02">
								<a href="javascript:;" onclick="projectReturnController.deleteReturn(this);" class="red fr">删除</a>
								<p id="returnDescribeP" class="user-return-textcn">${entity.content}</p>
							</div>
						</li>
					</c:forEach>
				</ul>
				<a href="javascript:;" class="addareturn" onclick="projectReturnController.addReturnDialog();"><i class="jiaohao-icon tianjia-icon"></i>添加回报</a>
				<p class="prompt" id="returnUlMsg"></p>
			</div>
		</div>
		<div class="login-reading tc mb20">
			<input id="agreeCheckBox" type="checkbox" checked="checked" class="mr10">
			<span><span class="color999">我已阅读并同意</span><a href="<%=basePath%>common/showAgreement.do?id=2" target="_blank" class="highlight">${protocolModel}</a></span>
		</div>
		<p class="tc mb10">
			<a id="editProjectBtn" class="btn-public btn-w70 btn-blue">确认修改</a>
		</p>
	</form>
</div>
<style>
.dialogBox .remove{top: 0px;cursor: pointer;background: url('<%=basePath%>easy/images/pop_icon.png') no-repeat -13px 0;width: 15px;height: 15px;display: inline-block;position: absolute;margin: -5px 0 0 52px;}
.dialogBox .fileListAfter input[type=file] {position: absolute !important;clip: rect(1px 1px 1px 1px);}
.dialogBox .file-item {width:60px;height:70px;}
.dialogBox .file-item .error {position: absolute;top: 0px;left: 0px;right: 0px;background: red;color: white;text-align: center;height: 20px;font-size: 8px;line-height: 23px;}
.dialogBox .webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 4px;color: #acacac;text-align: center;border-radius: 3px;overflow: hidden;top:0px;}
</style>
<!-- 项目回报弹窗 start -->
<div id="returnDialog" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog dialog_big popBox">
	    <div class="title"><a href="javascript:;" class="out"></a></div>
	    <div class="content">
	        <div id="returnDialogContent" class="dia_auto">
	            
	        </div>
	        <div class="tc mt20"><a href="javascript:;" id="okBtn" data-status="" class="btn-public btn-w50h25 btn-blue">确定</a> <a href="javascript:;" id="cancelBtn" class="btn-public btn-w50h25 btn-gray">取消</a></div>
	    </div>
	</div>
</div>
<!-- 项目回报弹窗 end-->
<!-- 弹窗内容模板 start -->
<script id="returnDialogTmpl" type="text/x-jquery-tmpl">
<form id="returnForm" action="">
	<ul class="text_list2">
		<li>
			<div class="til"><span class="red">*</span>回报金额：</div>
			<div class="con">
				<span>
					<input id="supportAmount" type="text" validate="q|range|z" range="1,999999" maxlength="6" class="text_style" style="width:460px;" placeholder="请填写回报金额" value="{{= supportAmount}}"/>元
					<p class="prompt" id="supportAmountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til">回报数量：</div>
			<div class="con">
				<span>
					<input id="upperCount" type="text" validate="range|z" range="1,9999999" maxlength="7" class="text_style"  style="width:460px;" placeholder="不填写为无限量" value="{{= upperCount}}"/>份
					<p class="prompt" id="upperCountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til"><span class="red">*</span>回报内容：</div>
			<div class="con">
			<span>
				<textarea id="returnDescribe" cols="38" rows="4" validate="q|leng" leng="1,500" maxlength="500" class="textarea_style" style="width:460px" placeholder="填写回报的具体内容">{{= returnDescribe}}</textarea>
				<span class="limitWord areaTips">0/500</span>
				<p class="prompt" id="returnDescribeMsg"></p>
			</span>
			</div>
		</li>   
		<li>
			<div class="til">&nbsp; </div>
			<div class="con">
				<ul id="returnImageUl" class="addCover pic_delete clearfix">
				  <li class="fileListAfter addto""><a id="returnFilePicker" class="addCoverIcon"><i class="ico_add"></i><p>添加图片<br>(只限1张)</p></a></li>
				</ul>
				<p class="gray9">请上传清晰的产品图片，建议图片尺寸大小640px * 360px。</p>
				<p class="prompt" id="returnImageMsg"></p>
			</div>
		</li>          
	</ul>
</form>
</script>
<!-- 弹窗内容模板 end -->
<!-- 回报添加模板 start -->
<script id="returnTmpl" type="text/x-jquery-tmpl">
<li class="user-return-list">
	<input type="hidden" name="returnList[].returnId" data-name="returnId" value="{{= returnId}}">
	<input type="hidden" name="returnList[].supportAmount" data-name="supportAmount" value="{{= supportAmount}}">
	<input type="hidden" name="returnList[].upperCount" data-name="upperCount" value="{{= upperCount}}">
	<input type="hidden" name="returnList[].returnDescribe" data-name="returnDescribe" value="{{= returnDescribe}}">
	<input type="hidden" name="returnList[].imageId" data-name="imageId" value="{{= imageId}}">
	<input type="hidden" name="returnList[].imageUrl" data-name="imageUrl" value="{{= imageUrl}}">
	<input type="hidden" name="returnList[].imageExt" data-name="imageExt" value="{{= imageExt}}">
	<input type="hidden" name="returnList[].imageName" data-name="imageName" value="{{= imageName}}">
	<input type="hidden" name="returnList[].imageSize" data-name="imageSize" value="{{= imageSize}}">
	<div class="user-return-pic"><img src="{{= imageUrl}}" onclick="projectReturnController.showImage(this);"></div>
	<div class="user-return-tex01">
		<a href="javascript:;" onclick="projectReturnController.editReturnDialog(this);" class="fr">编辑</a>
		<p>支持<span id="supportAmountB" class="highlight2">{{= supportAmount}}</span>元</p>
	</div>
	<div class="user-return-tex02">
		<a href="javascript:;" onclick="projectReturnController.deleteReturn(this);" class="red fr">删除</a>
		<p id="returnDescribeP" class="user-return-textcn">{{= returnDescribe}}</p>
	</div>
</li>
</script>
<!-- 回报添加模板 end -->
<script id="detailContent" type="text/x-jquery-tmpl">
${projectDetail.content}
</script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit/projectReturnNot.js"></script>