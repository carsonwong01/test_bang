<!--已删除项目列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="dataForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">已删除</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
        <li><div class="item-box"><span class="display-ib mr5">项目编号：</span>
          <input type="hidden" name="projectStatus" value="4">
          <input type="text" class="text border pl5 mr20" name="projectNo" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">项目名称：</span>
          <input type="text" class="text border pl5 mr20" name="title" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">发起人：</span>
          <input type="text" class="text border pl5 mr20" name="initiator" value="" />
        </div></li>
         <li><div class="item-box"><span class="display-ib mr5">昵称：</span>
          <input type="text" class="text border pl5 mr20" name="initiatorNickName" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">项目类型：</span>
          <select class="border mr20 h32 mw100" name="type">
            <option value="">全部</option>
            <option value="0">个人求助</option>
            <option value="6">产品急销</option>
             <option value="7">实现梦想</option>
          </select></div>
        </li>
        <li><span class="display-ib mr5">删除时间：</span> 
	          <input class="text border pl5 w120 date" type=text name="delTimeStart" id="delTimeStart" onclick="WdatePicker({maxDate: '#F{$dp.$D(\'delTimeEnd\')}'})"  > 
	         <span class="pl5 pr5">至</span>
	         <input class="text border pl5 w120 mr20 date" type=text name="delTimeEnd" id="delTimeEnd" onclick="WdatePicker({minDate: '#F{$dp.$D(\'delTimeStart\')}'})">
	    </li>
        
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getPreheatingListAjax();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="YWGL_XMGL_YSC_DC">
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
          <th>项目编号</th>
          <th>项目名称</th>
          <th>发起人</th>
          <th>昵称</th>
          <th>真实姓名</th>
          <th>项目类型</th>
          <th>支持基金会</th>
          <th>筹资目标（元）</th>
          <th>已筹金额（元）</th>
          <th>支持人次</th>
          <th>操作人</th>
          <th>删除时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody class="f12" id="projectData"></tbody>
      </tbody>
    </table>
  </div>
   <!--分页-->
  <div class="paging"  id="projectPagerTag"></div>
  <!--分页 end-->
  <!--导出标题  -->
  <table id="exportTable" hidden="true">
      <thead>
        <tr>
          <th exp-name="index">序号</th>
          <th exp-name="projectNo">项目编号</th>
          <th exp-name="title">项目名称</th>
          <th exp-name="initiator">发起人</th>
          <th exp-name="initiatorNickName">昵称</th>
				<th exp-name="initiatorRealName">真实姓名</th>
          <th exp-name="type">项目类型</th>
          <th exp-name="foundationName">支持基金会</th>
          <th exp-name="facTarget">筹资目标（元）</th>
          <th exp-name="supportAmt">已筹金额（元）</th>
           <th exp-name="supportNumber">支持人次</th>
          <th exp-name="author">操作人</th>
          <th exp-name="delTime">删除时间</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="projectListTemplate" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.projectNo}}</td>
          <td>{{= data.title}}</td>
          <td>{{= data.initiator}}</td>
          <td>{{= data.initiatorNickName}}</td>
		  <td>{{= data.initiatorRealName}}</td>
		  <td>
		  {{if data.type<="5"}}    
	     	 个人求助
	      {{/if}}
		   {{if data.type=="6"}}        
	                         产品急销
	      {{/if}}
   		   {{if data.type=="7"}}       
	       	 实现梦想
	      {{/if}}
          </td>
          <td>{{= data.foundationName}}</td>
          <td>{{= data.facTarget}}</td>
          <td>{{= data.supportAmt}}</td>
		  <td>{{= data.supportNumber}}</td>
          <td>{{= data.author}}</td>
		  <td>{{= data.delTime}}</td>
		 
          <td>
			<shiro:hasPermission name="YWGL_XMGL_YSC_CK">
		        <a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.projectId}}&type={{= data.type}}" target="_blank" class="link-blue mr20 click-link" >查看</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="YWGL_XMGL_YSC_SCYY">
				 <a href="javascript:void(0);" class="link-blue ml10  mr10 deleteReasonDialog" id="{{= data.projectId}}" >删除原因</a>
			</shiro:hasPermission>
		  </td>
        </tr>
{{/each}}
</script>


<script language="javascript" src="<%=basePath %>js/easy/bus/projectManage/preheatingList.js"></script>
<script id="showReasonTmpl" type="text/x-jquery-tmpl">
   <%@include file="/WEB-INF/pages/easy/bus/projectManage/dialog/showReasonTmpl.jsp" %>
</script>