<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/hospitaldetails.css">
<%--<script>--%>
	<%--$(function () {--%>
		<%--$("input").click(function () {--%>
            <%--//获取点击ID--%>
			<%--var hospitalId = ${hospitalDetails.hospitalId}--%>
            <%--&lt;%&ndash;var id = $(this).attr("${hospitalDetails.hospitalId}");&ndash;%&gt;--%>
            <%--alert("当前点击id:"+ hospitalId);--%>
        <%--})--%>
    <%--})--%>
<%--</script>--%>
<div class='center'>
	<div class='benderD'>
		<p	class='nav-po'><a href="<%=basePath %>home/index.do">首页&nbsp;>&nbsp;</a>
			<a href="<%=basePath %>hospital/hospitalList.do">医院&nbsp;>&nbsp;</a><span>医院详情</span></p>
		<div class='top-ns'>
			<div class='fl img-b'><b></b><img src="${hospitalDetails.logoUrl}"></div>
			<div class='fr frt-xq'>
				<p class='pop-s'>${hospitalDetails.hospitalName} <span>${hospitalDetails.hospitalGrade}</span><span>${hospitalDetails.hospitalType}</span></p>
				<div class='daohxi'>
					<div class='jqrt'>
						<p>
							<span>${hospitalDetails.rate}%</span>
						</p>
					</div>
					<ul class='num-k'>
						<li>
							<p>目标金额（元）</p>
							<span>${hospitalDetails.allTargetAmount}</span>
						</li>
						<li>
							<p>已筹金额（元）</p>
							<span>${hospitalDetails.allRaisedAmount}</span>
						</li>
						<li>
							<p>捐助次数（次）</p>
							<span>${hospitalDetails.allSupprotTimes}</span>
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
	<div class='men-ded'>

		<div class='fl fl-cen'>
			<ul>
				<li data="#donations" class='actionk ldr' datr='${hospitalDetails.hospitalId}'>推荐项目</li>
				<li data="#progress">医院详情</li>
				<li data="#record">项目汇总</li>
				<div class='clear'></div>
			</ul>
			<div class='centsd'>
				<div id='donations'>
					<%--<ul class='im-ttx' id="ttxou">--%>

						<%--<li>--%>
							<%--<img src="images/dfjjpw9076h.png">--%>
							<%--<div class='detailed'>--%>
								<%--<p class='ti-ou'><a href="">919紧急救助金／求助标题</a></p>--%>
								<%--<p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>--%>
								<%--<div class='dao-t'id='dao-t'>--%>
									<%--<p class='dao-p'><span>5%</span></p>--%>
								<%--</div>--%>
								<%--<ul class='ul-nus'>--%>
									<%--<li>目标金额（元）</br> <span>30,000,000</span></li>--%>
									<%--<li>目标金额（元）</br> <span>4569,636</span></li>--%>
									<%--<li>捐助人次（次）</br> <span>564646</span></li>--%>
									<%--<div class='clear'></div>--%>
								<%--</ul>--%>
								<%--<p class='but-ab'><a href="">我要捐款</a></p>--%>
							<%--</div>--%>
						<%--</li>--%>
						<%--<div class='clear'></div>--%>
					<%--</ul>--%>
				</div>
				<div id='progress' class='progress'>
					<h1>基本信息</h1>
					<ul>
						<li>中文名称：${hospitalDetails.hospitalName}</li>
						<li>医院类型：${hospitalDetails.hospitalType}</li>
						<li>成立时间：${hospitalDetails.foundTime}</li>
						<li>医院级别：${hospitalDetails.hospitalGrade}</li>
						<div class='clear'></div>
					</ul>
					<h1>详细介绍</h1>
					<p>${hospitalDetails.description}</p>
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
						<%--<tbody id='list'>--%>
						<%--<tr>--%>
							<%--<td>2017-10-24</td>--%>
							<%--<td>吴亦凡</td>--%>
							<%--<td><p>请帮帮饱受病痛折磨的贫困折磨的贫困折磨的贫困</p></td>--%>
							<%--<td>--%>
								<%--<div class='dao-he'>--%>
									<%--<p><span>656565</span>元（<span class='baibi'>72%</span>）／ <span>546596</span>	元</p>--%>
									<%--<span><i></i></span>--%>
								<%--</div>--%>
							<%--</td>--%>
							<%--<td class='tdse'>筹款中</td>--%>
						<%--</tr>--%>
						<%--</tbody>--%>
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
					<li>医院联系电话：${hospitalDetails.officeTel}</li>
					<li>医院联系邮箱：${hospitalDetails.hospitalMail}</li>
					<li>医院联系地址：${hospitalDetails.city}</li>
				</ul>
			</div>
			<div class='problem'>
				<p><i></i><span>捐赠信息</span></p>
				<ul class='loko'>
					<li>捐款总额：<span>${hospitalDetails.allRaisedAmount}</span>元</li>
					<li>拨付总额：<span>${hospitalDetails.allRaisedAmount}</span>元</li>
					<li>爱心人次：<span>${hospitalDetails.allSupprotTimes}</span>次</li>
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
<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public/vue.js"></script>
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

	<%--var hospitalId=$('.ldr').attr('datr');--%>
    <%--alert(hospitalId);--%>
        <%--&lt;%&ndash;var _self=this;&ndash;%&gt;--%>
        <%--DM.ajax({--%>
            <%--type:'post',--%>
            <%--url:"<%=basePath %>hospital/hospitalProjectSumAjax.do",--%>
            <%--data:{hospiId:hospitalId},--%>
            <%--success:function(data){--%>

				<%--var data=data.pageResult;--%>
                <%--var strs=$('#ttxou').html('');--%>
                <%--var tod='';--%>
                <%--$.each(data,function(){--%>
                    <%--tod+="<li>"+--%>
                   <%--"<img src='images/dfjjpw9076h.png'>"+--%>
                       <%--"<div class='detailed'>"+--%>
                        <%--"<p class='ti-ou'><a href=''>919紧急救助金／求助标题</a></p>"+--%>
                    <%--"<p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>"+--%>
                   <%--"<div class='dao-t'id='dao-t'>"+--%>
                        <%--"<p class='dao-p'><span>5%</span></p>"+--%>
                    <%--"</div>"+--%>
                    <%--"<ul class='ul-nus'>"+--%>
                        <%--"<li>目标金额（元）</br> <span>30,000,000</span></li>"+--%>
                    <%--"<li>目标金额（元）</br> <span>4569,636</span></li>"+--%>
                    <%--"<li>捐助人次（次）</br> <span>564646</span></li>"+--%>
                    <%--"<div class='clear'></div>"+--%>
                    <%--" </ul>"+--%>
                    <%--" <p class='but-ab'><a href=''>我要捐款</a></p>"+--%>
                    <%--"</div>"+--%>
                    <%--" </li>";--%>
                    <%--$("#ttxou").append(tod);--%>
				<%--})--%>

            <%--}--%>
        <%--});--%>

    }(jQuery));
</script>



