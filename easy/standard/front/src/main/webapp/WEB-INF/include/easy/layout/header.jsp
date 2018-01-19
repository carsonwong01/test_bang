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
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<!--头部-->
<%--<form id="projecttype_form" action="<%=basePath%>user/project/projectStart.do">--%>
    <%--<input type="hidden" id="projectType" name="projectType" value="${1}"/>--%>
<%--</form>--%>
<header>
    <div class='header'>
        <a href="<%=basePath%>home/index.do" class='fl logo'><img src="<%=basePath%>easy/images/logo2.png"></a>
        <ul class='fl head-n' id="HEADER_MENUS">
            <li class=""><a href="<%=basePath%>home/index.do">首页</a></li>
            <li><a href="<%=basePath%>project/projectList.do">项目</a></li>
            <li><a href="<%=basePath%>hospital/hospitalList.do">医院</a></li>
            <li><a href="<%=basePath%>foundation/foundationDetails.do?foundationId=100">基金会</a></li>
            <li><a href="<%=basePath%>home/aboutUs.do">关于我们</a></li>
            <li><a href="<%=basePath%>frontHome/newsInfos.do">新闻资讯</a></li>
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
                <%--<c:if test="${currUser.userType == 1}">--%>
                    <a href="<%=basePath%>/user/project/projectStart.do?projectType=1" class="inc">发起项目</a>
                    <%--<a href="#" onclick="$('#projecttype_form').submit();" class="inc">发起项目</a>--%>
                <%--</c:if>--%>
                <%--<li><a href="#" onclick="$('#projecttype_form').submit();" class="btn-public btn-w80 btn-blue">发起项目</a></li>--%>
                <a href="<%=basePath %>user/userCenter.do?to=wdzc" class='inc'>个人中心</a>
                <a href="<%=basePath%>home/logout.do" class='ind'>安全退出</a>
            </c:if>

            <!-- 登录后 end-->
        </div>
    </div>
</header>
<script type="text/javascript" src="<%=basePath %>easy/js/home/header.js"></script>
<script>
    var hrefs = window.location.href;
    $("#HEADER_MENUS").find("li").removeClass("actiog");
    if (hrefs.indexOf("/home/index") > 0) {
        $("#HEADER_MENUS").find("li:eq(0)").addClass("actiog");
    } else if (hrefs.indexOf("/project/") > 0) {
        $("#HEADER_MENUS").find("li:eq(1)").addClass("actiog");
    } else if (hrefs.indexOf("/hospital/") > 0) {
        $("#HEADER_MENUS").find("li:eq(2)").addClass("actiog");
    } else if (hrefs.indexOf("/home/aboutUs") > 0) {
        $("#HEADER_MENUS").find("li:eq(4)").addClass("actiog");
    } else if (hrefs.indexOf("/frontHome/") > 0) {
        $("#HEADER_MENUS").find("li:eq(5)").addClass("actiog");
    }else if (hrefs.indexOf("/foundation/") > 0) {
        $("#HEADER_MENUS").find("li:eq(3)").addClass("actiog");
    }
</script>