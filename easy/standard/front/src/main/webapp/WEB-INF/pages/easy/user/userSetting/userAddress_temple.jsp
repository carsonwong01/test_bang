<div class="user-subject-con user-ShippingAddress">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>收货地址
	</h2>
	<div
		class="user-table-box clearfix pt20 public-table-zxs public-minheight">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
					<th colspan="4"><i class="th_icon"></i><span class="til">最多添加
							${maxCount }个收货地址，你还可以添加 ${ maxCount - addressList.size() } 个收货地址</span></th>
				</tr>
				<c:forEach var="item" items="${addressList }" varStatus="status">
					<tr>
						<td class="td-icon"><c:if test="${item.isDefault=='1' }">
								<i></i>
								<span class="va_m pl5 highlight">默认</span>
							</c:if></td>
						<td class="td-adr">
							<p>${item.userName }(${item.phoneNumber})</p>
							<p>${item.area }${item.detaileAddress }</p>
						</td>
						<td><c:if test="${item.isDefault!='1' }">
								<a href="javascript:void(0)" class="setDefaultAddress"
									id="${item.addressId }">设为默认</a>
							</c:if></td>
						<td class="td-handle">
							<div class="actionBox">
								<a href="javascript:void(0)" class="modifyAddress"
									id="${item.addressId }">修改</a> <span class="text-explode">|</span>
								<a class="del-handle">删除</a>
							</div>
							<div class="delBox">
								<span>确定要删除？</span> <a href="javascript:void(0)" class="btn-public btn-w50 btn-blue ml5 deleteAddressSubmit" addressId="${item.addressId }">确定</a>
								<a class="btn-public btn-w50 btn-gray cancle">取消</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<c:if test="${addressList.size()<maxCount }">
				<tfoot>
					<tr>
						<td colspan="4"><a href="javascript:void(0)" class="addBtn-a"><i></i><span
								class="highlight" id="addAddress">添加收货地址</span></a></td>
					</tr>
				</tfoot>
			</c:if>
		</table>
	</div>
</div>


<!-- 弹窗 -->
<div id="dialogBox" class="dialogBox"></div>
<!-- 弹窗 end-->
<script id="editAddressTemp" type="text/x-jquery-tmpl">
	<div class="popup_bg" style="background: none"></div>
	<div class="dialog dialog_big">
		<div class="title">
			<a href="javascript:void(0)" class="out close"></a>{{if operationType==0 }}添加{{/if}}{{if operationType==1 }}修改{{/if}}收货地址
		</div>
		<div class="content">
			<div class="dia_auto">
				<form id="formData" action="">
					<input type="hidden" id="operationType" name="operationType" value="{{= operationType}}"/>
					<input type="hidden" id="addrId" name="addrId" value="{{= addrId}}"/>
					<ul class="text_list2">
						<li>
							<div class="til">
								<span class="red">*</span>收货人：
							</div>
							<div class="con">
								<input name="consigneeName" id="consigneeName" type="text" class="text_style"
									style="width: 460px;"  validate="q|maxleng|zh" value="{{= consigneeName}}" maxleng="25" validate="q|zh" class="form-inp" info="zh:此项必须为中文" />
									<p class="prompt" id="consigneeNameMsg"></p>
							</div>
						</li>
						<li>
							<div class="til">
								<span class="red">*</span>联系电话：
							</div>
							<div class="con">
								<input name="consigneePhone" id="consigneePhone" type="text" class="text_style"
									style="width: 460px;" validate="q|m"  warning="手机号码格式不正确" value="{{= consigneePhone}}"/>
									<p class="prompt" id="consigneePhoneMsg"></p>
							</div>
						</li>
						<li>
							<div class="til">
								<span class="red">*</span>所在地区：
							</div>
							<div class="con">
								<select id="province"  regionId="{{= consigneeCity}}"  class="public-border province">
									<option value="">请选择</option>
								</select> <select id="city" class="public-border ml10 city">
									<option value="">请选择</option>
								</select> <select id="consigneeCity" name="consigneeCity" class="public-border ml10 county"   validate="q">
									<option value="">请选择</option>
								</select>
								 <p class="prompt" id="consigneeCityMsg"></p>
							</div>
						</li>
						<li>
							<div class="til">
								<span class="red">*</span>详细地址：
							</div>
							<div class="con">
								<input id="consigneeAddress" name="consigneeAddress" type="text" class="text_style"
									style="width: 460px;"  validate="q|maxleng" value="{{= consigneeAddress}}" maxleng="50"/>
									<p class="prompt" id="consigneeAddressMsg"></p>
							</div>
						</li>
					</ul>
				</form>
			</div>
			<div class="tc">
				<a href="javascript:void(0)" id="saveAddressSubmit" class="btn-public btn-w50h25 btn-blue">保存</a> <a
					 href="javascript:void(0)" class="btn-public btn-w50h25 btn-gray close">取消</a>
			</div>
		</div>
	</div>
</script>
<script type="text/javascript"
	src="<%=basePath%>js/common/formValidate.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/userSetting/userAddress.js"></script>