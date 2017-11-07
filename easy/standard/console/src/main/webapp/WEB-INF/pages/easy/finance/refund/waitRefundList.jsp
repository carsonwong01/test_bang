<!--后台-财务管理-退款管理-订单待退款-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="searchWaitRefundListForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">订单待退款</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
        <li><div class="item-box"><span class="display-ib mr5">订单编号：</span>
          <input type="text" class="text border pl5 mr20" name="orderId" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">支持者：</span>
          <input type="text" class="text border pl5 mr20" name="supporter" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">退款类型：</span>
          <select class="border mr20 h32 mw100" name="refundType">
            <option value="">全部</option>
            <option value="1">项目删除退款</option>
            <option value="2">众筹失败退款</option>
            <option value="3">项目超额溢出退款</option>
            <option value="4">回报不足溢出退款</option>
            <option value="5">项目删除溢出退款</option>
            <option value="6">众筹失败溢出退款</option>
          </select></div>
        </li>	
         <li><div class="item-box"><span class="display-ib mr5">项目编号：</span>
          <input type="text" class="text border pl5 mr20" name="projectNo" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">退款发起时间：</span>
        <input type="text" name="startRefundTime"  class="text border pl5 w120 date" id="startRefundTime"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endRefundTime\')}'})" />
							<span class="pl5 pr5">至</span> <input type="text" name="endRefundTime"  class="text border pl5 w120 mr20 date" id="endRefundTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startRefundTime\')}'})" />
        </div></li>
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="CWGL_TKGL_DDDTK_DC">
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
          <th>支持者</th>
          <th>昵称</th>
          <th>支持金额（元）</th>
          <th>退款类型</th>
          <th>项目编号</th>
          <th>支付渠道</th>
          <th>支付流水号</th>
          <th>退款发起时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody class="f12" id="searchWaitRefundListD"></tbody>
      </tbody>
    </table>
  </div>
   <!--分页-->
  <div class="paging"  id="searchWaitRefundListTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="orderId">订单编号</th>
          <th exp-name="supporter">支持者</th>
          <th exp-name="nickName">昵称</th>
          <th exp-name="supportAmt">支持金额（元）</th>
          <th exp-name="refundType">退款类型</th>
          <th exp-name="projectNo">项目编号</th>
          <th exp-name="supportSource">支付渠道</th>
          <th exp-name="paySerialNo">支付流水号</th>
          <th exp-name="launchTime">退款发起时间</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="searchWaitRefundListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.orderId}}</td>
          <td>{{= data.supporter}}</td>
          <td>{{= data.nickName}}</td>
          <td>{{= data.supportAmt}}</td>
          <td>{{= data.refundTypeName}}</td>
          <td><a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.projectId}}&type={{= data.projectType}}" target="_blank" class="link-blue mr10 click-link" >{{= data.projectNo}}</a></td>
          <td>{{= data.supportSourceName}}</td>
          <td>{{= data.paySerialNo}}</td>
          <td>{{= data.launchTime}}</td>
          <td>
            <shiro:hasPermission name="CWGL_TKGL_DDDTK_CK">
			<a href="<%=basePath %>bus/orderManage/orderDetail.do?orderNo={{= data.orderId}}" target="_blank" class="link-blue mr10" >订单详情</a>
		    </shiro:hasPermission>
            </td>
        </tr>
{{/each}}
<td>合计</td>
<td colspan="3"></td>
<td>{{= columnStatResult.supportTotal}}</td>
<td colspan="6"></td>
</tr>
</script>


<script language="javascript" src="<%=basePath %>js/easy/finance/refund/waitRefundList.js"></script>