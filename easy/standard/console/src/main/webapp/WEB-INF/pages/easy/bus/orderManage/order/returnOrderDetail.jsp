
<!-- 回报订单详情 -->
<ul class="gray6 pt20">
	<!-- 订单基本信息 -->
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">订单状态：</span>
			<div class="tl h30 lh30">
				<em class="red pr5"> <c:if test="${orderDetail.status=='1' }">
					待支付
					</c:if> <c:if test="${orderDetail.status=='2' }">
					已取消
					</c:if> <c:if test="${orderDetail.status=='3' }">
					已支付
					</c:if> <c:if test="${orderDetail.status=='4' }">
					待发货
					</c:if> <c:if test="${orderDetail.status=='5' }">
					待收货
					</c:if> <c:if test="${orderDetail.status=='6' }">
					已收货
					</c:if> <c:if test="${orderDetail.status=='7' }">
					待退款
					</c:if> <c:if test="${orderDetail.status=='8' }">
					已退款
					</c:if> <c:if test="${orderDetail.status=='9' }">
					已失败
					</c:if>

				</em>
			</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">订单编号：</span>
			<div class="tl h30 lh30">${orderDetail.orderNo }</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">交易时间：</span>
			<div class="tl h30 lh30">${orderDetail.supportTime }</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">交易方式：</span>
			<div class="tl h30 lh30">
				<c:if test="${orderDetail.tradeType=='300' }">
					京东支付
					</c:if>
				<c:if test="${orderDetail.tradeType=='200' }">
					微信支付
					</c:if>
				<c:if test="${orderDetail.tradeType=='100' }">
					通联支付
					</c:if>
			</div>
		</div>
	</li>
	<li class="mb20">
		<hr />
	</li>
	<!-- 商品信息 -->
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">支持项目：</span>
			<div class="tl h30 lh30">
				<a
					href="<%=basePath %>bus/projectManage/projectDetails.do?projectId=${orderDetail.projectId}&type=${orderDetail.projectType }"
					target="_blank" class="link-blue mr20">${orderDetail.projectTile}</a>

			</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">支持者：</span>
			<div class="tl h30 lh30">${orderDetail.userName}</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">昵称：</span>
			<div class="tl h30 lh30">${orderDetail.nickName}</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">支持金额：</span>
			<div class="tl h30 lh30">
				<em class="red pr5">${orderDetail.amount}</em>元
			</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">产品回报：</span>
			<div class="tl h30 lh30">
				<em class="red pr5">${orderDetail.returnAmount}元</em> x
				${orderDetail.returnNumber}份
			</div>
			<div class="tl h30 lh30">${orderDetail.purposeText}</div>
		</div>
	</li>
	<li class="mb20">
		<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">留言：</span>
			<div class="tl h30 lh30">${orderDetail.message}</div>
		</div>
	</li>
	<!-- 只有开启填写收货地址才有收货地址、物流信息 -->
	<c:if test="${'1'==orderDetail.isLogistics}">
		<li class="mb20">
			<hr />
		</li>
		<!-- 收货人信息 -->
		<li class="mb20">
			<div class="pr mh30 pl160">
				<span class="display-ib w140 lh30 tr mr5 pa left0 top0">收货人：</span>
				<div class="tl h30 lh30">${orderDetail.receiverName}</div>
			</div>
		</li>
		<li class="mb20">
			<div class="pr mh30 pl160">
				<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
				<div class="tl h30 lh30">${orderDetail.receiverPhone}</div>
			</div>
		</li>
		<li class="mb20">
			<div class="pr mh30 pl160">
				<span class="display-ib w140 lh30 tr mr5 pa left0 top0">所在地区：</span>
				<div class="tl h30 lh30">${orderDetail.receiverAddr}</div>
			</div>
		</li>
		<li class="mb20">
			<div class="pr mh30 pl160">
				<span class="display-ib w140 lh30 tr mr5 pa left0 top0">详细地址：</span>
				<div class="tl h30 lh30">${orderDetail.receiverDetailAddr}</div>
			</div>
		</li>

		<!-- 物流信息 -->

		<c:if test="${orderDetail.status=='5' && orderDetail.status=='6' }">
			<li class="mb20">
				<hr />
			</li>
			<c:if
				test="${orderDetail.courierCompany!=null && orderDetail.courierCompany!=''}">
				<li class="mb20">
					<div class="pr mh30 pl160">
						<span class="display-ib w140 lh30 tr mr5 pa left0 top0">物流公司：</span>
						<div class="tl h30 lh30">${orderDetail.courierCompany}</div>
					</div>
				</li>
			</c:if>
			<c:if
				test="${orderDetail.courierNumber!=null && orderDetail.courierNumber!=''}">
				<li class="mb20">
					<div class="pr mh30 pl160">
						<span class="display-ib w140 lh30 tr mr5 pa left0 top0">快递单号：</span>
						<div class="tl h30 lh30">${orderDetail.courierNumber}</div>
					</div>
				</li>
			</c:if>
			<!-- 待退款、已退款 才显示下划线 -->
			<c:if
				test="${orderDetail.sendTime!=null && orderDetail.sendTime!=''}">
				<li class="mb20">
					<div class="pr mh30 pl160">
						<span class="display-ib w140 lh30 tr mr5 pa left0 top0">发货时间：</span>
						<div class="tl h30 lh30">${orderDetail.sendTime}</div>
					</div>
				</li>
			</c:if>
			<c:if test="${orderDetail.status=='6' }">
				<li class="mb20">
					<div class="pr mh30 pl160">
						<span class="display-ib w140 lh30 tr mr5 pa left0 top0">收货时间：</span>
						<div class="tl h30 lh30">${orderDetail.receiverTime}</div>
					</div>
				</li>
			</c:if>
		</c:if>
	</c:if>
	<!-- 退款信息 -->
	<c:if test="${orderDetail.status=='7'  && orderDetail.status=='8' }">
		<li class="mb20">
			<hr />
		</li>
		<li class="mb20">
			<div class="pr mh30 pl160">
				<span class="display-ib w140 lh30 tr mr5 pa left0 top0"><em
					class="red pr5">退款原因：</em></span>
				<div class="tl h30 lh30">
					<em class="red pr5">${orderDetail.refundReason}</em>
				</div>
			</div>
		</li>
		<c:if test=" ${orderDetail.status=='8' }">
			<li class="mb20">
				<div class="pr mh30 pl160">
					<span class="display-ib w140 lh30 tr mr5 pa left0 top0">退款日期：</span>
					<div class="tl h30 lh30">${orderDetail.refundTime}</div>
				</div>
			</li>
		</c:if>
	</c:if>
</ul>


