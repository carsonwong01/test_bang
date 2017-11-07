<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 20px 15px;color: #fff;text-align: center;border-radius: 3px;overflow: hidden;padding-top: 60px;top: -60px;}
</style>
<h2 class="user-public-h2"><i class="hot-til-icon btn-blue"></i>编辑项目</h2>
<div class="user-subject-fill user-subject-box">
	<input type="hidden" id="returnCountMax" value="${returnCountMax - fn:length(projectDetail.dreamTargets)}"/>
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
				<dt><span class="red">*</span>运费说明</dt>
				<dd>
					<input type="text" id="freightDescribe" name="freightDescribe" value="${projectDetail.freight}" class="input_txt wid92" placeholder="请填写运费详情" validate="q|leng" leng="1,50" maxlength="50">
					<span class="limitWord">0/50</span>
					<p class="prompt" id="freightDescribeMsg"></p>
				</dd>
			</dl>
			<dl>
				<dt><span class="red">*</span>发货时间</dt>
				<dd>
					<input type="text" id="deliverDescribe" name="deliverDescribe" value="${projectDetail.postTimeText}" class="input_txt wid92" placeholder="请填写发货时间" validate="q|leng" leng="1,50" maxlength="50">
					<span class="limitWord">0/50</span>
					<p class="prompt" id="deliverDescribeMsg"></p>
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
								<c:if test="${entity.projectType eq '1'}">
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
			<div class="user-return-til">回报设置</div>
			<div class="user-return-mod">
				<ul id="returnUl">
				</ul>
				<a href="javascript:;" class="addareturn" onclick="projectReturnController.addReturnDialog();"><i class="jiaohao-icon tianjia-icon"></i>添加回报</a>
				<p class="prompt" id="returnUlMsg"></p>
			</div>
		</div>
		<p class="tc mb10">
			<a id="editProjectHaveBtn" class="btn-public btn-w70 btn-blue">确认修改</a>
		</p>
	</form>
</div>
<style>
.dialogBox .remove{top: 0px;cursor: pointer;background: url('<%=basePath%>easy/images/pop_icon.png') no-repeat -13px 0;width: 15px;height: 15px;display: inline-block;position: absolute;margin: -5px 0 0 52px;}
.dialogBox .fileListAfter input[type=file] {position: absolute !important;clip: rect(1px 1px 1px 1px);}
.dialogBox .file-item {width:60px;height:70px;}
.dialogBox .file-item .error {position: absolute;top: 0px;left: 0px;right: 0px;background: red;color: white;text-align: center;height: 20px;font-size: 8px;line-height: 23px;}
.dialogBox .webuploader-pick {position: relative;display: inline-block;cursor: pointer;padding: 4px;color: #acacac;text-align: center;border-radius: 3px;overflow: hidden;top:0px;}
</style>
<!-- 项目回报弹窗 start -->
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
<!-- 项目回报弹窗 end-->
<!-- 弹窗内容模板 start -->
<script id="returnDialogTmpl" type="text/x-jquery-tmpl">
<form id="returnForm" action="">
	<ul class="text_list2">
		<li>
			<div class="til"><span class="red">*</span>回报金额：</div>
			<div class="con">
				<span>
					<input id="supportAmount" type="text" validate="q|range|z" range="1,999999" maxlength="6" class="text_style" style="width:460px;" placeholder="请填写回报金额" value="{{= supportAmount}}"/>元
					<p class="prompt" id="supportAmountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til">回报数量：</div>
			<div class="con">
				<span>
					<input id="upperCount" type="text" validate="range|z" range="1,9999999" maxlength="7" class="text_style"  style="width:460px;" placeholder="不填写为无限量" value="{{= upperCount}}"/>份
					<p class="prompt" id="upperCountMsg"></p>
				</span>
			</div>
		</li>
		<li>
			<div class="til"><span class="red">*</span>回报内容：</div>
			<div class="con">
			<span>
				<textarea id="returnDescribe" cols="38" rows="4" validate="q|leng" leng="1,500" maxlength="500" class="textarea_style" style="width:460px" placeholder="填写回报的具体内容">{{= returnDescribe}}</textarea>
				<span class="limitWord areaTips">0/500</span>
				<p class="prompt" id="returnDescribeMsg"></p>
			</span>
			</div>
		</li>   
		<li>
			<div class="til">&nbsp; </div>
			<div class="con">
				<ul id="returnImageUl" class="addCover pic_delete clearfix">
				  <li class="fileListAfter addto""><a id="returnFilePicker" class="addCoverIcon"><i class="ico_add"></i><p>添加图片<br>(只限1张)</p></a></li>
				</ul>
				<p class="gray9">请上传清晰的产品图片，建议图片尺寸大小870px * 420px。</p>
				<p class="prompt" id="returnImageMsg"></p>
			</div>
		</li>          
	</ul>
</form>
</script>
<!-- 弹窗内容模板 end -->
<!-- 回报添加模板 start -->
<script id="returnTmpl" type="text/x-jquery-tmpl">
<li class="user-return-list">
	<input type="hidden" name="returnList[].returnId" data-name="returnId" value="{{= returnId}}">
	<input type="hidden" name="returnList[].supportAmount" data-name="supportAmount" value="{{= supportAmount}}">
	<input type="hidden" name="returnList[].upperCount" data-name="upperCount" value="{{= upperCount}}">
	<input type="hidden" name="returnList[].returnDescribe" data-name="returnDescribe" value="{{= returnDescribe}}">
	<input type="hidden" name="returnList[].imageId" data-name="imageId" value="{{= imageId}}">
	<input type="hidden" name="returnList[].imageUrl" data-name="imageUrl" value="{{= imageUrl}}">
	<input type="hidden" name="returnList[].imageExt" data-name="imageExt" value="{{= imageExt}}">
	<input type="hidden" name="returnList[].imageName" data-name="imageName" value="{{= imageName}}">
	<input type="hidden" name="returnList[].imageSize" data-name="imageSize" value="{{= imageSize}}">
	<div class="user-return-pic"><img src="{{= imageUrl}}" onclick="projectReturnController.showImage(this);"></div>
	<div class="user-return-tex01">
		<a href="javascript:;" onclick="projectReturnController.editReturnDialog(this);" class="fr">编辑</a>
		<p>支持<span id="supportAmountB" class="highlight2">{{= supportAmount}}</span>元</p>
	</div>
	<div class="user-return-tex02">
		<a href="javascript:;" onclick="projectReturnController.deleteReturn(this);" class="red fr">删除</a>
		<p id="returnDescribeP" class="user-return-textcn">{{= returnDescribe}}</p>
	</div>
</li>
</script>
<!-- 回报添加模板 end -->
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/user/project/projectEdit/projectReturnHave.js"></script>