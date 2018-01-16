<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project.css">--%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/listof.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/propublic.css">

<div class='center'>
    <div class='men-dedd'>
        <div class='top-ioo'>
            <span><a href="<%=basePath%>home/index.do">首页&nbsp;>&nbsp;</a></span><span>项目> </span><span class='corej'>项目列表</span>
        </div>
        <div class='top-kos'>
            <div class='fl'>
                <div class='fl okls-b'>
                    <span>项目状态</span>
                    <select class='setp'name=''>
                        <option value="">完成状态</option>
                        <option value="1">筹款中</option>
                        <option value="2">已结束</option>
                    </select>
                    <b></b>
                </div>
                <div class='fl okls-b'>
                    <span>病种</span>
                    <select class='setp'name=''>
                        <option value="">请选择</option>
                        <option value="1">先心病</option>
                        <%--<option value="2"></option>--%>
                    </select>
                    <b></b>
                </div>
                <div class='clear'></div>
            </div>
            <div class='fr input-lpj'><input type="text"placeholder="搜医院"><button></button></div>
            <div class='clear'></div>
        </div>



        <div class='fl-cen'>
            <div class=''>
                <%@include file="allPro_temple.jsp"%>
            </div>
            <%--<div class="paging" id="paging"></div>--%>
        </div>
        <div class='clear'></div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath %>easy/js/project/allProList.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#dao-t>p>span').each(function(){
            var withs=$(this).html();
            $(this).parents('p').css('width',withs)
            if(parseInt(withs)<10){
                $(this).css('left',0)
            }
        })
    })
</script>

