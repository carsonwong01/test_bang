<!--推荐项目-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="dataForm">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">项目推荐管理</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
        <li><div class="item-box"><span class="display-ib mr5">项目编号：</span>
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
            <option value="0">全部</option>
            <option value="6">产品急销</option>
             <option value="7">实现梦想</option>
          </select></div>
        </li>
       <li><div class="item-box"><span class="display-ib mr5">项目状态：</span>
          <select class="border mr20 h32 mw100" name="projectStatus">
            <option value="">全部</option>
            <option value="已推荐">已推荐</option>
            <option value="未推荐">未推荐</option>
          </select></div>
        </li>
        
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="controler.getAllProjectListAjaxList();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <shiro:hasPermission name="ZDGL_SYXM_XMTJ_DC">
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
          <th>项目类型</th>
          <th>筹资目标（元）</th>
          <th>已筹金额（元）</th>
          <th>筹资期限（天）</th>
          <th>支持人次</th>
          <th>推荐状态</th>
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
          <th exp-name="type">项目类型</th>
          <th exp-name="facTarget">筹资目标（元）</th>
          <th exp-name="supportAmt">已筹金额（元）</th>
          <th exp-name="financingDays">筹资期限（天）</th>
          <th exp-name="supportNumber">支持人次</th>
          <th exp-name="recommendStatus">推荐状态</th>
        </tr>
      </thead>
    </table> 
    <!--导出标题end -->
</div>

<script id="allProjectListTemplate" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.projectNo}}</td>
          <td>{{= data.title}}</td>
          <td>{{= data.initiator}}</td>
          <td>{{= data.initiatorNickName}}</td>
		  <td> 
		   {{if data.type=="6"}}        
	                         产品急销
	      {{/if}}
   		   {{if data.type=="7"}}       
	       	 实现梦想
	      {{/if}}
          </td>
          <td>{{= data.facTarget}}</td>
          <td>{{= data.supportAmt}}</td>
          <td>{{= data.financingDays}}</td>
		  <td>{{= data.supportNumber}}</td>
		  <td>
		  	{{= data.recommendStatus}}
          </td>
          <td>
			 <shiro:hasPermission name="ZDGL_SYXM_XMTJ_XQ">
		    	 <a href="<%=basePath %>bus/projectManage/projectDetails.do?projectId={{= data.projectId}}&type={{= data.type}}" target="_blank" class="link-blue mr20 click-link" >查看</a>
			 </shiro:hasPermission>
			 {{if data.recommendStatus=="已推荐"}}    
 			 <shiro:hasPermission name="ZDGL_SYXM_XMTJ_TJXQ">
  				  <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.recommendInfo('1','{{= data.recommendId}}','推荐详情','{{= data.title}}','{{= data.projectNo}}');">推荐详情</a>   
	     	  </shiro:hasPermission>
			 {{/if}}
		     {{if data.recommendStatus=="未推荐"}}    
  				 <shiro:hasPermission name="ZDGL_SYXM_XMTJ_TJ">
 				 <a href="javascript:void(0);" class="link-blue mr20" onclick="controler.recommendInfo('2','{{= data.projectId}}','推荐','{{= data.title}}','{{= data.projectNo}}');">推荐</a>    
			</shiro:hasPermission>	     	
 			{{/if}}
		  </td>
        </tr>
{{/each}}
</script>


<script language="javascript" src="<%=basePath %>js/easy/bus/projectManage/recommendProList.js"></script>