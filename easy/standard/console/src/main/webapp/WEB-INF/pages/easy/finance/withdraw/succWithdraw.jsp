<!--后台-财务管理-提现管理-提现成功列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="searchSuccWithdrawForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">提现成功</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
        <li><div class="item-box"><span class="display-ib mr5">用户：</span>
          <input type="text" class="text border pl5 mr20" name="userName" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">提现时间：</span>
        <input type="text" name="startWithdrawTime"  class="text border pl5 w120 date" id="startWithdrawTime"
		onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endWithdrawTime\')}'})" />
		<span class="pl5 pr5">至</span> <input type="text" name="endWithdrawTime"  class="text border pl5 w120 mr20 date" id="endWithdrawTime"
		onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'startWithdrawTime\')}'})" />
        </div></li>
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="CWGL_TXGL_TXCG_MU">
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
          <th>用户</th>
          <th>真实姓名</th>
          <th>银行</th>
          <th>开户支行</th>
          <th>银行卡号</th>
          <th>提现金额（元）</th>
          <th>手续费（元）</th>
          <th>实到金额（元）</th>
          <th>提现时间</th>
          <th>审核人</th>
          <th>放款人</th>
        </tr>
      </thead>
      <tbody class="f12" id="searchSuccWithdrawD"></tbody>
      </tbody>
    </table>
  </div>
   <!--分页-->
  <div class="paging"  id="searchSuccWithdrawTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="userName">用户</th>
          <th exp-name="realName">真实姓名</th>
          <th exp-name="bankName">银行</th>
          <th exp-name="bankBranch">开户支行</th>
          <th exp-name="bankCardNo">银行卡号</th>
          <th exp-name="withdrawAmt">提现金额（元）</th>
          <th exp-name="poundage">手续费（元）</th>
          <th exp-name="actualAmt">实到金额（元）</th>
          <th exp-name="withdrawTime">提现时间</th>
          <th exp-name="auditUserName">审核人</th>
          <th exp-name="loanerUserName">放款人</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="searchSuccWithdrawTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.userName}}</td>
 		  <td>{{= data.realName}}</td>
          <td>{{= data.bankName}}</td>
          <td>{{= data.bankBranch}}</td>
          <td>{{= data.bankCardNo}}</td>
          <td>{{= data.withdrawAmt}}</td>
          <td>{{= data.poundage}}</td>
          <td>{{= data.actualAmt}}</td>
          <td>{{= data.withdrawTime}}</td>
		  <td>{{= data.auditUserName}}</td>
		  <td>{{= data.loanerUserName}}</td>
        </tr>
{{/each}}
<tr>
<td>合计</td>
<td colspan="5"></td>
<td>{{= columnStatResult.withdrawTotal}}</td>
<td>{{= columnStatResult.poundageTotal}}</td>
<td>{{= columnStatResult.actualTotal}}</td>
<td colspan="3"></td>
</tr>
</script>


<script language="javascript" src="<%=basePath %>js/easy/finance/withdraw/succWithdraw.js"></script>