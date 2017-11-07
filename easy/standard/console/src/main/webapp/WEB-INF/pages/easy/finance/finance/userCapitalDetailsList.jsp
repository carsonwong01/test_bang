<!--后台-财务管理-提现管理-用户资金明细-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="searchUserCapitalDetailsListForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">用户资金明细</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
      <li><div class="item-box"><span class="display-ib mr5">用户：</span>
          <input type="text" class="text border pl5 mr20" name="userName" value="" />
        </div></li>
      <li><div class="item-box"><span class="display-ib mr5">类型：</span>
          <select class="border mr20 h32 mw100" name="type">
            <option value="">全部</option>
            <option value="1">订单支付</option>
            <option value="2">提现</option>
            <option value="3">提现手续费</option>
            <option value="5">订单退款</option>
          </select></div>
        </li>
        <li><div class="item-box"><span class="display-ib mr5">项目编号：</span>
          <input type="text" class="text border pl5 mr20" name="projectNo" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">项目名称：</span>
          <input type="text" class="text border pl5 mr20" name="projectName" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">时间：</span>
        <input type="text" name="beginTime"  class="text border pl5 w120 date" id="beginTime"
		onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" />
		<span class="pl5 pr5">至</span> <input type="text" name="endTime"  class="text border pl5 w120 mr20 date" id="endTime"
		onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" />
        </div></li>
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="search"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="CWGL_TKGL_YHZJMX_DC">
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
          <th>类型</th>
          <th>收入（元）</th>
          <th>支出（元）</th>
          <th>时间</th>
          <th>项目编号</th>
          <th>项目名称</th>
          <th>备注</th>
        </tr>
      </thead>
      <tbody class="f12" id="searchUserCapitalDetailsListD"></tbody>
      </tbody>
    </table>
  </div>
   <!--分页-->
  <div class="paging"  id="searchUserCapitalDetailsListTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="userName">用户</th>
          <th exp-name="type">类型</th>
          <th exp-name="income">收入（元）</th>
          <th exp-name="expenditure">支出（元）</th>
          <th exp-name="time">时间</th>
          <th exp-name="projectNo">项目编号</th>
          <th exp-name="projectName">项目名称</th>
          <th exp-name="remark">备注</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="searchUserCapitalDetailsListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.userName}}</td>
          <td>{{= data.typeName}}</td>
          <td>{{= data.income}}</td>
          <td>{{= data.expenditure}}</td>
          <td>{{= data.time}}</td>
          <td>{{= data.projectNo}}</td>
          <td>{{= data.projectName}}</td>
          <td>{{= data.remark}}</td>
        </tr>
{{/each}}
<tr>
<td>合计</td>
<td colspan="2"></td>
<td>{{= columnStatResult.incomeTotal}}</td>
<td>{{= columnStatResult.expenditureTotal}}</td>
<td colspan="4"></td>
</tr>
</script>


<script language="javascript" src="<%=basePath %>js/easy/finance/finance/userCapitalDetailsList.js"></script>