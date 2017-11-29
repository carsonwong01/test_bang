<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project.css">

<div class='center'>
    <!-- 本周推荐 -->
    <div class='men-ded'>
        <div class='fl fl-cen'>
            <div class='top-io asy'>
                <i></i><span>疾病救助</span>
                <%--<a href="" class='fr'></a>--%>
                <div class='clear'></div>
            </div>

            <div class='im-ttx'>
                <ul class='im-tx1'  id="ulul">

                </ul>

                <li>
                    <img src="<%=basePath %>easy/images/dfjjpw9076h.png">
                    <div class='detailed'>
                        <p class='ti-ou'><a href="<%=basePath %>project/projectDetails.do?projectId=1017110313164258415">社会组织的政治功能进一步加强</a></p>
                        <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                        <div class='dao-t'id='dao-t'>
                            <p class='dao-p'><span>50%</span></p>
                        </div>
                        <ul class='ul-nus'>
                            <li>目标金额（元）</br> <span>10000</span></li>
                            <li>目标金额（元）</br> <span>5000</span></li>
                            <li>捐助人次（次）</br> <span>0</span></li>
                            <div class='clear'></div>
                        </ul>
                        <p class='but-ab'><a href="<%=basePath %>project/projectDetails.do?projectId=1017110313164258415">我要捐款</a></p>
                    </div>
                </li>

                <div class='clear'></div>


                <div class="paging" id="paging??"></div>


            </div>
        </div>
        <div class='clear'></div>
    </div>
</div>
<script id="projectListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    <li>
            <img src="{{= data.projectImg}}">
            <div class='detailed'>
                <p class='ti-ou'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">{{= data.projectName}}</a></p>
                <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
                 <div class='dao-t' id='dao-t'>
                     <p><span id="progress">{{= data.rate*100}}%</span></p>
                 </div>
                <ul class='ul-nus'>
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





<script id="allProjectListTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}
    <li>
        <img src="{{= data.projectImg}}">
        <div class='detailed'>
            <p class='ti-ou'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">{{= data.projectName}}</a></p>
            <p class='yi-b'><b  class='bba'></b><span>北京第三医院</span><u></u> <span>中国华侨基金会</span></p>
            <div class='dao-t'id='dao-t'>
                <p class='dao-p'><span>{{= data.rate*100}}%</span></p>
            </div>
            <ul class='ul-nus'>
                <li>目标金额（元）</br> <span>{{= data.targetAmount}}</span></li>
                <li>目标金额（元）</br> <span>{{= data.raiseTotal}}</span></li>
                <li>捐助人次（次）</br> <span>{{= data.supportCount}}</span></li>
                <div class='clear'></div>
            </ul>
            <p class='but-ab'><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}">我要捐款</a></p>
        </div>
    </li>
{{/each}}
</script>

<script type="text/javascript" src="<%=basePath %>easy/js/project/allPendingProjectList.js"></script>
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
<%--
<script id="projectListTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
           <li class="xm-percent-box"><div class="item-project-bor item-project-padd1">
                            {{if data.projectType == 6}}<div class="xm-biaodi-icon xm-biaodi-icon02"></div> {{/if}}
                            {{if data.projectType == 7}}<div class="xm-biaodi-icon xm-biaodi-icon01"></div> {{/if}}
							<div class="item-img-tu" onclick="projectList.goProjectDetails('{{= data.projectId}}');"><img src="{{= data.projectImg}}"></div>
							<div class="item-title-t pt20 pb20"><div class="item-title-x">{{= data.projectName}}</div>
							<p class="item-title-text pt5" title="{{= data.projectIntro}}">{{= data.projectIntro}}</p></div>
							<div class="item-sj-con">
								<div class="biaoqian-lab"><span class="icon-public bq-icon"></span>{{html data.tags}}</div>
								<div class="item-sj-data pt10 clearfix">
									<ul>
										<li class="item-percent-l"><div class="item-shuju-bor item-shuju-list01">
											<p class="f18 gray3"><span format=0>{{= data.rate*100}} </span>%</p>
											<p class="gray8">筹资进度</p>
										</div></li>
										<li class="item-percent-c"><div class="item-shuju-bor item-shuju-list02">
											<p class="f18 gray3">￥{{= data.raiseTotal}}</p>
											<p class="gray8">已筹金额</p>
										</div></li>
										<li class="item-percent-l"><div class="item-shuju-bor item-shuju-list03 item-shuju-nobor">
											<p class="f18 gray3">{{= data.supportCount}}次</p>
											<p class="gray8">支持人次</p>
										</div></li>
									</ul>
								</div>
							</div>
						</div></li>
{{/each}}
</script>
--%>
