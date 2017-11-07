<!--用户发起项目统计-->
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
	        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchStatistics"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
		<shiro:hasPermission name="TJGL_ZJTJ_YHFQ_DC"> 
		          <li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="exportStatistics"><i class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
		</shiro:hasPermission>   
      </ul>
    </div>
    </form>
    <div class="table-container">
    <table class="table table-style gray6 tc" id="exportTable">
      <thead>
       <tr class="title">
          <th  exp-name="index" class="tc">序号</th>
          <th  exp-name="userName" class="tc">用户名</th>
          <th  exp-name="nickName">昵称</th>
          <th  exp-name="initiateProCount">发起项目数</th>
          <th  exp-name="successProCount">众筹成功项目数</th>
          <th  exp-name="failProCount">众筹失败项目数</th>
          <th  exp-name="deleteProCount">删除项目数</th>
          <th  exp-name="initiateAmt">成功项目总额(元)</th>
          <th  exp-name="refundAmt">项目退款总额(元)</th>
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
          <p class="gray9">累计发起项目数</p>
          <p class="f16 main-color">{{= statResult.initiateProCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计众筹成功项目数</p>
          <p class="f16 main-color">{{= statResult.successProCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计众筹失败项目数</p>
          <p class="f16 main-color">{{= statResult.failProCount}}</p>
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
	    <td>{{= initiateProCount}}</td>
		<td>{{= successProCount}}</td>
		<td>{{= failProCount}}</td> 
		<td>{{= deleteProCount}}</td>  
	    <td><span format="2">{{= initiateAmt}}</span></td>
	    <td><span format="2">{{= refundAmt}}</span></td>
       </tr>
	{{/each}}
</script>
<!-- <tr>
<td>合计</td>
<td></td> 
<td></td>
<td>{{= columnStatResult.initiateProCount}}</td>
<td>{{= columnStatResult.successProCount}}</td>
<td>{{= columnStatResult.failProCount}}</td>
<td>{{= columnStatResult.deleteProCount}}</td>
<td>{{= columnStatResult.initiateAmt}}</td>
<td>{{= columnStatResult.refundAmt}}</td> 
</tr> -->
<script type="text/javascript" src="<%=basePath%>js/easy/statistics/fundstatistics/userInitiateStatistics.js"></script>