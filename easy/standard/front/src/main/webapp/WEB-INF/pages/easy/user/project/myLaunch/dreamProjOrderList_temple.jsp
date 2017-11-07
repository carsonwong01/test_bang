<!-- 实现梦想订单支持列表 -->
<form action="" id="goForm" method="post">
	<input type="hidden" id="orderId" name="orderId"/>
	<input type="hidden" id="from" name="from"/>
</form>
<div class="user-subject-til">
	<i class="hot-til-icon"></i>
	<h3>订单支持</h3>
</div>
<div class="user-subject-fill user-subject-box">
	<div class="user-support-con">
		<ul>
			<li><div class="user-support-left">
					<i class="dingdan-icon dingdan-icon01"></i>支持总额：<span
						class="f20 highlight2 pr5" id="totalSupportAmount">1000</span>元
				</div> <a href=""></a></li>
			<li><div class="user-support-right">
					<i class="dingdan-icon dingdan-icon02"></i>支持人次：<span
						class="f20 highlight pr5" id="totalSupportCount">523</span>次
				</div></li>
		</ul>
	</div>
	<div class="u-table-screening">
		<form id="dataForm" action="">
			<input type="hidden" name="projectId" value="${projectId }" />
			<!-- 是否查询总计:1查询;2不查询 -->
			<input type="hidden" id="isTotalQuery" name="type" value="1" />
			<ul class="clearfix">
				<li><span class="pr5">订单号:</span><input name="orderNo"
					class="text_small_style focus_text" value="" type="text"></li>
				<li><span class="pr5">昵称:</span><input name="nickName"
					class="text_small_style focus_text" value="" type="text"></li>
				<li><span class="pr5">订单状态:</span><select name="status"
					class="select_style"><option value="">全部</option>
						<option value="3">已支付</option>
						<option value="7">待退款</option>
						<option value="8">已退款</option></select></li>
				<li><span class="pr5">订单时间:</span><input name="beginTime"
					class="text_small_style focus_text u-text-time" id="beginTime"
					onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"
					type="text"><span class=" pr5 pl5">至</span><input name="endTime"
					class="text_small_style focus_text u-text-time" id="endTime"
					onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})"
					type="text"></li>
				<li><a href="javascript:void(0)"
					class="btn-public btn-w70 btn-blue" id="search">搜索</a></li>
			</ul>
		</form>
	</div>
	<div class="user-table-box clearfix pt20">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody id="projectOrderListData">
			</tbody>
		</table>
		<!--分页-->
		<div class="paging" id="pagingProjectOrder"></div>
		<!--分页  --END-->
	</div>
</div>

<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<!-- end -->
<script id="projectOrderListTemplate" type="text/x-jquery-tmpl">
	<tr class="title">
		<th>序号</th>
		<th>订单编号</th>
		<th>昵称</th>
		<th>支持金额（元）</th>
		<th width="15%">梦想内容</th>
		<th>订单时间</th>
		<th>订单状态</th>
		<th>操作</th>
	</tr>
	{{each(i,data) list}}
		 <tr>
			<td>{{= i+1}}</td>
			<td>{{= orderNo}}</td>
			<td title="{{= nickNameTips}}">{{= nickName}}</td>
			<td>{{= supportAmount}}</td>
			<td title="{{= returnDescribeTips}}">{{= returnDescribe}}
			</td>
			<td><p>{{= supportTime}}</p></td>
			<td>
{{if status == '0'}}支付成功{{/if}}
{{if status == '1'}}待支付{{/if}}
{{if status == '2'}}已取消{{/if}}
{{if status == '3'}}已支付{{/if}}
{{if status == '4'}}待发货{{/if}}
{{if status == '5'}}待收货{{/if}}
{{if status == '6'}}已收货{{/if}}
{{if status == '7'}}待退款{{/if}}
{{if status == '8'}}已退款{{/if}}
{{if status == '9'}}已失败{{/if}}
			</td>
			<td class="view-link"><a href="javascript:void(0)" onclick="projectManageController.goOrderDetail('{{= orderId}}','ckxq')" class="highlight">查看</a></td>
		</tr>
	{{/each}}
</script>

<script type="text/javascript"
	src="<%=basePath%>easy/js/user/project/projectOrderList.js"></script>
