<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>编辑项目</h2>
<div class="user-subject-fill user-subject-box">
	<input type="hidden" id="targetCountMax" value="${targetCountMax - fn:length(projectDetail.dreamTargets)}"/>
	<form id="projectForm" action="" >
		<input type="hidden" id="projectId" name="projectId" value="${projectDetail.id}">
		<input type="hidden" name="isOrdered" value="1">
		<div class="formpage">
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
				<dt><span class="red">*</span>项目标签<br><span class="f12 lh16 gray9">（最多可选2个)</span></dt>
				<dd>
					<div class="user-xmbq-til">
						<ul id="labels" class="clearfix">
							<c:forEach var="entity" items="${labels}" varStatus="status">
								<c:set var="labelTemp" value=","/>
								<c:set var="labelName" value="${labelTemp}${entity.labelName}${labelTemp}"/>
								<c:if test="${entity.projectType eq '2'}">
									<li><a href="javascript:;" <c:if test="${fn:contains(projectDetail.label,labelName)}">class="cur"</c:if>>${entity.labelName}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<input type="hidden" id="projectLabel" validate="q" info="q:至少选择一个标签" name="projectLabel" value="${projectDetail.label}">
						<p class="prompt" id="projectLabelMsg"></p>
					</div>
				</dd>
			</dl>
		</div>
		<div class="user-return-con">
			<div class="user-return-til">梦想目标</div>
			<div class="user-return-mod">
				<ul id="returnUl">
				</ul>
				<a href="javascript:;" class="addareturn" onclick="projectDreamController.addReturnDialog();"><i class="jiaohao-icon tianjia-icon"></i>添加梦想目标</a>
				<p class="prompt" id="returnUlMsg"></p>
			</div>
		</div>
		<p class="tc mb10">
			<a id="editProjectHaveBtn" class="btn-public btn-w70 btn-blue">确认修改</a>
		</p>
	</form>
</div>
<!-- 项目梦想目标弹窗 start -->
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
<!-- 项目梦想目标弹窗 end-->
<!-- 弹窗内容模板 start -->
<script id="returnDialogTmpl" type="text/x-jquery-tmpl">
<form id="returnForm" action="">
	<ul class="text_list2">
		<li>
			<div class="til"><span class="red">*</span>目标金额：</div>
			<div class="con">
				<span>
					<input id="supportAmount" type="text" validate="q|range|z" range="1,999999" maxlength="6" class="text_style" style="width:460px;" placeholder="请填写目标金额" value="{{= supportAmount}}"/>元
					<p class="prompt" id="supportAmountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til"><span class="red">*</span>资金用途：</div>
			<div class="con">
			<span>
				<textarea id="returnDescribe" cols="38" rows="4" validate="q|leng" leng="1,500" maxlength="500" class="textarea_style" style="width:460px" placeholder="填写资金用途">{{= returnDescribe}}</textarea>
				<span class="limitWord areaTips">0/500</span>
				<p class="prompt" id="returnDescribeMsg"></p>
			</span>
			</div>
		</li>   
	</ul>
</form>
</script>
<!-- 弹窗内容模板 end -->
<!-- 梦想目标添加模板 start -->
<script id="returnTmpl" type="text/x-jquery-tmpl">
<li class="user-return-list noimg">
	<input type="hidden" name="targetList[].returnId" data-name="returnId" value="{{= returnId}}">
	<input type="hidden" name="targetList[].supportAmount" data-name="supportAmount" value="{{= supportAmount}}">
	<input type="hidden" name="targetList[].returnDescribe" data-name="returnDescribe" value="{{= returnDescribe}}">
	<div class="user-return-tex01">
		<a href="javascript:;" onclick="projectDreamController.editReturnDialog(this);" class="fr">编辑</a>
		<p>目标<span id="supportAmountB" class="highlight2">{{= supportAmount}}</span>元</p>
	</div>
	<div class="user-return-tex02">
		<a href="javascript:;" onclick="projectDreamController.deleteReturn(this);" class="red fr">删除</a>
		<p id="returnDescribeP" class="user-return-textcn">{{= returnDescribe}}</p>
	</div>
</li>
</script>
<!-- 梦想目标添加模板 end -->
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit/projectDreamHave.js"></script>