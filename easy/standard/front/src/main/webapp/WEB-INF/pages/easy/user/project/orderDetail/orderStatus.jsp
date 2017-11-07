<c:if test="${orderDetail.status=='1' }">
					待支付
					</c:if>
<c:if test="${orderDetail.status=='2' }">
					已取消
					</c:if>
<c:if test="${orderDetail.status=='3' }">
					已支付
					</c:if>
<c:if test="${orderDetail.status=='4' }">
					待发货
					</c:if>
<c:if test="${orderDetail.status=='5' }">
					待收货
					</c:if>
<c:if test="${orderDetail.status=='6' }">
					已收货
					</c:if>
<c:if test="${orderDetail.status=='7' }">
					待退款
					</c:if>
<c:if test="${orderDetail.status=='8' }">
					已退款
					</c:if>
<c:if test="${orderDetail.status=='9' }">
					已失败
					</c:if>