<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/hospitadetails.css">
<div class='center'>
    <div class='benderD'>
        <p	class='nav-po'><a href="<%=basePath %>home/index.do">首页&nbsp;>&nbsp;</a>
            <a href="<%=basePath %>hospital/hospitalList.do">医院&nbsp;>&nbsp;</a><span>医院详情</span></p>
        <div class='top-ns'>
            <div class='fl img-b'><b></b><img src="images/266ubjkjk.png"></div>
            <div class='fr frt-xq'>
                <p class='pop-s'>${hospitalDetails.hospitalName} <span>三甲</span><span>综合</span></p>
                <div class='daohxi'>
                    <div class='jqrt'>
                        <p>
                            <span>80%</span>
                        </p>
                    </div>
                    <ul class='num-k'>
                        <li>
                            <p>目标金额（元）</p>
                            <span>10000</span>
                        </li>
                        <li>
                            <p>已筹金额（元）</p>
                            <span>8000</span>
                        </li>
                        <li>
                            <p>捐助次数（次）</p>
                            <span>20</span>
                        </li>
                        <div class='clear'></div>
                    </ul>
                </div>
                <div class='img-wm'>
                    <a href="">我要捐款</a>
                </div>
            </div>
            <div class='clear'></div>
        </div>
    </div>
    <!-- 本周推荐 -->
    <div class='men-ded'>

        <div class='fl fl-cen'>
            <ul>
                <li data="#donations" class='actionk'>推荐项目</li>
                <li data="#progress">医院详情</li>
                <li data="#record">项目汇总</li>
                <div class='clear'></div>
            </ul>
            <div class='centsd'>
                <div id='donations'>
                    <ul class='im-ttx'>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>50%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>

                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>0%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>5%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>50%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>

                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>0%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>5%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>50%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>

                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>0%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <li>
                            <img src="images/dfjjpw9076h.png">
                            <div class='detailed'>
                                <p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>
                                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                                <div class='dao-t'id='dao-t'>
                                    <p class='dao-p'><span>5%</span></p>
                                </div>
                                <ul class='ul-nus'>
                                    <li>目标金额（元）</br> <span>30,000,000</span></li>
                                    <li>目标金额（元）</br> <span>4569,636</span></li>
                                    <li>捐助人次（次）</br> <span>564646</span></li>
                                    <div class='clear'></div>
                                </ul>
                                <p class='but-ab'><a href="">我要捐款</a></p>
                            </div>
                        </li>
                        <div class='clear'></div>
                    </ul>
                </div>
                <div id='progress' class='progress'>
                    <h1>基本信息</h1>
                    <ul>
                        <li>中文名称：${hospitalDetails.hospitalName}</li>
                        <li>医院类型：${hospitalDetails.hospitalType}</li>
                        <li>成立时间：1958年</li>
                        <li>医院级别：三级甲等</li>
                        <div class='clear'></div>
                    </ul>
                    <h1>详细介绍</h1>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                    <p>我叫蔡志豪刚满16周岁，家住江苏省苏州市昆山市花桥镇，家庭贫困，母亲常年患病要不时去打针缓解病情，失去工作能力。父亲是1级残疾，但身为一家之主不得不挑起重担，每月收入不到3000。本事生活就十分拮据我好不容易考上重点高中，这次患重病——ANCA相关性新月体性肾小球肾炎，治疗痊愈的可能性只有百分之二十，母亲父亲心急如焚，我也很难过，希望大家能帮助我，治疗的费用远远超过我们家庭的承受能力。</p>
                </div>
                <div id='record' class='record'>
                    <table>
                        <thead>
                        <tr>
                            <th>求助时间</th>
                            <th>受助人</th>
                            <th>求助标题</th>
                            <th>项目进度</th>
                            <th>
                                <div class='igb-d'>
                                    <select name="select" id="select_k1" class="xla_k">
                                        <option value="选择品牌">完成状态</option>
                                        <option value="选择品牌1">筹款中</option>
                                        <option value="选择品牌2">已完成</option>
                                    </select>
                                    <b></b>
                                </div>
                            </th>
                        </tr>
                        </thead>
                        <tbody id='list'>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span class='baibi'>72%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>筹款中</td>
                        </tr>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span class='baibi'>25%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>已完成</td>
                        </tr>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span class='baibi'>72%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>筹款中</td>
                        </tr>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span class='baibi'>13%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>已完成</td>
                        </tr>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span class='baibi'>12%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>筹款中</td>
                        </tr>
                        <tr>
                            <td>2017-10-24</td>
                            <td>吴亦凡</td>
                            <td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>
                            <td>
                                <div class='dao-he'>
                                    <p><span>656565</span>元（<span id='baibi'>100%</span>）／ <span>546596</span>	元</p>
                                    <span><i></i></span>
                                </div>
                            </td>
                            <td class='tdse'>已完成</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class='fr fr-nav'>
            <div class='loing'>
                <p>&nbsp;&nbsp;“帮你筹”是全国性的公益众筹平台。平台致力于重大疾病防治网络建设，以提高高贫困患儿及时接受治疗机率，缓解家庭困境，促进贫困地区儿童健康成长 ，切断贫困代际传递。平台由中国社会工作联合会、《公益时报》社和中海软银财富管理有限公司联合发起发起，与...<a href="<%=basePath %>/home/index.do" class='fr'>详细</a></p>
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
                <p><i></i><span>如需求助请联系</span></p>
                <ul class='loko'>
                    <li>医院联系电话：010-5268927</li>
                    <li>医院联系邮箱：hankj@163.com</li>
                    <li>医院联系地址：北京市海淀区文化大街123号</li>
                </ul>
            </div>
            <div class='problem'>
                <p><i></i><span>捐赠信息</span></p>
                <ul class='loko'>
                    <li>捐款总额：<span>154664666</span>	元</li>
                    <li>拨付总额：<span>6665646687</span>元</li>
                    <li>爱心人次：<span>56565</span>次</li>
                </ul>
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
                <p><i></i> <a href="<%=basePath %>frontHome/helpCenter.do"><span>常见问题</span></a></p>
                <%@include file="/WEB-INF/pages/easy/helpCenter/commonQuestion.jsp"%>
        </div>
        </div>
        <div class='clear'></div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    (function ($) {
        jQuery.expr[':'].Contains = function(a,i,m){
            return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
        };
        function filterList(list) {

            $('#select_k1').change( function () {
                var filter = $(this).find("option:selected").text();
                if(filter) {
                    $matches = $(list).find('.tdse:Contains(' + filter + ')').parent();
                    $('tr', list).not($matches).slideUp();
                    $matches.slideDown();
                    if(filter=="完成状态"){
                        $(list).find("tr").slideDown();
                    }
                } else {
                    $(list).find("tr").slideDown();
                }
                return false;
            })
                .keyup( function () {
                    $(this).change();
                });
        }
        $(function () {
            filterList( $("#list"));
        });
        var withs=$('.jqrt>p>span').html();
        $('.jqrt>p').css('width',withs)
        if(parseInt(withs)<10){
            $('.jqrt>p>span').css('left',-4)
        }

        $('#dao-t>p>span').each(function(){
            var withs=$(this).html();
            $(this).parents('p').css('width',withs)
            if(parseInt(withs)<10){
                $(this).css('left',0)
            }
        })
        $('.dao-he .baibi').each(function(){
            var withs=$(this).html();
            $(this).parents('p').siblings('span').children('i').css('width',withs)

        })
        $(".fl-cen>ul>li").click(function(){
            if(!$(this).hasClass('actionk')){
                $(this).addClass('actionk').siblings('li').removeClass('actionk');
                $($(this).attr('data')).css('display','block').siblings('div').css('display','none')
            }
        })
    }(jQuery));
</script>
<%--<jsp:include page="hospitalList.jsp"></jsp:include>--%>
<body>
        <%--<div class='fl fl-cen'>--%>
            <%--<ul id="hospitalListD">--%>

            <%--</ul>--%>
            <%--<div class="paging" id="paging"></div>--%>
        <%--</div>--%>

<script id="hospitalListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
<li>
    <img src="{{= data.hospitalImageUrl}}" class='fl'>
    <div class='fr zkd'>
        <div class='h-hi'>{{= data.hospitalName}}<span>{{= data.hospitalGrade}}</span><span>{{= data.hospitalType}}</span></div>
        <div class='msjj'>
            <p>{{= data.hospitalAbstract}}
            </p>
            <a href="<%=basePath %>hospital/hospitalDetails.do?hospitalId={{= data.hospitalId}}" class='fr'>详情</a>
            <div class='clear'></div>
        </div>
        <p>已筹金额：<span>0</span>元</p>
        <p>目标金额：<span>0</span>元</p>
        <p>捐款人次：<span>0</span>次</p>
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






