<%@page import="com.dimeng.entity.table.site.TSiteInfo"%>
<%@page import="com.dimeng.enums.variable.TextVariable"%>
<%@page import="com.dimeng.utils.SystemCache"%>
<%@page import="com.dimeng.constants.SystemConstant"%>
<%@page import="com.dimeng.entity.ext.site.SiteAttentionResp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<% 
 TSiteInfo siteInfo=(TSiteInfo)SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
 List<SiteAttentionResp> attentionList=(List<SiteAttentionResp>)SystemCache.getCache(SystemConstant.CacheKey.SITE_ATTENTION_LIST);
%>
<!-- 头部菜单栏  菜单索引   begin -->
<input type="hidden" id="head_menus_index" value="H_SY"/>
<!-- 头部菜单栏  菜单索引   end -->
<!--首页客服浮层-->
<div class="floating_layer">
	<ul>
    	<li class="item">
            <div class="block weixin code">
                <div class="con"><div class="border"><img style="width: 140px;height: 140px" src="<%=attentionList.get(0).getPictureUrl()%>"><p><%=attentionList.get(0).getTitle()%></p><i class="arrow"></i></div></div>
            </div>
        </li>
      <%--   <li class="item">
            <div class="block app code">
                <div class="con"><div class="border"><img style="width: 140px;height: 140px" src="<%=attentionList.get(2).getPictureUrl()%>"><p><%=attentionList.get(2).getTitle()%></p><i class="arrow"></i></div></div>
            </div>
        </li> --%>
    	<li class="item">
        	<div class="block service">
                <div class="con">
                	<div class="border">
                    	<i class="arrow"></i>
                        <ul>
                          <c:forEach items="${cusService}" var="obj" varStatus="sta">
		                   <li><a href="tencent://message/?uin=${obj.qq }&Site=&Menu=yes" >${obj.nickName }</a></li>
		                  </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </li>
    	<li class="item" id="returnTop"><a class="block back" onclick="javascript:void(0)"></a></li>
	</ul>
    
</div>  
<!--浮层-->

<div id="homeContent">


</div>

<!-- 模板 -->
<script id="homeContentTmpl" type="text/x-jquery-tmpl">
	<%@include file="/WEB-INF/pages/easy/home/homePageBody.jsp" %>
</script>
 
<form id="homeForm" method="post" action="<%=basePath %>home/projectDetail.html" target="_blank">
  <input type="hidden" name="projectId" id="hidden_projectId"/>
</form>

<script type="text/javascript">
var  currUserId="${currUser.userId}";//当前登录人ID
//自适应宽度
$(window).resize(function() {
    var width = $(this).width();		
    if(width > 1300){
	$("body").attr("class","wrap-1220");
    
    }else{
	$("body").attr("class","wrap-1002");
    }
});

$(function(){
	//自适应宽度
	var width = $(window).width();		
	if(width > 1300){
	$("body").attr("class","wrap-1220");
    
	}else{
	$("body").attr("class","wrap-1002");
    }
});

$("#returnTop a").click(function(){
	$("html,body").animate({scrollTop:0},1000);
	
});

if (!!window.chrome)$('.palt-cen>p').addClass('spa');
$(function(){
    $('.dao-t>p>span').each(function(){
        var withs=$(this).html();
        $(this).parents('p').css('width',withs)
        if(parseInt(withs)<10){
            $(this).css('left',0)
        }
    })
})

</script>
<!-- add by wsh *******************-->
<script type="text/javascript" src="<%=basePath %>js/common/percentage.js"></script>
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<!-- add by wsh end  -->
<script type="text/javascript" src="<%=basePath %>easy/js/home/homePage.js"></script> 
