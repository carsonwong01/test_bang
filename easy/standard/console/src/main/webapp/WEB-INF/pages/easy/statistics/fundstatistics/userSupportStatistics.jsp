<!--用户支持统计-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
  <form id="form">
  <div class="border p20" id="totalContent">
  </div>
  <div class="content-container mt30">
      <ul class="gray6 input-list-container clearfix">
	      <li>
	           <span class="display-ib mr5">用户名</span>
	           <input type="text" name="userName" class="text border pl5 mr20" value="${FindCommonStatReq.userName} " />
	        </li>
	       <!--  <li>
	            <span class="display-ib mr5">参与金额</span>
	            <span class="pr"><input type="text" name="staMoney"  class="text border pl5 w120" value="" validate="amount" maxlength="15"/></span>
				<span class="pl5 pr5">至</span> 
			    <span class="pr"><input type="text" name="endMoney"  class="text border pl5 w120 mr20" value="" validate="amount" maxlength="15"/></span>
	        </li> -->
	        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchStatistics"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
	<shiro:hasPermission name="TJGL_ZJTJ_YHZJ_DC"> 
	          <li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="exportStatistics"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
	</shiro:hasPermission> 
      </ul>
    </div>
     </form>
    <div class="table-container">
    <table id="exportTable" class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th  exp-name="index" class="tc">序号</th>
          <th  exp-name="userName" class="tc">支持用户</th>
          <th  exp-name="nickName">昵称</th>
          <th  exp-name="supportAmt">支持总额(元)</th>
          <th  exp-name="supportProCount">支持订单数</th>
          <th  exp-name="successProCount">成功订单数</th>
          <th  exp-name="failProCount">失败订单数</th>
          <th  exp-name="refundAmt">退款金额(元)</th>
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
          <p class="gray9">累计支持金额</p>
          <p class="f16 main-color" id="">￥{{= statResult.supportAmt}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计支持订单数</p>
          <p class="f16 main-color">{{= statResult.supportProCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计成功订单数</p>
          <p class="f16 main-color">{{= statResult.successProCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计失败订单数</p>
          <p class="f16 main-color">{{= statResult.failProCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计退款金额</p>
          <p class="f16 main-color">￥{{= statResult.refundAmt}}</p>
        </div>
      </li>
    </ul>

</script>
<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(index) pageResult.list[0].dataList}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageResult.pageIndex-1)*pageResult.pageSize)}}</td>
		<td>{{= userName}}</td>
	    <td>{{= nickName}}</td>
 		<td>{{= supportAmt}}</td>
	    <td>{{= supportProCount}}</td>
        <td>{{= successProCount}}</td>
 		<td>{{= failProCount}}</td>
		<td>{{= refundAmt}}</td> 
       </tr>
	{{/each}} 
</script>
<!-- <tr>
<td>合计</td>
<td></td>
<td></td>
<td>{{= columnStatResult.supportAmt}}</td>
<td>{{= columnStatResult.supportProCount}}</td>
<td>{{= columnStatResult.successProCount}}</td>
<td>{{= columnStatResult.failProCount}}</td>
<td>{{= columnStatResult.refundAmt}}</td> 
</tr> -->
<script type="text/javascript" src="<%=basePath%>js/easy/statistics/fundstatistics/userSupportStatistics.js"></script>