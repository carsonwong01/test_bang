<!--项目审核动态列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">动态管理</span>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">用户：</span> <input type="text"
								class="text border pl5 mr20" name="userName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">项目标题：</span> <input type="text"
								class="text border pl5 mr20" name="projectName" value="" />
						</div></li>
					<li><span class="display-ib mr5">更新时间：</span> <input
						class="text border pl5 w120 date" type=text name="beginTime"
						id="beginTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})">
						<span class="pl5 pr5">—</span> <input
						class="text border pl5 w120 mr20 date" type=text
						name="endTime" id="endTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'beginTime\')}'})">
					</li>
					<li><div class="item-box">
							<a class="btn btn-blue radius-6 mr5 pl1 pr15"
								onclick="findDynamicsListControler.getDynamicsListAjax();"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
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
					<th>昵称</th>
					<th>项目标题</th>
					<th>动态内容</th>
					<th>更新时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="findDynamicsListData"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="findDynamicsListPagerTag"></div>
	<!--分页 end-->
</div>

<script id="findDynamicsListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.userName}}</td>
          <td>{{= data.nickName}}</td>
          <td>{{= data.projectName}}</td>
          <td style="max-width: 200px;white-space: initial;line-height: 20px;text-align: left;">{{= data.content}}</td>
		  <td>{{= data.time}}</td>
          <td>
		 <shiro:hasPermission name="YWGL_SHGL_XMDTGL_DTXQ">
		         <a data-url="bus/auditingManage/findDynamicsDetails.do?projectId={{= data.projectId}}&projectNo={{= data.projectNo}}" class="link-blue mr20 click-link" >动态详情</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="YWGL_SHGL_XMDTGL_DTXQ">       
		 <a href="javascript:void(0);" class="link-blue ml10  mr10 toDeleteDialog" id="{{= data.id}}">删除</a>
		</shiro:hasPermission>
		  </td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/findDynamicsList.js"></script>