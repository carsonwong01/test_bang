<!--审核管理-举报列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">举报详情</span>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">举报总数：</span> <span>${totalCount }次</span>
						</div></li>
					<li><div class="item-box ml30">
							<span class="display-ib mr5">最近7天内举报次数：</span>  <span>${currentCount }次</span>
						</div></li>
				</ul>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">举报人：</span> <input type="text"
								class="text border pl5 mr20" name="complainant" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">昵称：</span> <input type="text"
								class="text border pl5 mr20" name="nickName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">姓名：</span> <input type="text"
								class="text border pl5 mr20" name="name" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">联系方式：</span> <input type="text"
								class="text border pl5 mr20" name="contact" value="" />
						</div></li>
					
					<li><span class="display-ib mr5">举报时间：</span> <input
						class="text border pl5 w120 date" type=text name="beginTime"
						id="beginTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endTime\')}'})">
						<span class="pl5 pr5">—</span> <input
						class="text border pl5 w120 mr20 date" type=text name="endTime"
						id="endTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'beginTime\')}'})">
					</li>
					<li><div class="item-box">
					<input type="hidden" name="id" value="${projectId }"/>
							<a class="btn btn-blue radius-6 mr5 pl1 pr15"
								onclick="controler.getFindInformantDetailListAjax();"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
					<li><a class="btn btn-blue radius-6 mr5  pl1 pr15" id="export"><i
							class="icon-i w30 h30 va-middle export-icon "></i>导出</a></li>

				</ul>
			</div>
		</div>

	</form>
	<div class="mt20 table-container">
		<table class="table table-style gray6 tc">
			<thead>
				<tr class="title">
					<th class="tc">序号</th>
					<th>举报人</th>
					<th>昵称</th>
					<th>姓名</th>
					<th>联系方式</th>
					<th>举报原因</th>
					<th>举报时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="findInformantDetailListData"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="findInformantDetailListTag"></div>
	<!--分页 end-->
	<!--导出标题  -->
	<table id="exportTable" hidden="true">
		<thead>
			<tr>
				<th exp-name="index">序号</th>
				<th exp-name="complainant">举报人</th>
				<th exp-name="nickname">昵称</th>
				<th exp-name="name">姓名</th>
				<th exp-name="contact">联系方式</th>
				<th exp-name="reason">举报原因</th>
				<th exp-name="time">举报时间</th>
			</tr>
		</thead>
	</table>
	<!--导出标题end -->
</div>

<script id="findInformantDetailListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.complainant}}</td>
          <td>{{= data.nickname}}</td>
          <td>{{= data.name}}</td>
          <td>{{= data.contact}}</td>
          <td title="{{= data.tips}}">{{= data.reason}}</td>
		  <td>{{= data.time}}</td>
          <td>
		      <a href="javascript:void(0);" class="link-blue ml10  mr10 toShowDetailDialog" id="{{= data.id}}">举报内容</a>
		  </td>
        </tr>
{{/each}}
</script>

<script id="reportDetailsTemp" type="text/x-jquery-tmpl">
	<ul class="gray6 pt20">
		<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">举报原因：</span>
							<div class="tl">
								{{= singleResult}} 
							</div>
						</div>
		</li>
		<li>
			<div class="pr mh30 pl160">
			<span class="display-ib w140 lh30 tr mr5 pa left0 top0">举报相关图片：</span>
							  <div class="tl h30 lh30">
							   <ul class="gray6 input-list-container clearfix">
							     {{each(i,item) list}}
					                 <li>
					                     <div class="pr30"><img src="{{= item.url}}"  class="border p4 w120 h150 imgPreviewNew"></div>
					              </li>
					 		{{/each}}
					   </ul>
				</div>
			</div>
		</li>
	</ul>
</script>

<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/findInformantDetailList.js"></script>