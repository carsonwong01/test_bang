<!--项目评论列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">评论管理</span>
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
					<li><span class="display-ib mr5">评论时间：</span> <input
						class="text border pl5 w120 date" type=text name="beginTime"
						id="beginTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})">
						<span class="pl5 pr5">—</span> <input
						class="text border pl5 w120 mr20 date" type=text name="endTime"
						id="endTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'beginTime\')}'})">
					</li>
					<li><div class="item-box">
							<a class="btn btn-blue radius-6 mr5 pl1 pr15"
								onclick="controler.getFindCommentListAjax();"><i
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
					<th>项目标题</th>
					<th>留言内容</th>
					<th>留言时间</th>
					<th>评论数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="findCommentListData"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="findCommentListTag"></div>
	<!--分页 end-->
</div>

<script id="findCommentListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.userName}}</td>
          <td>{{= data.projectName}}</td>
		  <td title="{{= data.tips}}">{{= data.commentContent}}</td>
		  <td>{{= data.dateNewst}}</td>
          <td>{{= data.count}}</td>
          <td>
		 		<span class="headPicUrl hide">{{= data.headPicUrl}}</span>
				<span class="userName hide">{{= data.userName}}</span>
				<span class="datePay hide">{{= data.dateNewst}}</span>
				<span class="tips hide">{{= data.tips}}</span>
				<shiro:hasPermission name="YWGL_SHGL_PLGL_CK">
		        	<a href="javascript:void(0);" class="link-blue ml10  mr10 viewCommentDialog" id="{{= data.orderId}}">查看</a>
		        </shiro:hasPermission>
				<shiro:hasPermission name="YWGL_SHGL_PLGL_SC">
					<a href="javascript:void(0);" class="link-blue ml10  mr10 toDeleteDialog" id="{{= data.orderId}}">删除</a>
		  		</shiro:hasPermission>
			</td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/findCommentList.js"></script>
<script id="loadCommentTmpl" type="text/x-jquery-tmpl">
	<%@include file="/WEB-INF/pages/easy/bus/auditingManage/template/loadCommentTmpl.jsp" %>
	</script>