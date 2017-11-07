<!--新手指南-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="p20">
<form id="form">
 <input type="hidden" name="type" id="type_id" value="${param.type}"/>
 <input type="hidden" name="id" />
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">帮助中心</span></div>
    <div class="content-container pl40 pt30 pr40 pb20">
      <ul class="gray6 input-list-container clearfix">
      
      
        <li><div class="item-box"><span class="display-ib mr5">标题</span>
          <input type="text" class="text border pl5 mr20" name="title" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">创建人</span>
          <input type="text" class="text border pl5 mr20" name="userName" value="" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">创建时间</span>
        
        <input type="text" name="beginTime"  class="text border pl5 w120 date" id="beginTime"
								onclick="WdatePicker({readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" />
							<span class="pl5 pr5">至</span> <input type="text" name="endTime"  class="text border pl5 w120 mr20 date" id="endTime"
								onclick="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" />
        </div></li>
        <li><div class="item-box"><span class="display-ib mr5">状态</span>
          <select class="border mr20 h32 mw100" name="status">
            <option value="">全部</option>
            <option value="1">已发布</option>
            <option value="2">未发布</option>
          </select></div>
        </li>
        <li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" id="searchAdvert"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>
        <li><div class="item-box">
        <c:if test="${type=='1'}">
        	<shiro:hasPermission name="ZDGL_BZZX_FQXM_XZ">
        	<a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="site/helpCenter/siteArticleGuide/addArticleInfo.do?type=${param.type}"><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a>
        	</shiro:hasPermission>
        </c:if>
         <c:if test="${type=='2'}">
        	<shiro:hasPermission name="ZDGL_BZZX_XMGL_XZ">
        	<a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="site/helpCenter/siteArticleGuide/addArticleInfo.do?type=${param.type}"><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a>
        	</shiro:hasPermission>
        </c:if>
         <c:if test="${type=='3'}">
        	<shiro:hasPermission name="ZDGL_BZZX_ZCXM_XZ">
        	<a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="site/helpCenter/siteArticleGuide/addArticleInfo.do?type=${param.type}"><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a>
        	</shiro:hasPermission>
        </c:if>
         <c:if test="${type=='4'}">
        	<shiro:hasPermission name="ZDGL_BZZX_QTWT_XZ">
        	<a class="btn btn-blue radius-6 mr5  pl1 pr15 click-link" data-url="site/helpCenter/siteArticleGuide/addArticleInfo.do?type=${param.type}"><i class="icon-i w30 h30 va-middle add-icon"></i>新增</a>
        	</shiro:hasPermission>
        </c:if>
        </li>
      </ul>
    </div>
  </div>
  
  </form>
  <div class="mt20 table-container">
    <table class="table table-style gray6 tc">
      <thead>
        <tr class="title">
          <th class="tc">序号</th>
          <th>标题</th>
          <th>创建人</th>
          <th>创建时间</th>
          <th>状态</th>
          <th class="w200">操作</th>
        </tr>
      </thead>
      <tbody id="container" class="f12">
      </tbody>
    </table>
  </div>
  <!--分页-->    
	   	<div  id="paging"> </div>
