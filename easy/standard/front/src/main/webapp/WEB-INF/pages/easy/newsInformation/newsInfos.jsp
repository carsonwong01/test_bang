<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/news.css">

<!-- 头部菜单栏  菜单索引   begin -->
<input type="hidden" id="head_menus_index" value="H_XWZX" />
<!-- 头部菜单栏  菜单索引   end -->
<div class='bender'>
	<div></div>
</div>
<!--主体内容-->
<div class="help-centerPage newsInfoPage helpAndNewsPage">
	<input id="infoType" type="hidden" value="${infoType}">
	<form id="dataForm">
		<input type="hidden" name="investmentInfoType"
			   id="manuInvestmentInfoType" value="2" />
	</form>
</div>
<div class='center'>
	<div class='cent-nav'>
		<!-- 每日新闻 -->
		<div class='fl clik'>
			<ul>
				<li><a href="javaScript:void(0);"
					   onclick="newControler.getNewsInfosList('2');" class="active"><b
						class="btn-blue"></b><span class="spbox"><i class="i1"></i>每日新闻</span></a></li>
				<li><a href="javaScript:void(0);"
					   onclick="newControler.getNewsInfosList('1');"><b class="btn-blue"></b><span
						class="spbox"><i class="i2"></i>企业SKR</span></a></li>
			</ul>
			<div class='centsd'>
				<div id='donations' class="donations">
					<ul  class="f-news_list clearfix" id="newsInfosId">

					</ul>
					<!--分页-->
					<div class="paging" id="pagingNews"></div>
					<!--分页  --END-->
				</div>
				<div id='progress'>企业SKR</div>
			</div>
		</div>
		<div class='fr ft-na'>
			<div class='xim-qi'>
				<p><i class='i-po'></i> <span>推荐救助</span></p>
				<li><i></i><span><ul class='ul-o'  id="projectListD">

				</ul></span></li>
			</div>

			<div class='xim-qi'>
				<p><i></i> <span>推荐资讯</span></p>
				<ul class='ul-o'>

					<li><i></i><a href=""><span>{{= data.infoTitle}}</span></a></li>
					<li><i></i><a href=""><span>我是盐城滨海人沈孝国，患上多发性骨髓瘤，请大家帮帮</span></a></li>
					<li><i></i><a href=""><span>谢谢朋友们的帮助</span></a></li>
					<li><i></i><a href=""><span>我是盐城滨海人沈孝国，患上多发性骨髓瘤，请大家帮帮</span></a></li>
					<li><i></i><a href=""><span>得了胃癌的我想活下去，想给父母尽孝，想穿婚纱。</span></a></li>
				</ul>
			</div>
			<div class='xim-qi'>
				<p><i></i> <a href="<%=basePath %>frontHome/helpCenter.do"><span>常见问题</span></a></p>
				<%@include file="/WEB-INF/pages/easy/helpCenter/commonQuestion.jsp"%>
			</div>
		</div>
		<div class='clear'></div>
	</div>
</div>
<script id="projectListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    	<li><i></i><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}"><span>{{= data.projectName}}</span></a></li>
    {{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/projectList.js"></script>
<script type="text/javascript"
		src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<!-- end -->
<script language="javascript"
		src="<%=basePath%>easy/js/newsInformation/newsInformation.js"></script>
<script id="newsInfosTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		 <li><span class="fr gray9">{{= data.dateCreate}}</span><a href="<%=basePath%>frontHome/newsInfosDetails.do?id={{= data.id}}"><i class="ico"></i>{{= data.infoTitle}}</a></li>
	{{/each}}
</script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript">
    $(function(){


        $(".clik>ul>li").click(function(){
            if(!$(this).hasClass('actionk')){
                $(this).addClass('actionk').siblings('li').removeClass('actionk');
                $($(this).attr('data')).css('display','block').siblings('div').css('display','none')
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



