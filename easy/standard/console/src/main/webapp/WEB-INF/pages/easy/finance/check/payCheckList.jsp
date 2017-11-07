<!--后台-财务管理-对账管理-支付对账-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="searchPayCheckListForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">支付异常对账</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
        <li><div class="item-box"><span class="display-ib mr5">用户：</span>
          <input type="text" class="text border pl5 mr20" name="userName" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">订单号：</span>
          <input type="text" class="text border pl5 mr20" name="orderNo" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">流水号：</span>
          <input type="text" class="text border pl5 mr20" name="payFlowNo" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">支付时间：</span>
        <input type="text" name="payBeginTime"  class="text border pl5 w120 date" id="payBeginTime"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'payEndTime\')}'})" />
							<span class="pl5 pr5">至</span> <input type="text" name="payEndTime"  class="text border pl5 w120 mr20 date" id="payEndTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'payBeginTime\')}'})" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">状态：</span>
          <select class="border mr20 h32 mw100" name="payCheckStatus">
            <option value="">全部</option>
            <option value="1">未对账</option>
            <option value="2">成功</option>
            <option value="3">失败</option>
          </select></div>
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="CWGL_ZFJL_ZFJL_DC">
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
          <th>订单号</th>
          <th>用户</th>
          <th>支持金额（元）</th>
          <th>支付时间</th>
          <th>对账完成时间</th>
          <th>流水号</th>
          <th>状态</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody class="f12" id="searchPayCheckListD"></tbody>
      </tbody>
    </table>
  </div>
   <!--分页-->
  <div class="paging"  id="searchPayCheckListTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="orderNo">订单号</th>
          <th exp-name="userName">用户</th>
          <th exp-name="supportAmount">支持金额（元）</th>
          <th exp-name="payTime">支付时间</th>
          <th exp-name="payCheckTime">对账完成时间</th>
          <th exp-name="payFlowNo">流水号</th>
          <th exp-name="payCheckStatus">状态</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="searchPayCheckListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.orderNo}}</td>
          <td>{{= data.userName}}</td>
          <td>{{= data.supportAmount}}</td>
          <td>{{= data.payTime}}</td>
          <td>{{= data.payCheckTime}}</td>
          <td>{{= data.payFlowNo}}</td>
          <td>{{= data.statusName}}</td>
          {{if data.payCheckStatus != 2}}
            <td>
            <shiro:hasPermission name="CWGL_DZGL_ZFYCDZ_DZ">
            <a href="javascript:void(0);"onclick="searchPayCheckList.payCheck('{{= data.id}}');" class="link-blue ml10 mr10">对账</a>
            </shiro:hasPermission>
            </td> 
          {{/if}}
          {{if data.payCheckStatus == 2}}
            <td class="ml10 mr10 gray9"><shiro:hasPermission name="CWGL_DZGL_ZFYCDZ_DZ">对账</shiro:hasPermission></td> 
          {{/if}}
        </tr>
{{/each}}
</script>


<script language="javascript" src="<%=basePath %>js/easy/finance/check/payCheckList.js"></script>