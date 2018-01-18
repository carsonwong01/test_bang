<!--底部-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dimeng.entity.ext.site.SiteAttentionResp"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.constants.SystemConstant"%>

<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/index_new.css">

<%
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
//关注我们
 List<SiteAttentionResp> attentionList=(List<SiteAttentionResp>)SystemCache.getCache(SystemConstant.CacheKey.SITE_ATTENTION_LIST);
%>
<footer>
	<div class='foot-a'>
		<div class='fot-ou'>
			<div class='fl tite'>
				<p>
					客服电话(<%=siteInfo.getWorkTime()%>)</br>
					<span><%=siteInfo.getServicePhone()%></span>
				</p>
				<b></b>
			</div>
			<div class='fl mapt'>
				<p><a href="<%=basePath%>home/aboutUs.do">关于我们</a><i></i><a href="<%=basePath%>frontHome/helpCenter.do">帮助中心</a></p>
				<p><span>公司名称：</span><%=siteInfo.getCompanyName()%></p>
				<p><span>公司地址：</span><%=siteInfo.getCompanyAddr()%></p>
				<p><span>公司邮箱：</span><%=siteInfo.getServiceEmail()%></p>
			</div>
			<div class='fl wxin'>
				<!-- 微信公众号 -->
					<%
						if(attentionList!=null&&attentionList.get(0).getPictureUrl()!=null){

					%>
					<a href=""><img src="<%=attentionList.get(0).getPictureUrl()%>"></br><span><%=attentionList.get(0).getTitle()%></span></a>
					<%--<li><img style="width: 79px;height: 89px" src="<%=attentionList.get(0).getPictureUrl()%>"><p><%=attentionList.get(0).getTitle()%></p></li>--%>

					<%
					}else{
					%>
					<%--<li><img style="width: 79px;height: 89px" src="<%=basePath %>easy/images/code.jpg"></li>--%>
					<a href=""><img src="<%=attentionList.get(0).getPictureUrl()%>"></br><span><%=attentionList.get(0).getTitle()%></span></a>
					<%
						}
					%>
				<!-- app客户端 -->
					<%
						if(attentionList!=null&&attentionList.get(1).getPictureUrl()!=null&&attentionList.get(1).getPictureUrl()!=""){

					%>
					<a href=""><img src="<%=attentionList.get(1).getPictureUrl()%>"></br><span><%=attentionList.get(1).getTitle()%></span></a>
					<%--<li class="ml20"><img style="width: 79px;height: 89px" src="<%=attentionList.get(1).getPictureUrl()%>"><p><%=attentionList.get(1).getTitle()%></p></li>--%>
					<%
					}else{
					%>
					<a href=""><img src="<%=attentionList.get(1).getPictureUrl()%>"></br><span><%=attentionList.get(1).getTitle()%></span></a>
					<%--<li class="ml20"><img style="width: 79px;height: 89px" src="<%=basePath %>easy/images/code.jpg"></li>--%>
					<%
						}
					%>
				<div class='clear'></div>
			</div>
		</div>
	</div>
	<div class='foot-c'><p>个人求助、网络互助不属于慈善捐div实性由信息提供方负责</p></div>
	<div class='foot-b'><%=siteInfo.getCompanyName()%>©<%=siteInfo.getCopyright()%>|备案号:<%=siteInfo.getRecordation()%></div>
</footer>




<%--<script type="text/javascript"--%>
	<%--src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>--%>
	<%--<script id="aboutUsFooterMenuTemple" type="text/x-jquery-tmpl">--%>
<%--{{each(i,zd) list}}--%>
	<%--{{if zd.status==1}}--%>
       <%--<dd>--%>
		<%--<a id="abtUs_{{= zd.type}}" type="{{= zd.type}}" title="{{= zd.title}}" href="javascript:void(0)" name="menu" onclick="controller.aboutUsTypeFooterClick($(this));">{{= zd.title}}</a>--%>
	   <%--</dd>--%>
	<%--{{/if}}--%>
<%--{{/each}}--%>
 <%--</script>--%>
<%--<script type="text/javascript" src="<%=basePath %>easy/js/aboutUs/footer.js"></script>--%>
<%--<!--底部-->--%>

