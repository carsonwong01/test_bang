<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
var projectReceiveCardFiles = new Array();
var proveFiles = new Array();
var useProveFiles = new Array();
var projectProveFiles = new Array();
var file = {};
//收款人身份证图片
<c:forEach var="obj" items="${dataMap.receiveCardImageIds}" varStatus="status">
	file = {};
	file.imageId = "${obj.fileId}";
	file.imageUrl = "${obj.addr}";
	file.imageExt = "${obj.extension}";
	file.imageName = "${obj.name}";
	file.imageSize = "${obj.accessorySize}";
	projectReceiveCardFiles.push(file);
</c:forEach>
//医疗证明图片
<c:forEach var="obj" items="${dataMap.proveImgIds}" varStatus="status">
	file = {};
	file.imageId = "${obj.fileId}";
	file.imageUrl = "${obj.addr}";
	file.imageExt = "${obj.extension}";
	file.imageName = "${obj.name}";
	file.imageSize = "${obj.accessorySize}";
	proveFiles.push(file);
</c:forEach>
//资金用途证明图片
<c:forEach var="obj" items="${dataMap.useProveImgIds}" varStatus="status">
	file = {};
	file.imageId = "${obj.fileId}";
	file.imageUrl = "${obj.addr}";
	file.imageExt = "${obj.extension}";
	file.imageName = "${obj.name}";
	file.imageSize = "${obj.accessorySize}";
	useProveFiles.push(file);
</c:forEach>
//项目相关材料证明图片
<c:forEach var="obj" items="${dataMap.projectProveImgIds}" varStatus="status">
	file = {};
	file.imageId = "${obj.fileId}";
	file.imageUrl = "${obj.addr}";
	file.imageExt = "${obj.extension}";
	file.imageName = "${obj.name}";
	file.imageSize = "${obj.accessorySize}";
	projectProveFiles.push(file);
