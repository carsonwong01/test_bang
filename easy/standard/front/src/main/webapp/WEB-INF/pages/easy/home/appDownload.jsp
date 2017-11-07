<%@page import="com.dimeng.enums.variable.TextVariable"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<%@page import="com.dimeng.entity.ext.site.SiteAttentionResp"%>
<% 
 List<SiteAttentionResp> attentionList=(List<SiteAttentionResp>)SystemCache.getCache(SystemConstant.CacheKey.SITE_ATTENTION_LIST);
%>
<!-- 头部菜单栏  菜单索引   begin -->
<input type="hidden" id="head_menus_index" value="H_XWZX" />
<!-- 头部菜单栏  菜单索引   end -->

<div class="app-down-container">
  <div class="layout">
    <div class="app-down-content">
      <h1 class="f36 white app-down-title">轻众筹APP下载</h1>
      <div class="clearfix">
        <div class="fl ww60">
        <ul class="code-ul">
         	<li><img style="width: 140px;height: 140px" src="<%=attentionList.get(3).getPictureUrl()%>"><span class="f24 white iphone-icon">iPhone</span></li>
         	<li><img style="width: 140px;height: 140px"  src="<%=attentionList.get(2).getPictureUrl()%>"><span class="f24 white android-icon">Android</span></li>
         </ul>
        </div>
        <div class="fl ww40"><div class="tc"><img src="<%=basePath %>easy/images/Mobile.png"></div></div>
      </div>
    </div>
  </div>
</div>