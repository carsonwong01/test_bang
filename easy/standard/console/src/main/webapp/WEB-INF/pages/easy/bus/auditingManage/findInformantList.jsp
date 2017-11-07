<!--审核管理-举报列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">举报管理</span>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">项目编号：</span> <input type="text"
								class="text border pl5 mr20" name="projectNo" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">项目名称：</span> <input type="text"
								class="text border pl5 mr20" name="projectName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">发起人：</span> <input type="text"
								class="text border pl5 mr20" name="originator" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">昵称：</span> <input type="text"
								class="text border pl5 mr20" name="nickName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">项目类型：</span> <select
								class="border mr20 h32 mw100" name="projectType">
								<option value="">全部</option>
								<option value="0">个人求助</option>
								<option value="6">产品急销</option>
								<option value="7">实现梦想</option>
							</select>
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">项目状态：</span> <select
								class="border mr20 h32 mw100" name="projectStatus">
								<option value="">全部</option>
								<option value="1">众筹中</option>
								<option value="2">众筹成功</option>
								<option value="3">众筹失败</option>
								<option value="4">已删除</option>
							</select>
						</div></li>
					<li><span class="display-ib mr5">最近举报时间：</span> <input
						class="text border pl5 w120 date" type=text name="beginTime"
						id="beginTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})">
						<span class="pl5 pr5">—</span> <input
						class="text border pl5 w120 mr20 date" type=text name="endTime"
						id="endTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'beginTime\')}'})">
					</li>
					<li><div class="item-box">
							<input type="hidden" id="sortKey" name="sortKey" value="current_count">
							<input type="hidden" id="sortValue" name="sortValue" value="desc">
							<a class="btn btn-blue radius-6 mr5 pl1 pr15"
								onclick="controler.getFindInformantListAjax();"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
						<shiro:hasPermission name="YWGL_SHGL_JBGL_DC">
							<li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="export"><i
							class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>
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
					<th>项目类型</th>
					<th>已筹金额（元）</th>
					<th>项目状态</th>
					<th>举报总数（次）<img src="<%=basePath%>images/px-b230.png"
						class="reportTotal" alt="asc" /></th>
					<th>最近7天内举报次数 <img src="<%=basePath%>images/px-b230.png"
						class="reportCurrent" alt="asc" /></th>
					<th>最近举报时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="findInformantListData"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="findInformantListTag"></div>
	<!--分页 end-->
	<!--导出标题  -->
	<table id="exportTable" hidden="true">
		<thead>
			<tr>
				<th exp-name="index">序号</th>
				<th exp-name="projectNo">项目编号</th>
				<th exp-name="projectName">项目名称</th>
				<th exp-name=originator>发起人</th>
				<th exp-name="nickName">昵称</th>
				<th exp-name="projectType">项目类型</th>
				<th exp-name="fundraisedAmt">已筹金额（元）</th>
				<th exp-name="projectStatus">项目状态</th>
				<th exp-name="totalCount">举报总数（次）</th>
				<th exp-name="currentCount">最近7天内举报次数</th>
				<th exp-name="time">最近举报时间</th>
			</tr>
		</thead>
	</table>
	<!--导出标题end -->
</div>

<script id="findInformantListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>
			<a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.id}}&type={{= data.projectType}}" target="_blank" class="link-blue mr20" >{{= data.projectNo}}</a>
		  </td>
          <td>{{= data.projectName}}</td>
          <td>{{= data.originator}}</td>
          <td>{{= data.nickName}}</td>
		  <td>
		  {{if data.projectType<="5"}}    
	     	 个人求助
	      {{/if}}
		   {{if data.projectType=="6"}}        
	                         产品急销
	      {{/if}}
   		   {{if data.projectType=="7"}}       
	       	 实现梦想
	      {{/if}}
          </td>
          <td>{{= data.fundraisedAmt}}</td>
          <td>
 		  {{if data.projectStatus<="1"}}    
	     	 众筹中
	      {{/if}}
		   {{if data.projectStatus=="2"}}        
	                         众筹成功
	      {{/if}}
   		   {{if data.projectStatus=="3"}}       
	       	众筹失败
	      {{/if}}
		  {{if data.projectStatus=="4"}}       
	       	 已删除
	      {{/if}}
		  </td>
          <td>{{= data.totalCount}}</td>
		  <td>{{= data.currentCount}}</td>
		 <td>{{= data.time}}</td>
          <td>
			<shiro:hasPermission name="YWGL_SHGL_JBGL_JBXQ">
		      <a data-url="bus/auditingManage/findInformantDetailList.do?projectId={{= data.id}}&totalCount={{= totalCount}}&currentCount={{= currentCount}}" class="link-blue mr20 click-link" >举报详情</a>
		  </shiro:hasPermission>
		</td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/findInformantList.js"></script>