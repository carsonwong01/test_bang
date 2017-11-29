<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class='header'>
        <a href="<%=basePath%>home/index.do" class='fl logo'><img src="<%=basePath%>easy/images/logo2.png"></a>
        <ul class='fl head-n' id="HEADER_MENUS">
            <li><a href="<%=basePath%>home/index.do">首页</a></li>
            <li><a href="<%=basePath%>project/projectList.do">项目</a></li>
            <li><a href="<%=basePath%>hospital/hospitalList.do">医院</a></li>
            <li><a href="<%=basePath%>home/aboutUs.do">关于我们</a></li>
            <li><a href="<%=basePath%>frontHome/newsInfos.do">新闻资讯</a></li>
            <c:if test="${currUser.userName!=null}">
                <c:if test="${currUser.userType == 1}">
                    <li><a href="javascript:;" onclick="javascript:headTop.toInitProject();" class="btn-blue">发起项目</a></li>
                </c:if>
            </c:if>

            <div class='clear'></div>
        </ul>
        <div class='fr loin'>
            <!-- 登录前 -->
            <c:if test="${currUser.userName==null}">
                <a href="<%=basePath%>home/login.do" class="ina">我要注册</a>
                <a href="<%=basePath%>home/login.do" class="inb">登录</a>
            </c:if>
            <!-- 登录前 end-->
            <!--已登录-->
            <c:if test="${currUser.userName!=null}">
                <c:if test="${currUser.userType == 1}">
                    <%--<li><a href="javascript:;" onclick="javascript:headTop.toInitProject();" class="btn-public btn-w80 btn-blue">发起项目</a></li>--%>
                </c:if>
                <!--<li><a href="#" onclick="$('#projecttype_form').submit();" class="btn-public btn-w80 btn-blue">发起项目</a></li>-->
                <a href="<%=basePath %>user/userCenter.do?to=wdzc" class='inc'>个人中心</a>
                <%--<a href="<%=basePath%>home/logout.do" class='inc'>安全退出</a>--%>
            </c:if>

            <!-- 登录后 end-->
        </div>
    </div>
</header>

<script type="text/javascript" src="<%=basePath %>easy/js/home/header.js"></script>

<script>
    var hrefs = window.location.href;
    $("#HEADER_MENUS").find("a").removeClass("cur");
    if (hrefs.indexOf("/home/") > 0) {
        $("#HEADER_MENUS").find("a:eq(0)").addClass("cur");
    } else if (hrefs.indexOf("/project/") > 0) {
        $("#HEADER_MENUS").find("a:eq(1)").addClass("cur");
    } else if (hrefs.indexOf("/hospital/hospitalList") > 0) {
        $("#HEADER_MENUS").find("a:eq(2)").addClass("cur");
    } else if (hrefs.indexOf("/frontHome/helpCenter") > 0) {
        $("#HEADER_MENUS").find("a:eq(4)").addClass("cur");
    } else if (hrefs.indexOf("/frontHome/newsInfos") > 0) {
        $("#HEADER_MENUS").find("a:eq(3)").addClass("cur");
    }
</script>