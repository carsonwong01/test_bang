<script type="text/javascript">
    //自适应宽度
    function winWrap() {
        var width = $(window).width();
        if (width > 1300) {
            $("body").attr("class", "wrap-1220");
        } else {
            $("body").attr("class", "wrap-1002");
        }
    };
    $(window).resize(function () {
        winWrap();
    });
    winWrap();
</script>
<!--底部-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dimeng.entity.table.site.TSiteInfo" %>
<%@page import="com.dimeng.utils.SystemCache" %>
<%@page import="com.dimeng.constants.SystemConstant" %>
<%
    TSiteInfo siteInfo = (TSiteInfo) SystemCache.getCache(SystemConstant.CacheKey.SITE_INFO);
%>
<!--头部-->
<form id="projecttype_form" action="<%=basePath%>user/project/projectStart.do">
    <input type="hidden" id="projectType" name="projectType" value="1"/>
</form>
<div class="head">
    <div class="layout clearfix">
        <a href="<%=basePath%>home/index.do">
            <img alt="<%=siteInfo.getSiteName() %>" src="<%=siteInfo.getFrontLogoId()%>"
                 style="width: 240px;height: 60px;">
        </a>
        <ul class="fr clearfix" id="HEADER_MENUS">
            <li><a href="<%=basePath%>home/index.do">首页</a></li>
            <li><a href="<%=basePath%>project/projectList.do">项目列表</a></li>
            <li><a href="<%=basePath%>frontHome/toAppDownload.do">APP下载</a></li>
            <li><a href="<%=basePath%>frontHome/helpCenter.do">帮助中心</a></li>
            <!-- 登录前 -->
            <c:if test="${currUser.userName==null}">
                <li><a href="<%=basePath%>home/login.do" class="btn-public btn-w80 btn-blue">发起项目</a></li>
                <li><a href="<%=basePath%>home/login.do" class="btn-public btn-w50 btn-w50-hollow">登录</a></li>
            </c:if>
            <!-- 登录前 end-->
            <!--已登录-->
            <c:if test="${currUser.userName!=null}">
                <li><a href="#" onclick="$('#projecttype_form').submit();" class="btn-public btn-w80 btn-blue">发起项目</a>
                </li>
                <%--<li><a href="javascript:;" onclick="javascript:headTop.toInitProject();" class="btn-public btn-w80 btn-blue">发起项目</a></li>--%>
                <li>
                    <div class="u-login">
                        <span><img src="${currUser.imageUrl}" alt=""><i class="triangle"></i></span>
                        <ul>
                            <li><a href="<%=basePath %>user/userCenter.do?to=wdzc" class="colorfff"
                                   title="${currUser.nickName}"
                                   style="width:100px; white-space: nowrap;overflow: hidden;text-overflow:ellipsis;">${currUser.nickName}</a>
                            </li>
                            <li><a href="<%=basePath %>user/userCenter.do?to=wdqb"><i class="i1"></i><em>我的账户</em></a>
                            </li>
                            <li><a href="<%=basePath %>user/userCenter.do?to=wfqd"><i class="i2"></i><em>我发起的</em></a>
                            </li>
                            <li><a href="<%=basePath %>user/userCenter.do?to=wzcd"><i class="i3"></i><em>我支持的</em></a>
                            </li>
                            <li><a href="<%=basePath %>user/userCenter.do?to=grzl"><i class="i4"></i><em>个人设置</em></a>
                            </li>
                            <li><a href="<%=basePath%>home/logout.do"><i class="i5"></i><em>安全退出</em></a></li>
                        </ul>
                    </div>
                </li>
            </c:if>
            <!-- 登录后 end-->
        </ul>
    </div>
</div>
<script type="text/javascript" src="<%=basePath %>easy/js/home/header.js"></script>

<script>
    var hrefs = window.location.href;
    $("#HEADER_MENUS").find("a").removeClass("cur");
    if (hrefs.indexOf("/home/") > 0) {
        $("#HEADER_MENUS").find("a:eq(0)").addClass("cur");
    } else if (hrefs.indexOf("/project/") > 0) {
        $("#HEADER_MENUS").find("a:eq(1)").addClass("cur");
    } else if (hrefs.indexOf("/frontHome/toAppDownload") > 0) {
        $("#HEADER_MENUS").find("a:eq(2)").addClass("cur");
    } else if (hrefs.indexOf("/frontHome/helpCenter") > 0) {
        $("#HEADER_MENUS").find("a:eq(3)").addClass("cur");
    }


</script>