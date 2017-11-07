<style>
.webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 20px 15px;color: #fff;text-align: center;border-radius: 3px;overflow: hidden;padding-top: 60px;top: -60px;}
</style>
<!-- 更新项目动态 -->
<div class="user-subject-con">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>更新动态
	</h2>
	<div class="user-subject-fill user-subject-box">
		<form id="dataForm" action="">
			<div class="formpage">
				<dl>
					<dt>
						<span class="red">*</span>更新内容:
					</dt>
					<dd>
						<textarea name="dynamicInfo" id="dynamicInfo" class="u-xmxq-text" cols="30" rows="5" maxlength="100" validate="q" least="1|100"></textarea>
						<span class="limitWord">0/100</span>
						<p class="prompt" id="dynamicInfoMsg"></p>
						<ul id="imgsIdsUl" class="addCover clearfix">
							<li class="fileListAfter">
								<a id="filePicker" class="addCoverIcon">
									<span>上传图片<br>（最多8张）</span>
								</a>
							</li>
						</ul>
						<p class="prompt" id="imgsIdsMsg"></p>
						<p class="tips">请勿在更新内容中上传支付二维码或引导用户发微信、支付宝红包、私人账号汇款等信息，一经发现，将严肃处理。</p>
					</dd>
				</dl>
			</div>
			<p class="tc mb10">
				<a class="btn-public btn-w70 btn-blue" id="addProjectDynamic">更新</a>
			</p>
		</form>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>js/common/formValidate.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script type="text/javascript" src="<%=basePath%>easy/js/user/project/projectStart.js"></script>
<script type="text/javascript" src="<%=basePath%>easy/js/user/project/addDynamic.js"></script>