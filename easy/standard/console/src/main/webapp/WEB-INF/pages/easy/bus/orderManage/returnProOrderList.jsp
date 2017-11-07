<!--后台-业务管理-项目管理-订单管理-产品急销订单列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">订单管理——${projectName }</span>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">订单编号：</span> <input type="text"
								class="text border pl5 mr20" name="orderId" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">支持者：</span> <input type="text"
								class="text border pl5 mr20" name="supporter" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">昵称：</span> <input type="text"
								class="text border pl5 mr20" name="nickName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">回报金额：</span> <select
								class="border mr20 h32 mw100" name="returnAmount">
								<option value="">全部</option>
								<c:forEach var="item" items="${returnAmtList}" varStatus="status">
									<option value="${item.amount}">${item.amount}</option>
								</c:forEach>
							</select>
					</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">支付状态：</span> <select
								class="border mr20 h32 mw100" name="status">
								<option value="">全部</option>
								<option value="4">待发货</option>
						<option value="5">待收货</option>
						<option value="6">已收货</option>
						<option value="7">待退款</option>
						<option value="8">已退款</option>
							</select>
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">订单时间：</span> <input type="text"
								name="beginTime" class="text border pl5 w120 date"
								id="beginTime"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" />
							<span class="pl5 pr5">至</span> <input type="text" name="endTime"
								class="text border pl5 w120 mr20 date" id="endTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" />
						</div></li>

					<li><div class="item-box">
					<input type="hidden" name="projectId" value="${projectId}"/>
					<input type="hidden" name="projectType" value="6"/>
							<a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
				</ul>
			</div>
		</div>

	</form>
	<div class="mt20 table-container">
		<table class="table table-style gray6 tc">
			<thead>
				<tr class="title">
					<th class="tc">序号</th>
					<th>订单编号</th>
					<th>支持者</th>
					<th>昵称</th>
					<th>支持金额（元）</th>
					<th>回报金额（元）</th>
					<th>回报数量（份）</th>
					<th>汇报内容</th>
					<th>订单时间</th>
					<th>订单状态</th>
				</tr>
			</thead>
			<tbody class="f12" id="returnProOrderList"></tbody>
			</tbody>
		</table>
	</div>
	<div>订单数量：<span id="orderTotalCount">0</span>个</div>
	<!--分页-->
	<div class="paging" id="returnProOrderListTag"></div>
	<!--分页 end-->
</div>

<script id="returnProOrderListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>
<a href="<%=basePath %>bus/orderManage/orderDetail.do?orderNo={{= data.orderId}}" target="_blank" class="link-blue mr20" >{{= data.orderId}}</a>
		  </td>
          <td>{{= data.supporter}}</td>
          <td>{{= data.nickName}}</td>
          <td>{{= data.supportAmt}}</td>
		  <td>{{= data.returnAmt}}</td>
          <td>{{= data.supportCount}}</td>
          <td>{{= data.returnDescribe}}</td>
		  <td>{{= data.payTime}}</td>
  		  <td>
 			<%@include file="/WEB-INF/pages/easy/bus/projectManage/local/orderStatus.jsp" %>
		  </td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/orderManage/returnProOrderList.js"></script>