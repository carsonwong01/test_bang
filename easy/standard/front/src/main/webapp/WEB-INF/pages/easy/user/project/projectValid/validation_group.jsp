<script>
<c:if test="${projectType eq '1'}">
	var formcacheKey="groupValid_diseaseRelief${projectId}";
</c:if>
<c:if test="${projectType eq '2'}">
	var formcacheKey="groupValid_disasterRelief${projectId}";
</c:if>
<c:if test="${projectType eq '3'}">
	var formcacheKey="groupValid_animalProtect${projectId}";
</c:if>
<c:if test="${projectType eq '4'}">
	var formcacheKey="groupValid_povertyRelief${projectId}";
</c:if>
<c:if test="${projectType eq '5'}">
	var formcacheKey="groupValid_otherRelief${projectId}";
</c:if>
<c:if test="${projectType eq '6'}">
	var formcacheKey="groupValid_return${projectId}";
</c:if>
<c:if test="${projectType eq '7'}">
	var formcacheKey="groupValid_dream${projectId}";
</c:if>
</script>
<div class="sickRelatives sicknessbox">
	<div class="layout">
		<h2 class="mb30">项目验证<span>（
			<c:if test="${projectType ne '6'}">组织机构验证</c:if>
			<c:if test="${projectType eq '6'}">企业验证</c:if>
			）</span></h2>
		<form id="validationForm">
			<li class='ldr' datr='${currUser.userId}'></li>
			<input type="hidden" id="projectType" value="${projectType}">
			<input type="hidden" id="projectId" name="projectId" value="${projectId}">
			<input type="hidden" name="validationType" value="${validationType}">
			<!-- 非产品急销企业验证 start -->
			<c:if test="${projectType ne '6'}">
				<%--<div class="sickwhiteBg">--%>
					<%--<h3 class="til">组织机构信息</h3>--%>
					<%--<div class="formbox">--%>
						<%--<dl>--%>
							<%--<dt><span class="red">*</span>组织名称</dt>--%>
							<%--<dd>--%>
								<%--<input type="text" id="organizationName" name="organizationName" validate="q|leng" leng="1,30" maxlength="30" class="input_txt wid92"   value="${currUser.realName}">--%>
								<%--<p class="prompt" id="organizationNameMsg"></p>--%>
							<%--</dd>--%>
						<%--</dl>--%>
						<%--<dl>--%>
							<%--<dt><span class="red">*</span>联系手机</dt>--%>
							<%--<dd>--%>
								<%--<input type="text" id="organizationPhone" name="organizationPhone" validate="q|leng|m" leng="1,11" maxlength="11" class="input_txt"  value="${currUser.userName}">--%>
								<%--<p class="prompt" id="organizationPhoneMsg"></p>--%>
							<%--</dd>--%>
						<%--</dl>--%>
						<%--<dl>--%>
							<%--<dt><span class="red">*</span>组织机构资质<br>证明</dt>--%>
							<%--<dd>--%>
								<%--<ul id="organizationAptitude" class="addCover clearfix">--%>
									<%--<li class="fileListAfter">--%>
										<%--<a id="organizationAptitudePicker" class="addCoverIcon">--%>
											<%--<span>上传资质<br>证明照片</span>--%>
										<%--</a>--%>
									<%--</li>--%>
								<%--</ul>--%>
								<%--<input type="hidden" id="organizationAptitudeId" name="organizationAptitudeId">--%>
								<%--<input type="hidden" id="organizationAptitudeUrl" name="organizationAptitudeUrl">--%>
								<%--<p class="prompt" id="organizationAptitudeMsg"></p>--%>
								<%--<p class="tips">请提供组织机构证明照片</p>--%>
							<%--</dd>--%>
						<%--</dl>--%>
						<%--<!-- 灾难救助、动物保护、扶贫助学、其他救助 start -->--%>
						<%--<c:if test="${projectType eq '2' || projectType eq '3' || projectType eq '4' || projectType eq '5'}">--%>
							<%--<dl>--%>
								<%--<dt><span class="red">*</span>资金用途证明（可多张）</dt>--%>
								<%--<dd>--%>
									<%--<ul id="useProveImgIds" class="addCover clearfix">--%>
										<%--<li class="fileListAfter">--%>
											<%--<a id="useProveImgIdsPicker" class="addCoverIcon">--%>
												<%--<span>--%>
													<%--上传项目<br>--%>
													<%--<c:if test="${projectType eq '2'}">受灾证明照片</c:if>--%>
													<%--<c:if test="${projectType eq '3' || projectType eq '4' || projectType eq '5'}">资金用途证明</c:if>--%>
												<%--</span>--%>
											<%--</a>--%>
										<%--</li>--%>
									<%--</ul>--%>
									<%--<p class="prompt" id="useProveImgIdsMsg"></p>--%>
									<%--<p class="tips">--%>
										<%--<c:if test="${projectType eq '2'}">请提供正规的受灾证明照片</c:if>--%>
										<%--<c:if test="${projectType eq '3'}">请提供资金用途证明或正规发票</c:if>--%>
										<%--<c:if test="${projectType eq '4'}">请提供贫困证明（或低保证明）和学校资质证明</c:if>--%>
										<%--<c:if test="${projectType eq '5'}">请提供可以证明需要他人帮助的证明材料</c:if>--%>
									<%--</p>--%>
								<%--</dd>--%>
							<%--</dl>--%>
						<%--</c:if>--%>
						<%--<!-- 灾难救助、动物保护、扶贫助学、其他救助 end -->--%>
						<%--<!-- 实现梦想 start -->--%>
						<%--<c:if test="${projectType eq '7'}">--%>
							<%--<dl>--%>
								<%--<dt><span class="red">*</span>项目相关证明材料（可多张）</dt>--%>
								<%--<dd>--%>
									<%--<ul id="projectProveImgIds" class="addCover clearfix">--%>
										<%--<li class="fileListAfter">--%>
											<%--<a id="projectProveImgIdsPicker" class="addCoverIcon">--%>
												<%--<span>上传项目<br>相关证明材料</span>--%>
											<%--</a>--%>
										<%--</li>--%>
									<%--</ul>--%>
									<%--<p class="prompt" id="projectProveImgIdsMsg"></p>--%>
									<%--<p class="tips">项目相关证明材料上的所有信息必须清晰可见</p>--%>
								<%--</dd>--%>
							<%--</dl>--%>
						<%--</c:if>--%>
						<%--<!-- 实现梦想 end -->--%>
					<%--</div>--%>
				<%--</div>--%>

				<div class="sickwhiteBg">
					<h3 class="til">支持基金会</h3>
					<div class="formbox">
						<dl>
							<dt><span class="red">*</span>基金会名称</dt>
							<dd>
								<select id="foundationName" name="foundationName" regionId="" class="select_style foundation">
									<option value="" >请选择</option>
									<c:forEach items="${foundations}" var="foundations">
										<option value="${foundations.foundationName}" >${foundations.foundationName}</option>
									</c:forEach>
								<%--<option value="0">请选择</option>--%>
									<%--<option value="中国华侨基金会">中国华侨基金会</option>--%>
									<%--<option value="中华少年儿童慈善救助基金会">中华少年儿童慈善救助基金会</option>--%>
									<%--<option value="中国少年儿童基金会">中国少年儿童基金会</option>--%>
									<%--<option value="中华社会救助基金会">中华社会救助基金会 </option>--%>
									<%--<option value="中国人口福利基金会">中国人口福利基金会</option>--%>
								</select>
								<%--<input type="text" id="foundationName" name="foundationName" validate="q|leng" leng="1,30" maxlength="30" class="input_txt wid92"  placeholder="请填写基金会名称">--%>
								<p class="prompt" id="foundationNameMsg"></p>
							</dd>
						</dl>
					</div>
				</div>

				<!-- 大病救助组织机构验证受助人信息、医疗信息 start -->
				<c:if test="${projectType eq '1'}">
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
									<input type="text" id="hospitalName" name="hospitalName" validate="q|leng" leng="1,25" maxlength="25" class="input_txt wid92"  value="${currUser.hospitalName}">
									<p class="prompt" id="hospitalNameMsg"></p>
								</dd>
							</dl>
							<dl>
								<dt><span class="red">*</span>医院地址</dt>
								<dd>
									<%--<span class="input-midle">--%>
									<input type="text" id="province" name="province"  class="select_style province"  value="${currUser.provinceId}">
									<input type="text" id="hospitalRegionId" name="hospitalRegionId" class="select_style city"  value="${currUser.cityId}">
										<%--<select name="province" regionId="" class="select_style province"></select>--%>
										<%--<select id="hospitalRegionId" name="hospitalRegionId" class="select_style city"></select>--%>
									<%--</span>--%>
									<p class="prompt" id="hospitalRegionIdMsg"></p>
								</dd>
							</dl>
							<dl>
								<dt><span class="red">*</span>医疗诊断证明</dt>
								<dd>
									<div class="addImgBox">
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
									</div>
									<p class="prompt" id="proveImgIdsMsg"></p>
									<p class="tips">请提供带有医院公章的诊断结果照片</p>
								</dd>
							</dl>
						</div>
					</div>

					<div class="sickwhiteBg">
						<h3 class="til">项目负责人信息</h3>
						<div class="formbox">
							<dl>
								<dt><span class="red">*</span>负责人姓名</dt>
								<dd>
									<input type="text" id="linkName" readonly="readonly" name="" value="${currUser.linkName}"  leng="1,15" maxlength="15" class="input_txt wid92">
									<p class="prompt" id="linkNameMsg"></p>
								</dd>
							</dl>
							<dl>
								<dt><span class="red"></span>联系电话</dt>
								<dd>
									<input type="text" id="mobilePhone" readonly="readonly" name="" value="${currUser.mobile}"  leng="1,15" maxlength="15" class="input_txt wid92">
									<p class="prompt" id="mobilePhoneMsg"></p>
								</dd>
							</dl>
							<dl>
								<dt><span class="red"></span>联系邮箱</dt>
								<dd>
									<input type="text" id="email" readonly="readonly" name="" value="${currUser.email}"  leng="1,15" maxlength="15" class="input_txt wid92">
									<p class="prompt" id="hospitalMailMsg"></p>
								</dd>
							</dl>
						</div>
					</div>
				</c:if>
				<!-- 大病救助组织机构验证受助人信息、医疗信息 end -->
			</c:if>
			<!-- 非产品急销企业验证 end -->
			<!-- 产品急销企业验证 start -->
			<c:if test="${projectType eq '6'}">
				<div class="sickwhiteBg">
					<h3 class="til">法人信息</h3>
					<div class="formbox">
						<dl>
							<dt><span class="red">*</span>法人姓名</dt>
							<dd>
								<input type="text" id="receiveRealName" name="receiveRealName" validate="q|leng" leng="1,15" maxlength="15" class="input_txt wid92" placeholder="请填写法人真实姓名">
								<p class="prompt" id="receiveRealNameMsg"></p>
							</dd>
						</dl>
						<dl>
							<dt><span class="red">*</span>身份证号</dt>
							<dd>
								<input type="text" id="receiveIdCard" validate="q|leng|idCard" leng="1,18" maxlength="18" class="input_txt wid92" placeholder="请填写法人身份证号">
								<p class="prompt" id="receiveIdCardMsg"></p>
								<input type="hidden" id="receiveIdCardVal" name="receiveIdCard">
							</dd>
						</dl>
						<dl>
							<dt><span class="red">*</span>联系手机</dt>
							<dd>
								<input type="text" id="receivePhone" name="receivePhone" validate="q|leng|m" leng="1,11" maxlength="11" class="input_txt" placeholder="请填写法人联系手机">
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
						<dl>
							<dt><span class="red">*</span>营业执照照片</dt>
							<dd>
								<ul id="organizationAptitude" class="addCover clearfix">
									<li class="fileListAfter">
										<a id="organizationAptitudePicker" class="addCoverIcon">
											<span>上传营业<br>执照图片</span>
										</a>
									</li>
								</ul>
								<input type="hidden" id="organizationAptitudeId" name="organizationAptitudeId">
								<input type="hidden" id="organizationAptitudeUrl" name="organizationAptitudeUrl">
								<p class="prompt" id="organizationAptitudeMsg"></p>
								<p class="tips">营业执照上的所有信息必须清晰可见</p>
							</dd>
						</dl>
					</div>
				</div>
			</c:if>
			<!-- 产品急销企业验证 end -->
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
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectValid/validation_group.js"></script>