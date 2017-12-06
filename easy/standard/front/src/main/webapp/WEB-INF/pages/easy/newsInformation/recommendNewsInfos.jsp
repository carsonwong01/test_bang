<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="css<%=basePath %>easy/css/newsinformation.css">
<!-- 推荐资讯 -->
<div class='xim-qi'>
    <p><i></i> <span>推荐资讯</span></p>
    <ul class='ul-o' id="recomNewsD">

    </ul>
</div>

<script id="recomNewsTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
<li><i></i><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= data.newsId}}"><span>{{= data.newsTitle}}</span></a></li>
{{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/newsInformation/recommendNews.js"></script>
<script type="text/javascript"
        src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="js/public/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/public/vue.js"></script>





