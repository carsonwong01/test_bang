<div class="personal-con">
	<h2 class="user-public-h2">
		<i class="bord btn-blue"></i><span>交易明细</span>
	</h2>
	<div class="trade-detail public-minheight">
		<div class="u-table-screening">
			<form id="dataForm" action="">
				<ul class="clearfix">
					<li><span class="pr5">交易时间:</span><input name="startTime"
						id="startTime" class="text_small_style focus_text u-text-time"
						value="" type="text"
						onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"><span
						class=" pr5 pl5">至</span> <input name="endTime" id="endTime"
						class="text_small_style focus_text u-text-time" value=""
						type="text"
						onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startTime\')}'})"></li>
					<li class="time-area"><!-- <span class="pd"></span> --> <a
						class="cur dateRange" id="1">最近7天</a> <a class="dateRange" id="2">1个月</a>
						<a class="dateRange" id="3">3个月</a> <a class="dateRange" id="4">6个月</a>
						<a class="dateRange" id="5">12个月</a> <input type="hidden"
						name="dateRangeType" id="dateRangeType" value="1" /></li>
					<li><span class="pr5">交易类型:</span> <select name="tradeType"
						class="select_style">
							<option value="">全部</option>
							<option value="1">订单支付</option>
							<option value="5">订单退款</option>
							<option value="2">提现</option>
							<option value="3">提现手续费</option>
					</select></li>
					<li><a href="javascript:void(0)"
						class="btn-public btn-w70 btn-blue" id="search">搜索</a></li>
				</ul>
			</form>
		</div>
		<div class="user-table-box clearfix pt20">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody id="tradeListData">

				</tbody>
			</table>
			<!--分页-->
			<div class="paging" id="pagingTradeList"></div>
			<!--分页  --END-->
		</div>
	</div>
</div>
<script id="tradeListTemplate" type="text/x-jquery-tmpl">
					<tr class="title">
						<th width="15%">序号</th>
						<th width="15%">交易时间</th>
						<th width="15%">交易类型</th>
						<th width="15%">收入(元)</th>
						<th width="15%">支出(元)</th>
						<th width="25%">交易备注</th>
					</tr>
			{{each(i,data) list}}
                    
					<tr>
	<td title="{{= i+1}}">{{= i+1}}</td>
	<td title="{{= data.dateCreate}}">{{= data.dateCreate}}</td>
	<td title="{{if data.tradeType=='1'}}
							订单支付
						{{/if}}
						{{if data.tradeType == '2'}}
							提现
						{{/if}}
						{{if data.tradeType == '3'}}
							提现手续费
						{{/if}}
						{{if data.tradeType == '5'}}
							订单退款
						{{/if}}">
		{{if data.tradeType == '1'}} 订单支付 {{/if}} {{if data.tradeType == '2'}} 提现 {{/if}} {{if data.tradeType == '3'}} 提现手续费 {{/if}} {{if data.tradeType == '5'}} 订单退款 {{/if}}
	</td>
	<td title="{{if data.capitalDirection == '1'}}{{= data.tradeAmount}}{{/if}}">{{if data.capitalDirection == '1'}}{{= data.tradeAmount}}{{/if}}</td>
	<td title="{{if data.capitalDirection == '2'}}{{= data.tradeAmount}}{{/if}}">{{if data.capitalDirection == '2'}}{{= data.tradeAmount}}{{/if}}</td>
	<td title="{{= data.remark}}">{{if data.remark!=null && data.remark.length>20}}{{= data.remark.substring(0,20)}}...{{else}}{{= data.remark}}{{/if}}</td>
</tr>
			{{/each}}
</script>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script src="<%=basePath%>easy/js/user/fundsManagement/findTradeList.js"></script>
