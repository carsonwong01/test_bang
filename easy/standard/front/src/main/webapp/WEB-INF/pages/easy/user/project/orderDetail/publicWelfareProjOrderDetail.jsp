<!-- 公益订单详情 -->
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
				<ul class="cell">
					<!-- 只有从订单支持进来时才显示支持者昵称 -->
					<c:if test="${from=='ddzc' }">
						<li><div class="til">支持者：</div><div class="info"><b>${orderDetail.nickName}</b></div></li>
					</c:if>
					<li><div class="til">支持金额：</div><div class="info"> <span class="highlight2">${orderDetail.amount}元</span></div></li>
					<li><div class="til">订单编号：</div><div class="info">${orderDetail.orderNo}</div></li>
					<li><div class="til">交易时间：</div><div class="info">${orderDetail.supportTime}</div></li>
					<li><div class="til">交易方式：</div><div class="info">
							<c:if test="${orderDetail.tradeType=='300' }">
					京东支付
					</c:if><c:if test="${orderDetail.tradeType=='200' }">
					微信支付
					</c:if><c:if test="${orderDetail.tradeType=='100' }">
					通联支付
					</c:if>
						</div></li>
					<li><div class="til">留言：</div><div class="info">${orderDetail.message}</div></li>
					<!-- 退款信息 -->
					<c:if test="${orderDetail.status=='7' || orderDetail.status=='8' }">
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
				</ul>
				<p class="tc pt50 pb50">
					<a class="btn-public btn-w70 btn-blue" href="javascript:void(0)"
						onclick="javascript:window.opener=null;window.close();">关闭</a>
				</p>
			</div>
		</div>
	</div>
</div>
</div>

<script src="<%=basePath%>easy/js/home/user.js"></script>