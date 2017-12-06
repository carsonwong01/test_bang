<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/hospitaldetails.css">
<ul class='im-ttx' id="hospitalProjectD">
</ul>
<div class='clear'></div>
<div class="paging" id="paging"></div>
<script id="hospitalProjectTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
        <li>
            <img src="{{= data.projectImg}}">
            <div class='detailed'>
                <p class='ti-ou'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">{{= data.projectName}}</a></p>
                <p class='yi-b'><b  class='bba'></b><span>{{= data.hospitalName}}</span><u></u> <span>{{= data.foundationName}}</span></p>
                <div class='dao-t' id='dao-t'>
                    <p class='dao-p'><span>{{= data.rate*100}}%</span></p>
                </div>
                <ul class='ul-nus'>
                    <li>目标金额（元）</br> <span>{{= data.targetAmount}}</span></li>
                    <li>目标金额（元）</br> <span>{{= data.raisedAmount}}</span></li>
                    <li>捐助人次（次）</br> <span>{{= data.supportTimes}}</span></li>
                    <div class='clear'></div>
                </ul>
                <p class='but-ab'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">我要捐款</a></p>
            </div>
        </li>
{{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/hospital/hospitalProjectList.js"></script>
