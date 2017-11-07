<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>编辑项目</h2>
<div class="user-subject-fill user-subject-box">
	<form id="projectForm" action="" >
		<input type="hidden" id="projectId" name="projectId" value="${projectDetail.id}">
		<input type="hidden" name="isOrdered" value="1">
		<div class="formpage">
			<dl>
				<dt><span class="red">*</span>目标金额</dt>
				<dd>
					<input type="text" id="targetAmount" name="targetAmount" value="${projectDetail.facTarget}" class="input_txt" validate="q|range|z" range="${projectDetail.facTarget > projectAmountMin ? projectDetail.facTarget : projectAmountMin},9999999" maxlength="7" placeholder="请填写目标金额">
					<span class="unit">元</span>
					<p class="prompt" id="targetAmountMsg"></p>
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
				<dt><span class="red">*</span>修改原因:</dt>
				<dd>
					<textarea id="modifyReason" name="modifyReason" validate="q|leng" leng="1,50" maxlength="50" class="u-xmxq-text" cols="30" rows="5" placeholder="建议详细描述受助人的基本情况：如家庭背景、经济状况、患病经历等。"></textarea>
					<span class="limitWord">0/50</span>
					<p class="prompt" id="modifyReasonMsg"></p>
				</dd>
			</dl>
		</div>
		<p class="tc mb10">
			<a id="editProjectHaveBtn" class="btn-public btn-w70 btn-blue">确认修改</a>
		</p>
	</form>
</div>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit/projectWelfareHave.js"></script>