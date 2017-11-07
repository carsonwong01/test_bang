<!--业务管理->项目管理->所有项目->--项目详情->回报详情-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="p20">
	<form id="dataForm">
		<input type="hidden" name="id" value="${projectId}" /> <input
			type="hidden" name="type" value="${type}" />
	</form>
	<div>
		<div class="pt20">
			<span class="pt20 mt40 f16">回报详情</span>
			<hr>
		</div>
	</div>
	
	<div class="mt20 table-container">
		<table class="table table-style gray6 tc">
			<thead>
				<tr class="title">
					<th class="tc">序号</th>
					<th>回报金额</th>
					<th>回报数量</th>
					<th>回报内容</th>
					<th>回报物图片</th>
				</tr>
			</thead>
			<tbody class="f12" id="projectReturnData"></tbody>
			</tbody>
		</table>

	</div>
	<!--分页-->
	<div class="paging" id="projectReturnPagerTag"></div>
	<!--分页 end-->
</div>

<script id="projectReturnTemplate" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.amount}}</td>
          <td>{{if data.returnNum=='-1'}}无限{{else}}{{= data.returnNum}}{{/if}}</td>
          <td style="max-width: 200px;white-space: initial;line-height: 20px;text-align: left;">{{= data.content}}</td>
          <td><div class="pr30"><img src="{{= data.imgUrl}}" class="border p4 w80 h60 imgPreviewNew"></div></td>
        </tr>
{{/each}}
</script>


<script language="javascript"
	src="<%=basePath%>js/easy/bus/projectManage/local/projectReturns.js"></script>