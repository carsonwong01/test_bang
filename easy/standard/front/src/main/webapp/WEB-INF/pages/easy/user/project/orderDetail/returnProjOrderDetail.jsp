<!-- 产品急销订单详情 -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easy/css/user.css" />
<div class="user-bg">
	<div class="wrap clearfix pt20">
		<div class="personal-con clearfix">
			<h2 class="user-public-h2">
				<i class="hot-til-icon btn-blue"></i>订单详情（<%@include
					file="/WEB-INF/pages/easy/user/project/orderDetail/orderStatus.jsp"%>）
			</h2>
			<!-- 基本信息 -->
			<div class="public-form_info mt20 public-minheight OrderBox">
				<form id="dataForm">
					<!-- 订单id -->
					<input type="hidden" id="orderNo" value="${orderDetail.orderNo}" />
					<input type="hidden" id="orderId" name="orderId"
						value="${orderDetail.orderId}" />
					<ul class="cell">
						<!-- 只有从订单支持进来时才显示支持者昵称 -->
						<c:if test="${from!='ddxq' }">
							<li><div class="til">支持者：</div>
								<div class="info">
									<b>${orderDetail.nickName}</b>
								</div></li>
						</c:if>
						<li><div class="til">支持金额：</div>
							<div class="info">
								<span class="highlight2">${orderDetail.amount}元</span>
							</div></li>
						<li><div class="til">订单编号：</div>
							<div class="info">${orderDetail.orderNo}</div></li>
						<li><div class="til">交易时间：</div>
							<div class="info">${orderDetail.supportTime}</div></li>
						<li><div class="til">交易方式：</div>
							<div class="info">
								<c:if test="${orderDetail.tradeType=='300' }">
					京东支付
					</c:if>
								<c:if test="${orderDetail.tradeType=='200' }">
					微信支付
					</c:if>
								<c:if test="${orderDetail.tradeType=='100' }">
					通联支付
					</c:if>
							</div></li>
						<li><div class="til">产品回报：</div>
							<div class="info">
								<em class="red pr5">${orderDetail.returnAmount}元</em> x
								${orderDetail.returnNumber}份
								<br/>
								${orderDetail.purposeText}
							</div>
						<!-- 只有开启收货地址、待退款、已退款才有下划线 -->
						<li
							<c:if test="${'1' == orderDetail.isLogistics || orderDetail.status=='7' || orderDetail.status=='8'}"> class="divider-line pb20" </c:if>><div
								class="til">留言：</div>
							<div class="info">${orderDetail.message}</div></li>

						<!-- 只有开启填写收货地址才有收货地址、物流信息 -->
						<c:if test="${'1'==orderDetail.isLogistics}">
							<!-- 快递、物流信息 :待收货、已收货-->
							<li><div class="til">收货人：</div>
								<div class="info">${orderDetail.receiverName}</div></li>
							<li><div class="til">联系电话：</div>
								<div class="info">${orderDetail.receiverPhone}</div></li>
							<li
								<c:if test="${ orderDetail.status=='7' || orderDetail.status=='8' || ( orderDetail.status=='4' && from=='qrfh') || ((orderDetail.courierCompany!=null && orderDetail.courierCompany!='' || orderDetail.courierNumber!=null && orderDetail.courierNumber!='' || orderDetail.sendTime!=null && orderDetail.sendTime!='') && (orderDetail.status=='5' || orderDetail.status=='6'))}">class="divider-line pb20"</c:if>><div
									class="til">收货地址：</div> <!-- 4-代发货（且发货入口）  5:待收货\r\n            6:已收货\r\n            7:待退款\r\n            8:已退款   -->
								<div class="info">${orderDetail.receiverAddr}${orderDetail.receiverDetailAddr}</div></li>
							<!-- 从确认收货入口进来的就不显示这一栏信息 -->
							<c:if test="${!(from=='qrfh' && orderDetail.status=='4')}">
								<c:if
									test="${orderDetail.courierNumber!=null && orderDetail.courierNumber!=''}">
									<li><div class="til">快递单号：</div>
										<div class="info">${orderDetail.courierCompany}</div></li>
								</c:if>

								<c:if
									test="${orderDetail.courierCompany!=null && orderDetail.courierCompany!=''}">
									<li><div class="til">物流公司：</div>
										<div class="info">${orderDetail.courierNumber}</div></li>
								</c:if>
								<!-- 待退款、已退款 才显示下划线 -->
								<c:if
									test="${orderDetail.sendTime!=null && orderDetail.sendTime!=''}">
									<li
										<c:if test="${ orderDetail.status=='7' || orderDetail.status=='8'}">class="divider-line pb20"</c:if>><div
											class="til">发货时间：</div>
										<div class="info">${orderDetail.sendTime}</div></li>
								</c:if>
							</c:if>
						</c:if>
						<!-- 退款信息 -->
						<c:if
							test="${orderDetail.status=='7' || orderDetail.status=='8' }">
							<li>
								<div class="til">退款原因：</div>
								<div class="info">
									<span class="red">${orderDetail.refundReason}</span>
								</div>
							</li>
							<c:if test=" ${orderDetail.status=='8' }">
								<li>
									<div class="til">退款时间：</div>
									<div class="info">
										<span class="red">${orderDetail.refundTime}</span>
									</div>
								</li>
							</c:if>
						</c:if>

						<!-- 填发货信息 -->
						<c:if test="${from=='qrfh' && orderDetail.status=='4'}">
							<li>
								<div class="til">发货详情：</div>
								<div class="info">
									<span>是否需要物流</span><input type="checkbox" class="ml10"
										id="isLogistics" checked="checked" value="1"> <input
										type="hidden" name="isLogistics" value="1" />
								</div>
							</li>
							<li name="logisticsInfo">
								<div class="til">
									<span class="public-formLabel">物流公司：</span>
								</div>
								<div class="info">
									<input type="text" class="text_small_style text_style"
										placeholder="填写物流公司" id="courierCompany" name="courierCompany"
										validate="q|maxleng" maxleng="50">
									<p class="prompt" id="courierCompanyMsg"></p>
								</div>
							</li>
							<li name="logisticsInfo">
								<div class="til">
									<span class="public-formLabel">快递单号：</span>
								</div>
								<div class="info">
									<input type="text" class="text_style text_small_style"
										placeholder="填写快递单号" id="courierNumber" name="courierNumber"
										validate="q|maxleng" maxleng="30" />
									<p class="prompt" id="courierNumberMsg"></p>
								</div>
							</li>

						</c:if>
					</ul>
				</form>
				<p class="tc pt50 pb50">
					<c:choose>
						<c:when test="${from=='qrfh' && orderDetail.status=='4'}">
							<!-- 从订单支持进来 且待发货-->
							<a class="btn-public btn-w70 btn-blue" id="comfirmDelivery">确认发货</a>
						</c:when>
						<%-- <c:when test="${from=='qrsh' && orderDetail.status=='5'}">
							<!--待收货货-->
							<a class="btn-public btn-w70 btn-blue" id="comfirmRecipt">确认收货</a>
						</c:when> --%>
					</c:choose>
					<a class="btn-public btn-w70 btn-blue" href="javascript:void(0)"
						onclick="javascript:window.opener=null;window.close();">关闭</a>
				</p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="<%=basePath%>js/common/formValidate.js"></script>
<script src="<%=basePath%>easy/js/user/orderDetail/orderDetail.js"></script>