
<div class="personal-con">
	<h2 class="user-public-h2">
		<i class="bord btn-blue"></i><span>个人资料</span>
	</h2>
	<div class="user-infoBox public-minheight">
		<form id="formData" action="">
			<dl>
				<dt>头像</dt>
				<dd>
					<div class="headImg">
					<img id="imageId"
						src="${userInfo.headUrl == null?'../images/temp/user_info_headimg.jpg':userInfo.headUrl}" />
					
					<!-- 上传选择文件 -->
					<div id="ui-upload-holder"  style="display:block;">
						<div id="ui-upload-txt">+上传头像</div>
						<input id="fileImageId" name="upFile" class="ui-upload-input"
							type="file"
							onchange="baseInfomationController.casePicUpload('fileImageId','imageFrontId','imageIdUrl','imageId')">
						<input id="imageFrontId" type="hidden" name="imageId"/> <input
							id="imageIdUrl" type="hidden" name="imageUrl"/>
					</div>
					<p class="prompt" id="fileImageIdMsg"></p>
					</div>
				</dd>
			</dl>
			<dl>
				<dt>
					<label class="input-til">用户昵称：</label>
				</dt>
				<dd>
					<input type="text" value="${userInfo.nickName}" id="nickName"
						validate="q|leng" leng="4,20" />
						<input type="hidden" value="${userInfo.nickName}" id="nickName1"
						name="nickName" />
					<p class="prompt" id="nickNameMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt>绑定手机号：</dt>
				<dd><c:choose>
						<c:when test="${userInfo.phoneNumber!=null && userInfo.phoneNumber!=''}">${userInfo.phoneNumber}</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose></dd>
			</dl>
			<p class="tc">
				<a class="btn-public btn-blue btn-w80" href="javascript:void(0)"
					id="tj">保存</a>
			</p>
		</form>
	</div>
</div>
<script type="text/javascript"
	src="<%=basePath%>js/common/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/common/formValidate.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/userSetting/basicInformation.js"></script>
