<div class="user-subject-con user-RealnameBox">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>实名认证
	</h2>
	<div class="RealnameBox public-minheight">
		<c:choose>
			<c:when test="${authInfo.auditStatus=='1' }">
				<!-- 认证后 -->
				<div class="afterRealname">
					<h3>
						<i class="ico"></i><span class="til">恭喜，您已通过实名认证！</span>
					</h3>
					<dl>
						<dt>真实姓名</dt>
						<dd>${authInfo.realName }</dd>
					</dl>
					<dl>
						<dt>身份证号</dt>
						<dd>${authInfo.idNumber }</dd>
					</dl>
					<dl>
						<dt>认证时间</dt>
						<dd>${authInfo.auditTime }</dd>
					</dl>
				</div>
				<!-- 认证后 end-->
			</c:when>
			<c:otherwise>
				<!-- 认证前 -->
				<form id="realNameForm" class="fromBox">
					<dl>
						<dt class="form-lab">真实姓名</dt>
						<dd>
							<input type="text" id="realName" name="realName" validate="q|zh" class="form-inp" info="zh:此项必须为中文"  warning="请填写真实姓名">
							 <p class="prompt" id="realNameMsg"></p>
						</dd>
					</dl>
					<dl>
						<dt class="form-lab">身份证号</dt>
						<dd>
							<input type="text" id="idNumber" validate="q|idCard" class="form-inp" warning="请填写身份证"/>
							<input type="hidden" id="idNumber1" name="idNumber" value="">
							 <p class="prompt" id="idNumberMsg"></p>
						</dd>
					</dl>
					<p class="tc">
						<a href="javascript:void(0)" id="authentSubmit" class="btn-public btn-blue btn-w70 ml50">提交认证</a>
					</p>
				</form>
				<!-- 认证前 end-->
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script type="text/javascript" src="<%=basePath %>js/common/base64.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/userSetting/verifyRealName.js"></script>