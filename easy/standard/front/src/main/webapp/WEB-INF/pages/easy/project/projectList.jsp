<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project.css">

<div class='center'>
    <div class='bender'>
        <div></div>
    </div>
    <!-- 本周推荐 -->
    <div class='men-ded'>
        <div class='top-io'>
            <i></i><span>本周推荐</span>
        </div>
        <div class='fl fl-cen'>
            <ul class='im-tx2'  id="projectListD">

            </ul>
            <div class='clear'></div>
            <div class='top-io asy'>
                <i></i><span>疾病救助</span><a href="<%=basePath%>project/allProList.do" class='fr'><p style="font-size: 14px;">更多&gt;&gt;</p></a>
                <%--<a href="" class='fr'></a>--%>
                <div class='clear'></div>
            </div>

            <div class='im-ttx'>
                <%@include file="pendingProjectList.jsp"%>
            </div>
            <%--<div class="paging" id="paging"></div>--%>
        </div>
        <div class='fr fr-nav'>
            <div class='top-txt'>
                <p><b></b><a href="<%=basePath%>hospital/hospitalList.do">我要求助</a></p>
            </div>
            <div class='loing'>
                <p>&nbsp;&nbsp;“帮你筹”是全国性的公益众筹平台。平台致力于重大疾病防治网络建设，以提高高贫困患儿及时接受治疗机率，缓解家庭困境，促进贫困地区儿童健康成长 ，切断贫困代际传递。平台由中国社会工作联合会、《公益时报》社和中海软银财富管理有限公司联合发起发起，与...<a href="<%=basePath %>home/aboutUs.do" class='fr'>详细</a></p>
                <!-- 登录前 -->
                <c:if test="${currUser.userName==null}">
                    <div><a href="<%=basePath %>home/login.do">用户登录</a></div>
                </c:if>
                <!-- 登录前 end-->
                <!--已登录-->
                <c:if test="${currUser.userName!=null}">
                    <div><a href="<%=basePath %>user/userCenter.do?to=wdzc">个人中心</a></div>
                </c:if>
                <!-- 登录后 end-->
            </div>
            <div class='problem'>
                <p><i></i><span>审核拨付流程</span></p>
                <ul>
                    <li>1.<span>初审</span>医院对项目材料进行初审</li>
                    <li>2.<span>验证</span>“帮你筹”公益项目办公室实地探访</li>
                    <li>3.<span>审批</span>“帮你筹”公益项目办公室综合评审项目</li>
                    <li>4.<span>款项拨付</span>善款拨付实施救助</li>
                </ul>
            </div>
            <div class='problem'>
                <p><i></i> <span>常见问题</span></p>
                <%@include file="/WEB-INF/pages/easy/helpCenter/commonQuestion.jsp"%>
            </div>
        </div>
        <div class='clear'></div>
    </div>
</div>
<script id="projectListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    <li>
            <img src="{{= data.projectImg}}" onclick="location.href='<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}'"/>
            <div class='detailed'>
                <p class='ti-m'>
                    <a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">
                        慈善募捐&nbsp;|&nbsp;{{= data.projectName}}&nbsp;|&nbsp;帮你筹</a></p>
                <%--<p class='ti-ou' style="width: 320px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis">--%>
                     <%--<a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">{{= data.projectName}}</a></p>--%>
                <p class='yi-b' style="width: 320px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
                    <b  class='bba'></b><span>{{= data.hospitalName}}</span><u></u> <span>{{= data.foundationName}}</span></p>
                 <div class='dao-t' id='dao-t'>
                     <p><span id="progress">{{= data.rate*100}}%</span></p>
                 </div>
                <ul class='ul-num'>
                   <li>目标金额（元）</br> <span>{{= data.targetAmount}}</span></li>
                   <li>已筹金额（元）</br> <span>{{= data.raiseTotal}}</span></li>
                   <li>捐助人次（次）</br> <span>{{= data.supportCount}}</span></li>
                   <div class='clear'></div>
                </ul>
                <p class='but-ab'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">我要捐款</a></p>
            </div>
        </li>
    {{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/pendingProjectList.js"></script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/projectList.js"></script>

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

