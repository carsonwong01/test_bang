<!--项目审核列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<div class="border">
			<div class="title-container">
				<i class="icon-i w30 h30 va-middle title-left-icon"></i><span
					id="detailHtml">项目验证审核</span>
			</div>
			<div class="content-container pl40 pt30 pr40 pb20">
				<ul class="gray6 input-list-container clearfix">
					<li><div class="item-box">
							<span class="display-ib mr5">项目编号：</span> <input type="text"
								class="text border pl5 mr20 w100" name="projectNo" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">项目名称：</span> <input type="text"
								class="text border pl5 mr20 w100" name="projectName" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">发起人：</span> <input type="text"
								class="text border pl5 mr20 w100" name="originator" value="" />
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">昵称：</span> <input type="text"
								class="text border pl5 mr20 w100" name="nickName" value="" />
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
								<option value="2">众筹结束</option>
								<option value="3">众筹失败</option>
								<option value="4">已删除</option>
							</select>
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">验证类型：</span> <select
								class="border mr20 h32 mw100" name="validationType">
								<option value="">全部</option>
								<option value="1">本人验证</option>
								<option value="2">亲属验证</option>
								<option value="3">夫妻验证</option>
								<option value="4">组织验证(企业验证)</option>
							</select>
						</div></li>
					<li><div class="item-box">
							<span class="display-ib mr5">审核状态：</span> <select
								class="border mr20 h32 mw100" name="auditStatus">
								<option value="">全部</option>
								<option value="1">待审核</option>
								<option value="2">审核不通过</option>
								<option value="3">审核通过</option>
							</select>
						</div></li>
					<li><span class="display-ib mr5">提交时间：</span> <input
						class="text border pl5 w120 date" type=text name="startSubmitTime"
						id="startSubmitTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endSubmitTime\')}'})">
						<span class="pl5 pr5">至</span> <input
						class="text border pl5 w120 mr20 date" type=text
						name="endSubmitTime" id="endSubmitTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'startSubmitTime\')}'})">
					</li>
					<li><span class="display-ib mr5">审核时间：</span> <input
						class="text border pl5 w120 date" type=text name="startAuditTime"
						id="startAuditTime"
						onclick="WdatePicker({maxDate: '#F{$dp.$D(\'endAuditTime\')}'})">
						<span class="pl5 pr5">至</span> <input
						class="text border pl5 w120 mr20 date" type=text
						name="endAuditTime" id="endAuditTime"
						onclick="WdatePicker({minDate: '#F{$dp.$D(\'startAuditTime\')}'})">
					</li>
					<li><div class="item-box">
							<a class="btn btn-blue radius-6 mr5 pl1 pr15"
								onclick="controler.getProjectAuditListAjax();"><i
								class="icon-i w30 h30 va-middle search-icon "></i>搜索</a>
						</div></li>
						<shiro:hasPermission name="YWGL_SHGL_XMYZSH_DC">
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
					<th>项目状态</th>
					<th>验证类型</th>
					<th>提交时间</th>
					<th>审核状态</th>
					<th>审核人</th>
					<th>审核时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="f12" id="projectAuditData"></tbody>
			</tbody>
		</table>
	</div>
	<!--分页-->
	<div class="paging" id="pagerTag"></div>
	<!--分页 end-->
	<!--导出标题  -->
	<table id="exportTable" hidden="true">
		<thead>
			<tr>
				<th exp-name="index">序号</th>
				<th exp-name="projectNo">项目编号</th>
				<th exp-name="projectName">项目名称</th>
				<th exp-name="originator">发起人</th>
				<th exp-name="nickName">昵称</th>
				<th exp-name="projectType">项目类型</th>
				<th exp-name="projectStatus">项目状态</th>
				<th exp-name="identifyType">验证类型</th>
				<th exp-name="submitTime">提交时间</th>
				<th exp-name="auditStatus">审核状态</th>
				<th exp-name="auditor">审核人</th>
				<th exp-name="auditTime">审核时间</th>
			</tr>
		</thead>
	</table>
	<!--导出标题end -->
</div>

<script id="projectAuditTemplate" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>
 			<a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.projectId}}&type={{= data.projectType}}" target="_blank" class="link-blue mr20" >{{= data.projectNo}}</a>
		  </td>
          <td>{{= data.projectName}}</td>
          <td>{{= data.originator}}</td>
          <td>{{= data.nickName}}</td>
		  <td>
	     {{if data.projectType=="1"}}    
	     	 个人求助
	      {{/if}}
 		  {{if data.projectType=="2"}}    
	     	个人求助
	      {{/if}}
		   {{if data.projectType=="3"}}        
	                         个人求助
	      {{/if}}
   		   {{if data.projectType=="4"}}       
	       	个人求助
	      {{/if}}
		  {{if data.projectType=="5"}}    
	     	个人求助
	      {{/if}}
		   {{if data.projectType=="6"}}        
	                         产品急销
	      {{/if}}
   		   {{if data.projectType=="7"}}       
	       	 实现梦想
	      {{/if}}
          </td>
 		  <td>
		  {{if data.projectStatus<="1"}}    
	     	 众筹中
	      {{/if}}
		   {{if data.projectStatus=="2"}}        
	                         众筹结束
	      {{/if}}
   		   {{if data.projectStatus=="3"}}       
	       	众筹失败
	      {{/if}}
		  {{if data.projectStatus=="4"}}       
	       	 已删除
	      {{/if}}
          </td>
		  <td>
 		  {{if data.validationType=="1"}}    
	     	本人验证
	      {{/if}}
 		  {{if data.validationType=="2"}}    
	     	亲属验证
	      {{/if}}
		   {{if data.validationType=="3"}}        
	                       夫妻验证
	      {{/if}}
   		   {{if data.validationType=="4"}}       
	       	组织验证(企业验证)
	      {{/if}}
		 
          </td>
          <td>{{= data.submitTime}}</td>
           <td>
		  {{if data.auditStatus<="1"}}    
	     	待审核
	      {{/if}}
		   {{if data.auditStatus=="2"}}        
	                         审核不通过
	      {{/if}}
   		   {{if data.auditStatus=="3"}}       
	       	审核通过
	      {{/if}}
          </td>
          <td>  {{if data.auditStatus!="1"}}      {{= data.auditor}}{{/if}}</td>
		  <td>  {{if data.auditStatus!="1"}}      {{= data.auditTime}}{{/if}}</td>
          <td>
			<shiro:hasPermission name="YWGL_SHGL_XMYZSH_YZXQ">
		       <a data-url="bus/auditingManage/proAuthenticatedDetail.do?validationId={{= data.id}}&to=ck" class="link-blue mr20 click-link" >验证详情</a>
			</shiro:hasPermission>
			{{if data.auditStatus=="1"}} 
				<shiro:hasPermission name="YWGL_SHGL_XMYZSH_YZSH">
		       		<a data-url="bus/auditingManage/proAuthenticatedDetail.do?validationId={{= data.id}}&to=sh" class="link-blue mr20 click-link" >审核</a>
				</shiro:hasPermission>
			{{/if}}
  		  </td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/projectAuditingList.js"></script>