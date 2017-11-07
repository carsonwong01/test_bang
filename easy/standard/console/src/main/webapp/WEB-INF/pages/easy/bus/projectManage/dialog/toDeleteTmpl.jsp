	<div class="popup-content-container-2">
		<div class="p30">
		<div class="f16 gray3">是否确认删除项目—{{= projectName}}（{{= projectNo}}）？</div> 
		<div class="f16 gray3"><em class="red pr5">（备注：删除项目将导致前台项目信息消失，支持金额返还，不可逆转，请谨慎操作）</em></div> 
          <form id="toDeleteTmplForm">
		    <!--业务管理->项目管理->删除项目模板-->
			<div> 
				<div class="f16 fb gray3"><em class="red pr5">*</em>删除意见：</div> 
				<div class="pr tl" style="margin: 10px 0px 0px 30px">
				   <textarea name="" cols="53" rows="5" class="border p10" validate="q|maxlength"  maxlength="200" id="deleteReasonId"></textarea>
					<p class="prompt" id="deleteReasonIdMsg"></p>
				</div>
				<span class="lh30" style="margin-left: 30px">200字以内</span> 
			</div> 
		 </form>
	   </div>
	</div>
