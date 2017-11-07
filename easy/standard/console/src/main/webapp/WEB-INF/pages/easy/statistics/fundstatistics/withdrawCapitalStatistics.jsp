<!--平台账户提现统计-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
  <form id="form">
  <div class="border p20" id="totalContent">
  </div>
  
  <div class="content-container mt30">
      <ul class="gray6 input-list-container clearfix">
       <li><span class="display-ib mr5">时间</span>
        <input type="text" name="startDate"  class="text border pl5 w120 date" id="beginTime"onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" />
		<span class="pl5 pr5">至</span> 
		<input type="text" name="endDate"  class="text border pl5 w120 mr20 date" id="endTime"onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" />
       </li>
       <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchStatistics"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
	     <shiro:hasPermission name="TJGL_ZJTJ_TXTJ_DC"> 
          <li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="exportStatistics"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
 		</shiro:hasPermission> 
      </ul>
    </div>
    </form>
    <div class="table-container">
    <table class="table table-style gray6 tc" id="exportTable">
      <thead>
        <tr class="title">
          <th class="tc" exp-name="index">序号</th>
          <th exp-name="statDate">时间</th>
          <th exp-name="withdrawDengesAmount">平台账户当日提现(元)</th>
          <th exp-name="withdrawCount">平台账户提现笔数</th>
          <th exp-name="withdrawUserCount">平台账户提现用户数</th>
          <th exp-name="addWithdrawUserCount">平台账户新增提现用户</th>
        </tr>
      </thead>
      <!-- 填充数据 -->
      <tbody id="container" class="f12">
      
      </tbody>
    </table>
  </div>
   
  <!--分页-->
  <div id="applyRecordTag"></div>
  <!--分页 end--> 
</div>

<script id="statTemple" type="text/x-jquery-tmpl">
<ul class="clearfix ptzjtj-ul">
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">平台账户累计提现总额</p>
          <p class="f16 main-color">￥{{= statResult.withdrawAmount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">平台账户累计提现笔数</p>
          <p class="f16 main-color">{{= statResult.withdrawCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">平台账户累计提现用户数</p>
          <p class="f16 main-color">{{= statResult.withdrawUserCount}}</p>
        </div>
      </li>
      
    </ul>
</script>

<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(index) pageResult.list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageResult.pageIndex-1)*pageResult.pageSize)}}</td>
		<td>{{= statDate}}</td>
		<td>{{= withdrawDengesAmount}}</td>
	    <td>{{= withdrawCount}}</td>
	    <td>{{= withdrawUserCount}}</td>
        <td>{{= addWithdrawUserCount}}</td>
       </tr>
	{{/each}}
<tr>
<td>合计</td>
<td colspan="0"></td>
<td>{{= columnStatResult.withdrawDengesAmount}}</td>
<td>{{= columnStatResult.withdrawCount}}</td>
<td>{{= columnStatResult.withdrawUserCount}}</td>
<td>{{= columnStatResult.addWithdrawUserCount}}</td>
</tr>
</script>
<script type="text/javascript" src="<%=basePath%>js/easy/statistics/fundstatistics/withdrawCapitalStatistics.js"></script>