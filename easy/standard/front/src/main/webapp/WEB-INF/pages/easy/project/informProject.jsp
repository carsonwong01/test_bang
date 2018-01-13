<div class="sicknessPage sicknessbox">
	<div class="layout">
		<h2>项目举报</h2>
		<form id="projectForm" action="" >
			<input type="hidden" id="projectType" name="projectType" value="${projectType}">
			<div class="formpage">
				<dl>
					<dt><em class="red pr5">*</em>项目ID</dt>
					<dd class="pr">
						<input type="text" id="" name="projectId" value="101801031722256419" class="input_txt wid92" validate="q|leng" leng="1,20" maxlength="20" placeholder="请填写举报人真实姓名">
						<span class="limitWord">0/20</span>
						<p class="prompt" id="projectIdMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt><em class="red pr5">*</em>举报人姓名</dt>
					<dd class="pr">
						<input type="text" id="name" name="name" class="input_txt wid92" validate="q|leng" leng="1,20" maxlength="20" placeholder="请填写举报人真实姓名">
						<span class="limitWord">0/20</span>
						<p class="prompt" id="projectNameMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt><em class="red pr5">*</em>联系电话</dt>
					<dd>
						<input type="text" id="phone" name="phone" maxlength="11" class="input_txt wid92" validate="q|leng" leng="1,11" placeholder="请填写举报人联系电话">
						<span class="limitWord">0/11</span>
						<p class="prompt" id="projectIntroMsg"></p>
					</dd>
				</dl>
				<dl>
					<dt><em class="red pr5">*</em>举报详情</dt>
					<dd>
						<textarea id="content" name="content" class="wid92" cols="30" rows="7" placeholder="请填写您举报该项目的原因与理由" maxlength="200"></textarea>
					</dd>
				</dl>
				<%--<dl>--%>
					<%--<dt><em class="red pr5">*</em>项目详情</dt>--%>
					<%--<dd>--%>
						<%--&lt;%&ndash;<textarea class="ub w100 radius fn-s-14 control-input" name="content" maxlength="200" validator="notEmpty;" title="举报原因" placeholder="请填写您举报该项目的原因与理由"></textarea>&ndash;%&gt;--%>
						<%--<textarea id="projectDetails" name="projectDetails" class="wid92" cols="30" rows="7" placeholder="请填写您举报该项目的原因与理由" maxlength="200"></textarea>--%>
						<%--<p id="projectDetailsTip" class="red display-table"></p>&nbsp;&nbsp;<p class="prompt display-table" id="projectDetailsMsg"></p>--%>
						<%--<ul id="projectImageUl" class="addCover clearfix">--%>
							<%--<li class="fileListAfter">--%>
								<%--<a id="filePicker" class="addCoverIcon">--%>
									<%--<span>上传图片<br>（最多6张）</span>--%>
								<%--</a>--%>
							<%--</li>--%>
						<%--</ul>--%>
						<%--<p class="prompt" id="coverImageIdMsg"></p>--%>
						<%--<input type="hidden" id="coverImageId" validate="q" info="q:请至少上传一张图片" name="coverImageId">--%>
						<%--<input type="hidden" id="coverImageUrl" name="coverImageUrl">--%>
					<%--</dd>--%>
				<%--</dl>--%>
				<!--附件-->
				<dl class="report-file">
					<span class="t-9 fn-s-12 ">附：</span>
					<a class="explain highlight"><span class="fn-s-12">《中华人民共和国民法通则》</span></a>
					<a class="explain highlight"><span class="fn-s-12">《中华人民共和国刑法》</span></a>
				</dl>
			</div>
			<p class="tc mb10">
				<a id="informProjectBtn" class="btn-public btn-w310 btn-blue">确认举报</a>
				<a onclick="history.back()"  class="btn-public btn-w310 btn-gray">取消</a>
			</p>
		</form>
	</div>
</div>
<!-- 弹窗 -->
<div id="raiseExplain" class="dialogBox" style="display: none;">
	<div class="popup_bg"></div>
	<div class="dialog">
		<div class="title"><a href="#" class="out"></a>筹款说明</div>
		<div class="content">
			<div class="dia_auto width-full">
				<div class="tip_information">
					<div class="tips">
						<span class="f20 gray3">${textInstruct}</span>
					</div>
				</div>
			</div>
			<div class="tc mt20"><a id="closeBtn" href="#" class="btn-public btn-w50h25 btn-blue">知道了</a>
			</div>
		</div>
	</div>
</div>

<!-- 富文本编辑器的css和js文件begin -->
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=basePath%>js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<!-- 富文本编辑器的css和js文件end -->
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/formcache.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/home/webuploader.js"></script>
<script language="javascript" src="<%=basePath %>easy/js/project/informStart.js"></script>
<!-- 公共：form表单缓存、附件上传、富文本 -->
<script language="javascript" src="<%=basePath %>easy/js/project/informProject.js"></script>