</c:forEach>
</script>
<div class="sicknessPersonal sicknessbox">
	<div class="layout">
		<h2 class="mb30">项目验证<span>（<c:if test="${projectType eq '1'}">本人</c:if><c:if test="${projectType ne '1'}">个人</c:if>验证）</span></h2>
		<form id="validationForm">
			<input type="hidden" id="projectType" value="${dataMap.singleResult.projectType}">
			<input type="hidden" id="projectId" name="projectId" value="${dataMap.singleResult.projectId}">
			<input type="hidden" name="validationType" value="${dataMap.singleResult.validationType}">
			<input type="hidden" name="validationId" value="${dataMap.singleResult.validationId}">
			
			<div class="sickwhiteBg">
				<h3 class="til"><c:if test="${projectType eq '1'}">收款人</c:if><c:if test="${projectType ne '1'}">本人</c:if>信息</h3>
				<div class="formbox">
					<dl>
						<dt><span class="red">*</span>真实姓名</dt>
						<dd>
							<input type="text" id="receiveRealName" name="receiveRealName" value="${dataMap.singleResult.receiveRealName}" validate="q|leng" leng="1,15" maxlength="15" class="input_txt wid92" placeholder="请填写<c:if test="${projectType eq '1'}">收款人</c:if><c:if test="${projectType ne '1'}">本人</c:if>真实姓名">
							<p class="prompt" id="receiveRealNameMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>身份证号</dt>
						<dd>
							<input type="text" id="receiveIdCard" value="${dataMap.singleResult.receiveIdCard}" validate="q|leng|idCard" leng="1,18" maxlength="18" class="input_txt wid92" placeholder="请填写<c:if test="${projectType eq '1'}">收款人</c:if><c:if test="${projectType ne '1'}">本人</c:if>身份证号">
							<p class="prompt" id="receiveIdCardMsg"></p>
							<input type="hidden" id="receiveIdCardVal" name="receiveIdCard">
						</dd>
					</dl>
					<dl>
						<dt><span class="red">*</span>联系手机</dt>
						<dd>
							<input type="text" id="receivePhone" name="receivePhone" value="${dataMap.singleResult.receivePhone}" validate="q|leng|m" leng="1,11" maxlength="11" class="input_txt" placeholder="请填写<c:if test="${projectType eq '1'}">收款人</c:if><c:if test="${projectType ne '1'}">本人</c:if>联系手机">
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
					
					<!-- 灾难救助、动物保护、扶贫助学、其他救助 -->
					<c:if test="${dataMap.singleResult.projectType eq '2' || dataMap.singleResult.projectType eq '3' || dataMap.singleResult.projectType eq '4' || dataMap.singleResult.projectType eq '5'}">
						<dl>
							<dt><span class="red">*</span>资金用途证明</dt>
							<dd>
								<ul id="useProveImgIds" class="addCover clearfix">
									<li class="fileListAfter">
										<a id="useProveImgIdsPicker" class="addCoverIcon">
											<span>
												上传项目<br>
												<c:if test="${dataMap.singleResult.projectType eq '2'}">受灾证明照片</c:if>
												<c:if test="${dataMap.singleResult.projectType eq '3' || dataMap.singleResult.projectType eq '4' || dataMap.singleResult.projectType eq '5'}">资金用途证明</c:if>
											</span>
										</a>
									</li>
								</ul>
								<p class="prompt" id="useProveImgIdsMsg"></p>
								<p class="tips">
									<c:if test="${dataMap.singleResult.projectType eq '2'}">请提供正规的受灾证明照片</c:if>
									<c:if test="${dataMap.singleResult.projectType eq '3'}">请提供资金用途证明或正规发票</c:if>
									<c:if test="${dataMap.singleResult.projectType eq '4'}">请提供贫困证明（或低保证明）和学校资质证明</c:if>
									<c:if test="${dataMap.singleResult.projectType eq '5'}">请提供可以证明需要他人帮助的证明材料</c:if>
								</p>
							</dd>
						</dl>
					</c:if>
					
					<!-- 实现梦想 -->
					<c:if test="${dataMap.singleResult.projectType eq '7'}">
						<dl>
							<dt><span class="red">*</span>项目相关证明材料（可多张）</dt>
							<dd>
								<ul id="projectProveImgIds" class="addCover clearfix">
									<li class="fileListAfter">
										<a id="projectProveImgIdsPicker" class="addCoverIcon">
											<span>上传项目<br>相关证明材料</span>
										</a>
									</li>
								</ul>
								<p class="prompt" id="projectProveImgIdsMsg"></p>
								<p class="tips">项目相关证明材料上的所有信息必须清晰可见</p>
							</dd>
						</dl>
					</c:if>
					
				</div>
			</div>
			
			<!-- 大病救助 -->
			<c:if test="${dataMap.singleResult.projectType eq '1'}">
				<div class="sickwhiteBg">
					<h3 class="til">医疗诊断证明</h3>
					<div class="formbox">
						<dl>
							<dt><span class="red">*</span>所患疾病</dt>
							<dd>
								<input type="text" id="disease" name="disease" value="${dataMap.singleResult.disease}" validate="q|leng" leng="1,30" maxlength="30" class="input_txt wid92"  placeholder="请填写所患疾病">
								<p class="prompt" id="diseaseMsg"></p>
							</dd>
						</dl>
						<dl>
							<dt><span class="red">*</span>医院名称</dt>
							<dd>
								<input type="text" id="hospitalName" name="hospitalName" value="${dataMap.singleResult.hospitalName}" validate="q|leng" leng="1,25" maxlength="25" class="input_txt wid92"  placeholder="请填写医院名称">
								<p class="prompt" id="hospitalNameMsg"></p>
							</dd>
						</dl>
						<dl>
							<dt><span class="red">*</span>医院地址</dt>
							<dd>
								<span class="input-midle">
									<select name="province" regionId="${dataMap.singleResult.hospitalRegionId}" class="select_style province"></select>
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
			</c:if>
			
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
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectValid/editValidation_myself.js"></script>