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
            <input type="text" placeholder="搜医院">
            <button type="submit"></button>
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

<script id="hospitalListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
<li>
    <img src="{{= data.logoUrl}}" class='fl'>
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
        <div class='wyjkjz'><a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}">我要捐款</a><a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}">我要求助</a></div>
    </div>
    <div class='clear'></div>
</li>
{{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/hospital/allHospitalList.js"></script>

<script type="text/javascript"
        src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="js/public/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/public/vue.js"></script>
<script type="text/javascript">
    $(function(){
        /*var withs=$('#dao-t>p>span').html();
        $('#dao-t>p').css('width',withs);
        if(parseInt(withs)<10){
            $('#dao-t>p>span').css('left',0)
        }*/
        $('#dao-t>p>span').each(function(){
            var withs=$(this).html();
            $(this).parents('p').css('width',withs)
            if(parseInt(withs)<10){
                $(this).css('left',0)
            }
        })
    })
    /*分页*/
    var newlist = new Vue({
        el: '#app',
        data: {
            current_page: 1, //当前页
            pages: 50, //总页数
            changePage:'',//跳转页
            nowIndex:0
        },
        computed:{
            show:function(){
                return this.pages && this.pages !=1
            },
            pstart: function() {
                return this.current_page == 1;
            },
            pend: function() {
                return this.current_page == this.pages;
            },
            efont: function() {
                if (this.pages <= 7) return false;
                return this.current_page > 5
            },
            ebehind: function() {
                if (this.pages <= 7) return false;
                var nowAy = this.indexs;
                return nowAy[nowAy.length - 1] != this.pages;
            },
            indexs: function() {
                var left = 1,
                    right = this.pages,
                    ar = [];
                if (this.pages >= 7) {
                    if (this.current_page > 5 && this.current_page < this.pages - 4) {
                        left = Number(this.current_page) - 3;
                        right = Number(this.current_page) + 3;
                    } else {
                        if (this.current_page <= 5) {
                            left = 1;
                            right = 7;
                        } else {
                            right = this.pages;

                            left = this.pages - 6;
                        }
                    }
                }
                while (left <= right) {
                    ar.push(left);
                    left++;
                }
                return ar;
            },
        },
        methods: {
            jumpPage: function(id) {
                this.current_page = id;
            },
        },
    })
</script>
</body>
