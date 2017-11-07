<!-- 提前结束项目 -->
<div class="user-subject-con">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>提前结束
	</h2>
	<div class="user-subject-fill user-subject-box">
		<form id="dataForm" action="">
			<div class="formpage">
				<dl>
					<dt>
						<span class="red">*</span> 提前结束原因:
					</dt>
					<dd>
						<textarea id="finishReason" name="finishReason" class="u-xmxq-text" maxlength="100" cols="30" rows="5" validate="q" least="1|100"></textarea>
						<span class="limitWord">0/100</span>
						<p class="prompt" id="finishReasonMsg"></p>
					</dd>
					
				</dl>
			</div>
			<p class="tc mb10">
				<a class="btn-public btn-w70 btn-blue" id="aheadEndProject">提交</a>
			</p>
		</form>
	</div>
</div>

<!-- 弹窗 -->
<div id="successDialog" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog">
	    <div class="title">提示信息<a href="#" class="out"></a></div>
	    <div class="content">
	        <div class="dia_auto">
	        	<div class="tc">
              		<i class="timeWait-icon"></i>
              	</div>
	            <div class="tip_information">
					<div class="tips">
						<p class="f20 highlight">项目提前结束成功！</p>
					</div> 
					<p id="successContent" class="tl pt20"></p>
	            </div>
	        </div>
	        <div class="tc mt20"><a id="goProject" href="#" class="btn-public btn-w50h25 btn-blue">查看项目</a></div>
	        <div class="tc mt20"><a id="goMyAccount" href="#" class="btn-public btn-w50h25 btn-blue">查看我的账户 </a></div>
	    </div>
	</div>
</div>
<!-- 弹窗 end-->
<!-- 错误提示弹窗 start -->
<div id="errorMsgDialog" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog">
	    <div class="title"><a href="#" class="out"></a>提示消息</div>
	    <div class="content">
	        <div class="dia_auto">
	            <div class="tip_information">
					<div class="tips">
						<span class="error"></span><span class="f20 red">无法提前结束</span>
					</div> 
					<p class="tc pt20">因项目筹资金额为0，无法提前结束项目！</p>
	            </div>
	        </div>
	        <div class="tc mt20"><a id="errorMsgDialogBtn" href="#" class="btn-public btn-w50h25 btn-blue">确定</a>
	    </div>
	</div>
</div>
<!-- 错误提示弹窗 end -->
<form action="" id="goForm">
	<input id="gOProjectId" name="projectId" value=""/>
</form>
<script type="text/javascript"
	src="<%=basePath%>js/common/formValidate.js"></script>
<script type="text/javascript" src="<%=basePath%>easy/js/user/project/aheadEndProject.js"></script>