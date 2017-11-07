<script>
var formcacheKey="coupleValid${projectId}";
</script>
<div class="sickRelatives sicknessbox">
	<div class="layout">
		<h2 class="mb30">项目验证<span>（夫妻验证）</span></h2>
		<form id="validationForm">
			<input type="hidden" id="projectType" value="${projectType}">
			<input type="hidden" id="projectId" name="projectId" value="${projectId}">
			<input type="hidden" name="validationType" value="${validationType}">
			<div class="sickwhiteBg">
				<h3 class="til">收款人信息</h3>
				<div class="formbox">
					<dl>
						<dt><span class="red">*</span>真实姓名</dt>
						<dd>
							<input type="text" id="receiveRealName" name="receiveRealName" validate="q|leng" leng="1,15" maxlength="15" class="input_txt wid92" placeholder="请填写收款人真实姓名">
							<p class="prompt" id="receiveRealNameMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>身份证号</dt>
						<dd>
							<input type="text" id="receiveIdCard" validate="q|leng|idCard" leng="1,18" maxlength="18" class="input_txt wid92" placeholder="请填写收款人身份证号">
							<p class="prompt" id="receiveIdCardMsg"></p>
							<input type="hidden" id="receiveIdCardVal" name="receiveIdCard">
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>联系手机</dt>
						<dd>
							<input type="text" id="receivePhone" name="receivePhone" validate="q|leng|m" leng="1,11" maxlength="11" class="input_txt" placeholder="请填写收款人联系手机">
							<p class="prompt" id="receivePhoneMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>手持身份证照片</dt>
						<dd>
							<ul id="receiveCardImage" class="addCover clearfix">
								<li class="fileListAfter">
									<a id="receiveCardImagePicker" class="addCoverIcon">
										<span>上传手持<br>身份证图片</span>
									</a>
								</li>
								<li class="exampleImage">
									<img class="defaultImage" src="${cardImgDefault}" alt="">
									<div class="cont">
										<p class="bg"></p>
										<span>示例图片</span>
									</div>
								</li>									
							</ul>
							<p class="prompt" id="receiveCardImageMsg"></p>
							<p class="tips">身份证上所有信息必须清晰可见，必须能看清身份证号</p>
						</dd>
					</dl>
				</div>
			</div>
			<div class="sickwhiteBg">
				<h3 class="til">受助人（患者）关系</h3>
				<div class="formbox">
					<dl>
						<dt><span class="red">*</span>真实姓名</dt>
						<dd>
							<input type="text" id="recipientRealName" name="recipientRealName" validate="q|leng" leng="1,15" maxlength="15" class="input_txt wid92" placeholder="请填写受助人真实姓名">
							<p class="prompt" id="recipientRealNameMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>身份证号</dt>
						<dd>
							<input type="text" id="recipient" validate="q|leng|idCard" leng="1,18" maxlength="18" class="input_txt wid92" placeholder="请填写受助人身份证号">
							<p class="prompt" id="recipientMsg"></p>
							<input type="hidden" id="recipientVal" name="recipient">
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>受助人手持身份证照片</dt>
						<dd>
							<div class="addImgBox">
								<ul id="recipientCardImageIds" class="addCover clearfix">
									<li class="fileListAfter">
										<a id="recipientCardImageIdsPicker" class="addCoverIcon">
											<span>上传手持<br>身份证图片</span>
										</a>
									</li>
									<li class="exampleImage">
										<img class="defaultImage" src="${cardImgDefault}" alt="">
										<div class="cont">
											<p class="bg"></p>
											<span>示例图片</span>
										</div>
									</li>									
								</ul>
							</div>
							<p class="prompt" id="recipientCardImageIdsMsg"></p>
							<p class="tips color999">1、身份证上所有信息必须清晰可见，必须能看清身份证号；<br>2、如受助人因病情原因不能拍照，由直系亲属手持本人身份证和受助人身份证同时拍照；<br>3、如受助人为儿童，需提供出生证明；</p>
						</dd>
					</dl>
				</div>
			</div>
			<div class="sickwhiteBg">
				<h3 class="til">收款人与受助人（患者）关系</h3>
				<div class="formbox">
					<dl>
						<dt><span class="red">*</span>结婚证照片</dt>
						<dd>
							<div class="addImgBox">
								<ul id="weddingPicture" class="addCover clearfix">
									<li class="fileListAfter">
										<a id="weddingPicturePicker" class="addCoverIcon">
											<span>上传结婚证<br>照片</span>
										</a>
									</li>
									<li class="exampleImage">
										<img class="defaultImage" src="${weddingImgDefault}" alt="">
										<div class="cont">
											<p class="bg"></p>
											<span>示例图片</span>
										</div>
									</li>
								</ul>
							</div>
							<input type="hidden" id="weddingPictureId" name="weddingPictureId">
							<input type="hidden" id="weddingPictureUrl" name="weddingPictureUrl">
							<p class="prompt" id="weddingPictureMsg"></p>					
							<p class="tips color999">请提供收款人和受助人（患者）结婚证</p>
						</dd>
					</dl>
				</div>
			</div>
			<div class="sickwhiteBg">
				<h3 class="til">医疗诊断证明</h3>
				<div class="formbox">
					<dl>
						<dt><span class="red">*</span>所患疾病</dt>
						<dd>
							<input type="text" id="disease" name="disease" validate="q|leng" leng="1,30" maxlength="30" class="input_txt wid92"  placeholder="请填写所患疾病">
							<p class="prompt" id="diseaseMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>医院名称</dt>
						<dd>
							<input type="text" id="hospitalName" name="hospitalName" validate="q|leng" leng="1,25" maxlength="25" class="input_txt wid92"  placeholder="请填写医院名称">
							<p class="prompt" id="hospitalNameMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>医院地址</dt>
						<dd>
							<span class="input-midle">
								<select name="province" regionId="" class="select_style province"></select>
								<select id="hospitalRegionId" name="hospitalRegionId" class="select_style city"></select>
							</span>
							<p class="prompt" id="hospitalRegionIdMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>医疗诊断证明</dt>
						<dd>
							<ul id="proveImgIds" class="addCover clearfix">
								<li class="fileListAfter">
									<a id="proveImgIdsPicker" class="addCoverIcon">
										<span>上传医疗诊断<br>结果照片<br>（最多6张）</span>
									</a>
								</li>
								<li class="exampleImage">
									<img class="defaultImage" src="${proveImgDefault}" alt="">
									<div class="cont">
										<p class="bg"></p>
										<span>示例图片</span>
									</div>
								</li>									
							</ul>
							<p class="prompt" id="proveImgIdsMsg"></p>
							<p class="tips">请提供带有医院公章的诊断结果照片</p>
						</dd>
					</dl>
				</div>
			</div>
			<p class="tc mb10">
				<a id="projectValidBtn" class="btn-public btn-w310 btn-blue">提交验证</a>
			</p>
		</form>
	</div>
</div>
<!-- 弹窗 -->
<div id="successDialog" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog">
	    <div class="title"><a href="#" class="out"></a>等待验证审核</div>
	    <div class="content">
	        <div class="dia_auto">
	        	<div class="tc">
              		<i class="timeWait-icon"></i>
              	</div>
	            <div class="tip_information">
					<div class="tips">
						<p class="f20 highlight">提交成功！请等待验证审核</p>
					</div> 
					<p class="tl pt20">亲爱的用户，您好！您的项目审核资料已经成功，我们的工作人员将会在1-2个工作日内完成审核，并通知到您，请耐心等待，谢谢您的合作！</p>
	            </div>
	        </div>
	        <div class="tc mt20"><a id="closeBtn" href="#" class="btn-public btn-w50h25 btn-blue">知道了</a>
	    </div>
	</div>
</div>
<!-- 弹窗 end-->
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>js/common/base64.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/formcache.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectStart.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectValid/validation_couple.js"></script>