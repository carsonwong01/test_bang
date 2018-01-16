<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class='fl fl-cen'>
    <div class='im-ttxx' id="allProListD" >

    </div>
    <%--<div class='clear'></div>--%>
</div>
<div class='clear'></div>
<div class="paging" id="paging"></div>

<script id="allProListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    <li>
    <img src="{{= data.projectImg}}"
         onclick="location.href='<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}'">
    <div class='detailed'>
        <p class='ti-m' style="width:330px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
            <a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">{{= data.projectName}}</a></p>
        <p class='yi-b' style="width:330px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
            <b></b><span>{{= data.hospitalName}}</span><i></i> <span>{{= data.foundationName}}</span>
        </p>
        <div class='dao-t' id='dao-t'>
            <p><span id="progress">{{= data.rate*100}}%</span></p>
        </div>
        <ul class='ul-num'>
            <li>目标金额（元）</br> <span>{{= data.targetAmount}}</span></li>
            <li>已筹金额（元）</br> <span>{{= data.raiseTotal}}</span></li>
            <li>捐助人次（次）</br> <span>{{= data.supportCount}}</span></li>
            <div class='clear'></div>
        </ul>
        <p class='but-a'><a
                href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">我要捐款</a>
        </p>
    </div>
    </li>
    {{/each}}
</script>
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
