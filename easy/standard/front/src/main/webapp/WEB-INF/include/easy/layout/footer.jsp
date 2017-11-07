<!--底部-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dimeng.entity.ext.site.SiteAttentionResp"%>
<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
//关注我们
 List<SiteAttentionResp> attentionList=(List<SiteAttentionResp>)SystemCache.getCache(SystemConstant.CacheKey.SITE_ATTENTION_LIST);
%>
<div class="footer">
<div class="layout clearfix">
				<div class="footerLogo fl">
				<a href="<%=basePath%>home/index.do">
					<img alt="<%=siteInfo.getSiteName() %>" src="<%=siteInfo.getBackLogoId()%>" style="width: 240px;height: 60px;">
				</a>
				</div>
				<div class="footerLink fl">
					<ul>
					<!-- 	<a href="">新手指南 </a>
						<i>|</i> -->
						 <form action="<%=basePath %>home/aboutUs.do" method="POST" id="aboutUsTypeFooterForm">
				   	  		<input name="type" type="hidden" id="type">
				   	  		<input name="title" type="hidden" id="title">
				   	  	</form>
						<a  id="aboutUsTypeFooter" name="h_menu" href="#" onclick="controller.aboutUsTypeFooterClickFooter()">关于我们</a>
						 <div class="hide" id="aboutUsFooterMenu">
            	  </div>
						<i>|</i>
						<a href="<%=basePath%>frontHome/helpCenter.do">帮助中心</a>
					</ul>
				</div>
				<div class="footerAdr fl">
					<p class="phoneNum"><%=siteInfo.getServicePhone()%></p>
					<span class="time">(<%=siteInfo.getWorkTime()%>)</span>
					<ul>
						<li><%=siteInfo.getServiceEmail()%></li>
						<li><%=siteInfo.getCompanyAddr()%></li>
					</ul>
				</div>
				<ul class="QRCodeBox fr">
               <!-- 微信公众号 -->
                <%
                   if(attentionList!=null&&attentionList.get(0).getPictureUrl()!=null){  
                       
                %>
                     <li><img style="width: 79px;height: 89px" src="<%=attentionList.get(0).getPictureUrl()%>"><p><%=attentionList.get(0).getTitle()%></p></li>
                 
               <%      
                   }else{
               %>     
                     <li><img style="width: 79px;height: 89px" src="<%=basePath %>easy/images/code.jpg"></li>
               <%  
                   }
                %>
                
                <!-- app客户端 --> 
                <%
                   if(attentionList!=null&&attentionList.get(1).getPictureUrl()!=null&&attentionList.get(1).getPictureUrl()!=""){  
                       
                %>
                   <li class="ml20"><img style="width: 79px;height: 89px" src="<%=attentionList.get(1).getPictureUrl()%>"><p><%=attentionList.get(1).getTitle()%></p></li>
               <%      
                   }else{
               %>     
                     <li class="ml20"><img style="width: 79px;height: 89px" src="<%=basePath %>easy/images/code.jpg"></li>
               <%  
                   }
                %>
            </ul>
			</div>
    <div class="wrap copyright" style="text-align: center;">
    	<div><a href="#"><img src="<%=basePath %>easy/images/footer_01.jpg"></a><a href="#"><img src="<%=basePath %>easy/images/footer_02.jpg"></a><a href="#"><img  src="<%=basePath %>easy/images/footer_03.jpg"></a><a href="#"><img src="<%=basePath %>easy/images/footer_04.jpg"></a></div>
    	<div class="mt10"><%=siteInfo.getCompanyName()%>©<%=siteInfo.getCopyright()%>|备案号:<%=siteInfo.getRecordation()%></div>
        
    </div>
</div>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.tmpl.min.js"></script>
	<script id="aboutUsFooterMenuTemple" type="text/x-jquery-tmpl">
{{each(i,zd) list}}
	{{if zd.status==1}}
       <dd>
		<a id="abtUs_{{= zd.type}}" type="{{= zd.type}}" title="{{= zd.title}}" href="javascript:void(0)" name="menu" onclick="controller.aboutUsTypeFooterClick($(this));">{{= zd.title}}</a>
	   </dd>
	{{/if}}
{{/each}}
 </script>
<script type="text/javascript" src="<%=basePath %>easy/js/aboutUs/footer.js"></script>
<!--底部-->
 