</div>
<!-- 站点信息模板 -->
<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(i,zd) list}}
   <tr class="">
	<td>{{= i+1}}</td>
	<td>{{= zd.title}}</td>
	<td>{{= zd.userName}}</td>
	<td>{{= zd.dateCreate}}</td>
	<td>
		{{if zd.status=="1"}}
			已发布
		{{/if}}
		{{if zd.status=="2"}}
			未发布
		{{/if}}
	</td>
	<td class="tc">
			{{if type=='1'}}
			<shiro:hasPermission name="ZDGL_BZZX_FQXM_CK">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/queryArticleGuideById.do?id={{= id}}&type=${param.type}">查看</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_FQXM_XG">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/changeArticleGuide.do?id={{= id}}&type=${param.type}">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_FQXM_ZD">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.toUp('{{= id}}', 1,'{{= zd.title}}')">置顶</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_FQXM_SC">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.articleGuideDel('{{= id}}','{{= zd.title}}')">删除</a>
			</shiro:hasPermission>
			{{/if}}
			{{if type=='2'}}
			<shiro:hasPermission name="ZDGL_BZZX_XMGL_CK">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/queryArticleGuideById.do?id={{= id}}&type=${param.type}">查看</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_XMGL_XG">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/changeArticleGuide.do?id={{= id}}&type=${param.type}">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_XMGL_ZD">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.toUp('{{= id}}', 1,'{{= zd.title}}')">置顶</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_XMGL_SC">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.articleGuideDel('{{= id}}','{{= zd.title}}')">删除</a>
			</shiro:hasPermission>
			{{/if}}
			{{if type=='3'}}
			<shiro:hasPermission name="ZDGL_BZZX_ZCXM_CK">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/queryArticleGuideById.do?id={{= id}}&type=${param.type}">查看</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_ZCXM_XG">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/changeArticleGuide.do?id={{= id}}&type=${param.type}">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_ZCXM_ZD">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.toUp('{{= id}}', 1,'{{= zd.title}}')">置顶</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_ZCXM_SC">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.articleGuideDel('{{= id}}','{{= zd.title}}')">删除</a>
			</shiro:hasPermission>
			{{/if}}
			{{if type=='4'}}
			<shiro:hasPermission name="ZDGL_BZZX_QTWT_CK">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/queryArticleGuideById.do?id={{= id}}&type=${param.type}">查看</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_QTWT_XG">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" data-url="site/helpCenter/siteArticleGuide/changeArticleGuide.do?id={{= id}}&type=${param.type}">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_QTWT_ZD">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.toUp('{{= id}}', 1,'{{= zd.title}}')">置顶</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="ZDGL_BZZX_QTWT_SC">
			<a href="javascript:void(0);" class="link-blue mr20 click-link" onclick="articleGuideController.articleGuideDel('{{= id}}','{{= zd.title}}')">删除</a>
			</shiro:hasPermission>
			{{/if}}
	</td>
  </tr>
{{/each}}
</script>
<script type="text/javascript">
 var type = "${type}";
 if("1" == type)
	 $("#detailHtml").html("发起项目相关问题");
	 else if("2" == type)
		 $("#detailHtml").html("项目管理相关问题");
		 else if("3" == type)
			 $("#detailHtml").html("支持项目相关问题");
			 else if("4" == type)
				 $("#detailHtml").html("其他问题"); 
		 
		 
		 
 var ArticleGuideController=DM.Controller.sub({
	 toUp:function(val, isTop, title){
		 var _self=this;
		 Dialog.confirm({
	    	 title:"置顶确认",
		     msg:'需要把"<span class="link-blue">'+title+'</span>"置顶吗？',
		     picClass:"tip",
		     sureName:"确认",
		     showCancel:true,
		     showClose:true,
		     callBack:function(){
		    	 _self.toTop(val, isTop);//置顶
		     }
	    });
	 },
	 articleGuideDel:function(val, title){
		 var _self=this;
		 Dialog.confirm({
	    	 title:"删除确认",
		     msg:"确认删除该内容吗？删除后将不可恢复！",
		     picClass:"tip",
		     showCancel:true,
		     showClose:true,
		     sureName:"确认",
		     callBack:function(){
		    	 _self.toDel(val);//删除
		     }
	    });
	 },
	//删除
	 toDel:function(val){
		 var _self=this;
		 DM.ajax({
			 url:"site/helpCenter/articleGuideDel.do",
			 data:{id:val},
		     success:function(data){
		    	 if("000000" == data.code){
		    		 articleGuideController.loadRecord();
		    	 }
		     },
		     error:function(){
		    	 
		     }
		 });
	 },
	 //置顶
	 toTop:function(val, isTop){
		 var _self=this;
		 DM.ajax({
			 url:"site/articleGuideTop.do",
			 data:{id:val,isTop:isTop},
		     success:function(data){
		    	 if("000000" == data.baseDataResp.code){
		    		 articleGuideController.loadRecord();
		    	 }
		     },
		     error:function(){
		    	 
		     }
		 });
	 },
	 loadRecord:function(){
		/*  var _self=this;
		 var data=this.loadData();
		 _self.setProjectList(data);
		  */
		 
			//查询数据
	    	DM.ajax({"formId":"form","serialize":true,"url":"site/helpCenter/articleGuidAjax.do","success":this.pageCallBack});
		 
		    /* $("#container").empty();
			//填充数据
			$('#proLeadTemple').tmpl({list:data}).appendTo("#container"); */
	 },
		//项目列表分页信息
		pageCallBack:function(data){
			
			 $("#container").empty();
				//填充数据
				$('#proLeadTemple').tmpl(data.pageResult).appendTo("#container");
			  
			//初始化分页标签
				DM.PageTags.init({"divId":"paging","formId":"form","curPage":data.pageResult.pageIndex,"totalCount":data.pageResult.recordCount,
					          "pageCount":data.pageResult.pageTotal,"url":"site/helpCenter/articleGuidAjax.do","toPageCallBack":arguments.callee});
		},
	 
  });
 var articleGuideController=new ArticleGuideController();
 DM.Page.ready({
	 "加载数据":function(){
		 articleGuideController.loadRecord();
		 
		//绑定查询事件
			$("#searchAdvert").bind("click",function(){
				articleGuideController.loadRecord();
			});
	 }
	 
 });
 
</script>

