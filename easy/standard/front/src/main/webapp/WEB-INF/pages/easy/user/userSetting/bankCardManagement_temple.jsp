
<h2 class="user-public-h2">
	<i class="hot-til-icon btn-blue"></i>银行卡管理
</h2>
<div class="mt20 public-minheight">
	<ul class="bank_manage_list clearfix">
		<c:if test="${bankCardList!=null && bankCardList.size()>0 }">
			<c:forEach var="item" items="${bankCardList }" varStatus="status">
				<li>
					<div class="item-container">
					<!-- 	<i class="ico"></i> -->
						<div class="pic">
							<img src="<%=basePath %>easy/images/bank_card_${item.bankCode }.png">
						</div>
						<div class="number">${item.cardNumber}</div>
						<div class="delete tc">
							<a href="javascript:void(0)"
								onclick="bankListController.delBankCard('${item.cardId}')">删除</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${maxBankCardCount > bankCardList.size() }">
			<li class="add">
				<div class="item-container">
					<a href="javascript:void(0)" class="addBankCard" id="${idcardStatus }"><i class="add_ico"></i>
						<p>添加银行卡</p> </a>
				</div>
			</li>
		</c:if>
	</ul>
</div>

<script type="text/javascript"
	src="<%=basePath%>easy/js/user/userSetting/bankCardManagement.js"></script>