<form action="" id="goForm" method="post">
	<input type="hidden" id="projectId" name="projectId"/>
	<input type="hidden" id="orderId" name="orderId"/>
	<input type="hidden" id="from" name="from"/>
</form>
<!-- 我支持的项目 -->
<div class="personal-con clearfix">
	<h2 class="user-public-h2">
		<i class="hot-til-icon btn-blue"></i>我支持的
	</h2>
	<ul class="user-tab-til clearfix">
		<li id="one0"
			onclick="mySupportProjectListController.setTab('one',0,5)"
			class="hover">全部</li>
		<li id="one1"
			onclick="mySupportProjectListController.setTab('one',1,5)">待支付</li>
		<li id="one3"
			onclick="mySupportProjectListController.setTab('one',3,5)">已支付</li>
		<li id="one5"
			onclick="mySupportProjectListController.setTab('one',5,5)">待收货</li>
		<p class="animate_p">
			<span class="xmjt-arrow"></span>
		</p>
	</ul>
	
	<div id="con_one_1">
		<form action="" id="dataForm">
			<!-- 订单状态 -->
			<input type="hidden" name="status" id="orderStatus" value=""/> 
		</form>
		<div class="project_til">
			<ul class="clearfix">
				<li class="mod_l"><span class="ml20">项目信息</span></li>
				<li class="mod_01">支持金额（元）</li>
				<li class="mod_02">订单状态</li>
				<li class="mod_r">操作</li>
			</ul>
		</div>
		<div class="project_con">
			<ul id="mySupportProjectListData">
				
				
			</ul>
		</div>
	</div>
	<!--分页-->
	<div class="paging" id="pagingMySpportProject"></div>
	<!--分页  --END-->
</div>

<!-- 弹窗 start -->
<div id="comfirmReciptDialog" class="dialogBox w300" style="display: none;">
<input id="comfirmReciptOrderId" value=""/>
	<div class="popup_bg"></div>
	<div class="dialog popBox">
	    <div class="title">确认收货<a href="javascript:;" class="out"></a></div>
	    <div class="content">
	        <div class="dia_auto">
	            <p class="tc f16 pt30 bold">项目货物已收到，是否确定？</p>
				<p class="tc f16 pt30 red">备注：如有未收到货或对到货产品有疑义，<br/>请线下联系项目发起人协商解决。</p>
	        </div>
	        <div class="tc mt20">
				<a  href="javascript:void(0)" 
				class="btn-public btn-w70 btn-blue" id="comfirmRecipt">确认</a>
				<a  href="javascript:void(0)" 
				class="btn-public btn-w70 btn-blue" id="closeDialog">取消</a>
			</div>
	    </div>
	</div>
</div>

<script id="mySupportProjectListTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}

		<li class="item">
					<div class="clearfix">
						<div class="mod_l">
							<div class="pic">
								<a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')"><img src="{{= data.coverImage}}" /></a>
							</div>
							<div class="info">
								<div class="til">
									<a href="javascript:void(0)" onclick="userCenterController.goProjectDetails('{{= data.projectId}}')">{{= data.projectName}}</a><span class="state">
										{{if data.projectStatus == '1'}}众筹中{{/if}}
										{{if data.projectStatus == '2'}}众筹结束{{/if}}
										{{if data.projectStatus == '3'}}众筹失败{{/if}}
										{{if data.projectStatus == '4'}}已删除{{/if}}
									</span>
									<p class="coding-til">订单编号：{{= data.orderNo}}</p>
								</div>
								<ul class="clearfix">
									<li>筹款进度<br /> <em class="f16 gray3">{{= data.raiseRate}}</em><em>%</em></li>
									<li>已筹金额<br /> <em class="f16 gray3">{{= data.raisedAmount}}</em><em>元</em></li>
									<li class="last">剩余时间<br />  {{if  data.projectStatus == '1' &&  parseInt(data.remainingDay)>0}}<em class="f16 gray3">{{= data.remainingDay}}</em><em>天</em>{{else  data.projectStatus == '1' && parseInt(data.remainingDay)==0}}<em class="f16 gray3">即将结束</em>{{else}}<em class="f16 gray3">已结束</em>{{/if}}</li>
								</ul>
							</div>
						</div>
						<div class="mod_01">
							<em class="f14">{{= data.supportAmount}}</em>
						</div>
						<div class="mod_02">
							{{if data.status == '0'}}支付成功{{/if}}
							{{if data.status == '1'}}<p>待支付</p>{{/if}}
							{{if data.status == '2'}}已取消{{/if}}
							{{if data.status == '3'}}已支付{{/if}}
							{{if data.status == '4'}}待发货{{/if}}
							{{if data.status == '5'}}待收货{{/if}}
							{{if data.status == '6'}}已收货{{/if}}
							{{if data.status == '7'}}待退款{{/if}}
							{{if data.status == '8'}}已退款{{/if}}
							{{if data.status == '9'}}已失败{{/if}}
							
							
							{{if data.status == '1'}}<p class="f12">请在移动端完成支付</p>{{/if}}
						</div>
						<div class="mod_r">
							<div class="con">
								<a href="javascript:void(0)" onclick="userCenterController.goOrderDetail('{{= orderId}}','ckxq')" class="highlight" >订单详情</a>
								{{if data.status == '5'}}
								<a href="javascript:void(0)" id="{{= orderId}}" class="btn-public btn-blue btn-w80 showComfirmReciptDialog">确认收货</a>
								{{/if}}
								{{if data.status == '1'}}
								<a href="javascript:void(0)" class="highlight cancelOrder" id="{{= orderId}}">取消订单</a>
								{{/if}}
							</div>
						</div>
					</div>
				</li>
		
	{{/each}}
</script>



<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easy/js/user/project/mySupportProjectList.js"></script>