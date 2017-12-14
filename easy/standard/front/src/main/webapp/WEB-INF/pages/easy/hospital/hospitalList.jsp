<!--所有医院列表-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<head>
    <meta charset="utf-8">
    <title>医院</title>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/hospital.css">
</head>
<body>
<div class='center'>
    <div class='bender'>
        <div></div>
    </div>
    <!-- 本周推荐 -->
    <div class='men-ded'>
        <div class='top-io'>
            <ul class='top-io'>
            <input type="text" id="ldr" name="hospitalName" value="" placeholder="搜医院"/>
            <%--<li><div class="item-box"><a class="btn btn-blue radius-6 mr5 pl1 pr15" onclick="hospitalList.loadRecord();"><i class="icon-i w30 h30 va-middle search-icon "></i>搜索</a></div></li>--%>
            <button onclick="hospitalList.loadRecord();"></button>
            </ul>
        </div>
        <div class='fl fl-cen'>
            <ul id="hospitalListD">

            </ul>
            <div class="paging" id="paging"></div>
        </div>
        <div class='fr fr-nav'>
            <div class='top-txt'>
                <p>如需求助请搜索合作医院取得联系方式</p>
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
                <p><i></i><span>常见问题</span></p>
                <%@include file="/WEB-INF/pages/easy/helpCenter/commonQuestion.jsp"%>
            </div>
        </div>
        <div class='clear'></div>
    </div>
</div>


<!-- 弹出框 -->
<div class='modil'>
    <div class='banr'>
        <div class='cantion'>
            <p class='top-ht'><b></b><span id="spl0"></span></p>
            <div class='txt-diz'>
                <p>请联系本医院办公室获取求助</p>
                <p><span>医院联系电话：</span><span id="spl1"></span></p>
                <p><span>医院联系邮箱：</span><span id="spl2"></span></p>
                <p><span>医院联系地址：</span><span id="spl3"></span></p>
            </div>
            <div class='but'><a href="javascript:void(0);">确定</a></div>
        </div>
    </div>
</div>

<script id="hospitalListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
<li>
    <img src="{{= data.logoUrl}}" class='fl' onclick="location.href='<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}'"/>
    <div class='fr zkd'>
        <div class='h-hi'><a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}">{{= data.hospitalName}}</a><span>{{= data.hospitalGrade}}</span><span>{{= data.hospitalType}}</span></div>
        <div class='msjj'>
            <p>{{= data.hospitalAbstract}}
            </p>
            <a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}" class='fr'>详情</a>
            <div class='clear'></div>
        </div>
        <p>已筹金额：<span>{{= data.allRaisedAmount}}</span>元</p>
        <p>目标金额：<span>{{= allTargetAmount}}</span>元</p>
        <p>捐款人次：<span>{{= data.allSupprotTimes}}</span>次</p>
        <div class='wyjkjz'><a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}">我要捐款</a>
        <a data="{{= data.hospitalId}}" href="javascript:void(0);" class='abut' onclick="js_method(this)">我要求助</a></div>
        <%--<input type="button" name="button" value="我要求助" onclick="javasript:window.open('<%=basePath %>hospital/hospitalLink.do?hospitalId={{= data.hospitalId}}')">--%>
    </div>
    <div class='clear'></div>
</li>
{{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/hospital/allHospitalList.js"></script>

<script type="text/javascript"
        src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/vue.js"></script>

<script type="text/javascript">
    $('.top-ht>b,.but>a').click(function(){
        $('.modil').css('display','none')
    })
    function js_method(a){
        var hospitalId=$(a).attr("data");
        console.log(hospitalId)
        DM.ajax({
        type: 'post',
        url: "<%=basePath %>hospital/hospitalLink.do",
        data: {hospitalId: hospitalId},
        success: function (data) {
        $('.modil').css('display','block');
        $('#spl0').text(data.hospitalLink.singleResult.hospitalName);
        $('#spl1').text(data.hospitalLink.singleResult.officeTel);
         $('#spl2').text(data.hospitalLink.singleResult.hospitalMail);
         $('#spl3').text(data.hospitalLink.singleResult.province).append(data.hospitalLink.singleResult.city)
                .append(data.hospitalLink.singleResult.county).append(data.hospitalLink.singleResult.addr);
        }
        });
    }
</script>

</body>
