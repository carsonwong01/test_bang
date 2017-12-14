<style>
.webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 20px 15px;color: #fff;text-align: center;border-radius: 3px;overflow: hidden;padding-top: 60px;top: -60px;}
</style>
<script>
var projectFiles = new Array();
var file = {};
<c:forEach var="obj" items="${projectDetail.imgs}" varStatus="status">
	file = {};
	file.imageId = "${obj.fileId}";
	file.imageUrl = "${obj.addr}";
	file.imageExt = "${obj.extension}";
	file.imageName = "${obj.name}";
	file.imageSize = "${obj.accessorySize}";
	<c:if test="${obj.fileId eq projectDetail.coverImageId}">file.isDefault = "1"</c:if>
	projectFiles.push(file);
</c:forEach>
</script>
<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>编辑项目</h2>
<div class="user-subject-fill user-subject-box">
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
					<p class="tips">
						<c:if test="${projectDetail.type eq '1'}">大病救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明等照片，提高项目可信度。建议图片尺寸大小640px * 360px。</c:if>
						<c:if test="${projectDetail.type eq '2'}">灾难救助项目，建议上传受灾情况照片和受灾证明图片，提高项目可信度。建议图片尺寸大小640px * 360px。</c:if>
						<c:if test="${projectDetail.type eq '3'}">动物保护项目，建议上传动物拍照，提高项目可信度。建议图片尺寸大小640px * 360px。</c:if>
						<c:if test="${projectDetail.type eq '4'}">扶贫助学项目，建议上传家庭经济情况、财产证明和贫穷状况等照片，提高项目可信度。建议图片尺寸大小640px * 360px。</c:if>
						<c:if test="${projectDetail.type eq '5'}">其他救助项目，建议上传患者治疗中的照片、患者患病前后生活照对比、医院诊断证明等照片，提高项目可信度。建议图片尺寸大小640px * 360pxpx。</c:if>
					</p>
				</dd>
			</dl>
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
<script id="detailContent" type="text/x-jquery-tmpl">
${projectDetail.content}
</script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit/projectWelfareNot.js"></script>