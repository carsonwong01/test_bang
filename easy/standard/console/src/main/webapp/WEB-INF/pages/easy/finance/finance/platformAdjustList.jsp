<!-- 后台-财务管理-账务管理-平台调账管理-->
<div class="p20">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>平台调账管理</div>
    <div class="border p20">
    <ul class="clearfix ptzjtj-ul" >
    <div id="statU">
    
    </div>
    </ul>
  </div>
  <div class="border mt20">
    <div class="content-container p20">
    <form id="searchPlatformAdjustListForm">
    <input type="hidden"  name="type" value="1" />
      <ul class="gray6 input-list-container clearfix">
         <li>
          <div class="item-box"><span class="display-ib mr5">调账流水号</span>
            <input type="text" class="text border pl5 mr20" name="flowNo"  maxlength="50"/>
          </div>
        </li>
        <li>
          <div class="item-box"><span class="display-ib mr5">调账类型</span>
            <select class="border mr20 h32 mw100" name="tiaozhangType">
              <option value="">全部</option>
              <option value="1">收入调账</option>
              <option value="2">支出调账</option>
            </select>
          </div>
        </li>
        <li>
          <div class="item-box"><span class="display-ib mr5">操作人</span>
            <input type="text" class="text border pl5 mr20" name="operator"  maxlength="50"/>
          </div>
        </li>
        <li>
          <div class="item-box"><span class="display-ib mr5">操作时间</span>
            <input type="text" class="text border pl5 w120 date" name="startTime" id="startTime" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})"/>
            <span class="pl5 pr5">至</span>
            <input type="text" class="text border pl5 w120 mr20 date" name="endTime" id="endTime" onclick="WdatePicker({minDate: '#F{$dp.$D(\'startTime\')}'})" />
          </div>
        </li>
        <li>
          <div class="item-box" id="search"><a class="btn btn-blue radius-6 mr5 pl1 pr15"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div>
        </li>
        <shiro:hasPermission name="CWGL_TKGL_PTTZGL_DC">
        <li>
          <div class="item-box" id="export"><a class="btn btn-blue radius-6 mr5  pl1 pr15"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></div>
        </li>
        </shiro:hasPermission>
        <shiro:hasPermission name="CWGL_TKGL_PTTZGL_TZ">
        <li>
          <div class="item-box" id="adjust"><a class="btn btn-blue radius-6 mr5  pl1 pr15"><i class="icon-i w30 h30 va-middle add-icon"></i>调账</a></div>
        </li>
        </shiro:hasPermission>
      </ul>
     </form>
    </div>
  </div>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc" >序号</th>
          <th>调账流水号</th>
          <th>收入调账(元)</th>
          <th>支出调账(元)</th>
          <th>账户余额(元)</th>
          <th>操作人</th>
          <th>操作时间</th>
          <th>备注</th>
        </tr>
      </thead>
      <tbody class="f12" id="searchPlatformAdjustListD"></tbody>
    </table>
  </div>
  <!--分页-->
  <div class="paging clearfix pt20" id="searchPlatformAdjustListTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="flowNo">调账流水号</th>
          <th exp-name="income">收入调账(元)</th>
          <th exp-name="expenditure">支出调账(元)</th>
          <th exp-name="accountBalance">账户余额(元)</th>
          <th exp-name="operator">操作人</th>
          <th exp-name="operateTime">操作时间</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>


<!-- 平台调账管理模板 -->
<script id="searchPlatformAdjustListTemp" type="text/x-jquery-tmpl">
	{{each(i,data) pageResult.list}}
        <tr {{if i %2 == 0}}class="tr-even"{{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.flowNo}}</td>
          <td>{{= data.income}}</td>
		  <td>{{= data.expenditure}}</td>
 		  <td>{{= data.accountBalance}}</td>
 		  <td>{{= data.operator}}</td>
  		  <td>{{= data.operateTime}}</td>
          <td class="cl">
          <shiro:hasPermission name="CWGL_TKGL_PTTZGL_CK">
              <a href="javascript:void(0);" class="link-blue ml10  mr10" onclick="searchPlatformAdjustList.remarkShow('{{= data.id}}');">查看</a>
          </shiro:hasPermission>
          </td>
        </tr>
	{{/each}}

<tr>
<td>合计</td>
<td colspan="1"></td>
<td>{{= columnStatResult.incomeTotal}}</td>
<td>{{= columnStatResult.expenditureTotal}}</td>
<td colspan="4"></td>
</tr>
</script>

<!-- 平台调账管理模板 -->
<script id="statTemp" type="text/x-jquery-tmpl">
   <li class="fl ww25">
        <div class="tc">
          <p class="gray9">累计平台收入调账</p>
          <p class="f16 main-color"><label id="totalMoneyInId" class="formatMoney">{{= statResult.incomeAmt}}</label>元</p>
        </div>
      </li>
      <li class="fl ww25">
        <div class="tc">
          <p class="gray9">累计平台支出调账</p>
          <p class="f16 main-color"><label id="totalMoneyOutId"  class="formatMoney">{{= statResult.expenditureAmt}}</label>元</p>
        </div>
      </li>
</script>


<!-- 调账模板-->
<script id="adjustTmpl" type="text/x-jquery-tmpl">
   <%@include file="/WEB-INF/pages/easy/finance/finance/adjustTmpl.jsp" %>
</script> 

<!-- 确认调账模板-->
<script id="adjustConfirmTmpl" type="text/x-jquery-tmpl">
   <%@include file="/WEB-INF/pages/easy/finance/finance/adjustConfirmTmpl.jsp" %>
</script> 


<script language="javascript" src="<%=basePath %>js/easy/finance/finance/platformAdjustList.js"></script>