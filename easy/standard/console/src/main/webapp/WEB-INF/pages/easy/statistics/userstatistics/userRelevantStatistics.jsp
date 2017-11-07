<!--用户统计-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
  <form id="form">
	  <div class="border p20" id="totalContent">
	    
	  </div>
	  
	  <div class="content-container mt30">
	      <ul class="gray6 input-list-container clearfix">
	      
	        <li>
		        <span class="display-ib mr5">时间</span>
		        <input type="text" name="startDate"  class="text border pl5 w120 date" id="beginTime" onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" />
				<span class="pl5 pr5">至</span> 
				<input type="text" name="endDate"  class="text border pl5 w120 mr20 date" id="endTime" onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" />
	        </li>
	        <li><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchStatistics"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></li>
			<shiro:hasPermission name="TJGL_YHTJ_YHTJ_DC"> 
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
          <th class="tc" exp-name="dateTime">时间</th>
          <th class="tc" exp-name="registerCount">当日注册</th>
          <th class="tc" exp-name="loginUserCount">登录用户</th>
          <th class="tc" exp-name="newPayUserCount">新增支付用户</th>
          <th class="tc" exp-name="regWxCount">微信注册量</th>
          <th class="tc" exp-name="regAppCount">app注册量</th>
          <th class="tc" exp-name="regPcCount">PC端注册</th>
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
          <p class="gray9">累计注册用户</p>
          <p class="f16 main-color">{{= statResult.registerCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">累计支付用户</p>
          <p class="f16 main-color">{{= statResult.newPayUserCount}}</p>
        </div>
      </li>
      <li class="fl ww16">
        <div class="tc">
          <p class="gray9">微信端注册总量</p>
          <p class="f16 main-color">{{= statResult.regWxCount}}</p>
        </div>
      </li>
	  <li class="fl ww16">
        <div class="tc">
          <p class="gray9">APP端注册总量</p>
          <p class="f16 main-color">{{= statResult.regAppCount}}</p>
        </div>
       </li>
	   <li class="fl ww16">
       	 <div class="tc">
         	 <p class="gray9">PC端注册总量</p>
         	 <p class="f16 main-color">{{= statResult.regPcCount}}</p>
         </div>
       </li> 
    </ul>
</script>

<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(index) pageResult.list}}
       <tr {{if index %2 == 0}}class="grey" {{/if}}>
		<td>{{= index+1+((pageResult.pageIndex-1)*pageResult.pageSize)}}</td>
		<td>{{= dateTime}}</td>
		<td>{{= registerCount}}</td>
	    <td>{{= loginUserCount}}</td>
		<td>{{= newPayUserCount}}</td>
		<td>{{= regWxCount}}</td>
		<td>{{= regAppCount}}</td>
		<td>{{= regPcCount}}</td>
       </tr>
	{{/each}}
<tr>
<td>合计</td>
<td colspan="1"></td>
<td>{{= columnStatResult.registerCount}}</td>
<td>{{= columnStatResult.loginUserCount}}</td>
<td>{{= columnStatResult.newPayUserCount}}</td>
<td>{{= columnStatResult.regWxCount}}</td>
<td>{{= columnStatResult.regAppCount}}</td>
<td>{{= columnStatResult.regPcCount}}</td>
</tr>
</script>
<script type="text/javascript" src="<%=basePath%>js/easy/statistics/userstatistics/userRelevantStatistics.js"></script>