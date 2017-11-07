<!--后台-业务管理-订单管理-所有订单列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">所有订单</span>
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
							<span class="display-ib mr5">支付状态：</span> <select
								class="border mr20 h32 mw100" name="status">
								<option value="">全部</option>
								<option value="3">已支付</option>
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
							<a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
						<shiro:hasPermission name="YWGL_DDGL_SYDD_DC">
							<li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="export"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
						</shiro:hasPermission>
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
					<th>项目编号</th>
					<th>项目名称</th>
					<th>支持者</th>
					<th>昵称</th>
					<th>支持金额（元）</th>
					<th>订单状态</th>
					<th>订单时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="allOrderList"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="allOrderListTag"></div>
	<!--分页 end-->
	<!--导出标题  -->
	<table id="exportTable" hidden="true">
		<thead>
			<tr>
				<th exp-name="index">序号</th>
				<th exp-name="orderId">订单编号</th>
				<th exp-name="projectNo">项目编号</th>
				<th exp-name="projectName">项目名称</th>
				<th exp-name="supporter">支持者</th>
				<th exp-name="nickName">昵称</th>
				<th exp-name="supportAmt">支持金额（元）</th>
				<th exp-name="payStatus">订单状态</th>
				<th exp-name="payTime">订单时间</th>
			</tr>
		</thead>
	</table>
	<!--导出标题end -->
</div>

<script id="allOrderListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>
 
			<a href="<%=basePath %>bus/orderManage/orderDetail.do?orderNo={{= data.orderId}}" target="_blank" class="link-blue mr20" >{{= data.orderId}}</a>
		 
		 </td>
		  <td>{{= data.projectNo}}</td>
          <td>{{= data.projectName}}</td>
          <td>{{= data.supporter}}</td>
          <td>{{= data.nickName}}</td>
          <td>{{= data.supportAmt}}</td>
          <td>
 			<%@include file="/WEB-INF/pages/easy/bus/projectManage/local/orderStatus.jsp" %>
		  </td>
		  <td>{{= data.payTime}}</td>
  		  <td>
			<shiro:hasPermission name="YWGL_DDGL_SYDD_DDXQ">
		      <a href="<%=basePath %>bus/orderManage/orderDetail.do?orderNo={{= data.orderId}}" target="_blank" class="link-blue mr20" >订单详情</a>
			</shiro:hasPermission>
  </td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/orderManage/allOrderList.js"></script>