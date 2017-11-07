<div class="personal-con clearfix">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>添加银行卡
	</h2>
	<ul class="user-tab-til clearfix">
		<li id="two1" onclick="bankListController.setTab('two',1,2)" class="hover">个人银行</li>
		<li id="two2" onclick="bankListController.setTab('two',2,2)">对公银行</li>
		<p class="animate_p">
			<span class="xmjt-arrow"></span>
		</p>
	</ul>
	<div class="public-form_info mt20 public-minheight">
		<form id="dataForm" action="">
			<input type="hidden" name="cardType" id="cardType" value="1" />
			<ul class="cell">
				<li>
					<div id="nameTitle" class="til">
						<span class="red">*</span>开户名：
					</div>
					<div id="personnal" class="info">${trueName }</div>
					<div id="unit" class="info hide">
						<input type="text" id="openAccountName"
								class="text_small_style focus_text" value="${trueName }" validate="q|maxleng" maxleng="25"/>
						<p class="prompt" id="openAccountNameMsg"></p>
					</div>
					<input type="hidden" id="cardUserName" name="cardUserName" value="${trueName }"  />
					
				</li>
				<li>
					<div class="til">
						<span class="red">*</span>开户银行：
					</div>
					<div class="info">
						<select name="bankId" class="select_style" style="width: 312px;"
							validate="q">
							<c:forEach var="item" items="${bankList }" varStatus="status">
								<option value="${item.id }">${item.bankName }</option>
							</c:forEach>
						</select>
					</div>
				</li>
				<li>
					<div class="til">
						<span class="red">*</span>开户行所在地：
					</div>
					<div class="info">
						<select name="" id="province" class="select_style province">
							<option value="">请选择</option>
						</select> <select id="city" name="bankRegionId" validate="q" class="select_style city">
							<option value="">请选择</option>
						</select> 
						<p class="prompt" id="cityMsg"></p>
					</div>
				</li>
				<li>
					<div class="til">
						<span class="red">*</span>支行名称：
					</div>
					<div class="info">
						<input type="text" name="branchBank" id="branchName"
							class="text_small_style focus_text" value="" validate="q|maxleng" maxleng="50"/>
						<p class="prompt" id="branchNameMsg"></p>
					</div>
				</li>
				<li>
					<div class="til">
						<span class="red">*</span>银行卡号：
					</div>
					<div class="info">
						<input type="text" id="cardNumber"
							class="text_small_style focus_text" value="" validate="q|reg|textv"
							reg="/^[0-9]{15,19}$/" warning="银行卡号格式不正确" info="q:银行卡号不能为空" textv="a" />
						<p class="prompt" id="cardNumberMsg"></p>
						<!-- 银行卡加密后密文 -->
						<input type="hidden" id="cardNumberEncrypt" name="cardNumberEncrypt" value=""/>
					</div>
				</li>
				<li>
					<div class="til">
						<span class="red">*</span>确认卡号：
					</div>
					<div class="info">
						<input type="text" id="cardNumber2"
							class="text_small_style focus_text" value="" validate="q|reg|textv"
							reg="/^[0-9]{15,19}$/" warning="确认卡号格式不正确" info="q:确认卡号不能为空" textv="b" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false"/>
						<p class="prompt" id="cardNumber2Msg"></p>
					</div>
				</li>
			</ul>
			<div class="tc mt30">
				<a href="javascript:void(0);" id="addBankSubmit"
					class="btn-public btn-w70 btn-blue">保存</a> <a
					href="javascript:void(0)"
					onclick="$('li#yhkgl a').click();"
					class="btn-public btn-w70 btn-gray ml30">取消</a>
				<!--用来清空表单数据-->
				<input type="reset" name="reset" style="display: none;" />
			</div>

		</form>
		<div class="gray_bg p20 lh26 mt50">
			<p class="highlight f16">温馨提示：</p>
			1. 如果您填写的开户支行不正确，可能将无法成功提现，由此产生的提现费用将不予返还。<br /> 2.
			如果您不确定开户行支行名称，可打电话到所在地银行的营业网点询问或上网查询。<br /> 3. 不支持提现至信用卡账户。
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>js/common/base64.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/common/formValidate.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/userSetting/addBankCard.js"></script>