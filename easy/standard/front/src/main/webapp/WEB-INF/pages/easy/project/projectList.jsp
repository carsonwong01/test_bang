<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="projectListForm" method="post">
    <!-- 项目状态查询条件 -->
    <input type="hidden" name="projectType" id="projectType" value="${req.type }"/>
    <!-- 项目标签类型查询条件 -->
    <input type="hidden" name="tagType" id="tagType" value="${req.tagType }"/>
    <!-- 排序字段查询条件 -->
    <input type="hidden" name="sorting" id="sorting" value="${req.sorting }"/>
    <!-- 升降序查询条件 -->
    <input type="hidden" name="order" id="order" value="${req.order }"/>
    <!-- 跳转项目详情页的项目ID -->
    <input type="hidden" name="projectId" id="projectId"/>
    <div class="main-content clearfix">
        <div class="wrap">
            <div class="xm-screening-con clearfix">
                <div class="xm-leixing-con">
                    <dl>
                        <dt>项目类型：</dt>
                        <dd id="typeDD">
                            <%--<a href="javascript:void(0)" class="cur" onclick="projectList.typeQuery(this,'')">全部</a>--%>
                            <a href="javascript:void(0)" class="cur" onclick="projectList.typeQuery(this,'1')">个人求助</a>
                            <%--<a href="javascript:void(0)" onclick="projectList.typeQuery(this,'6')">产品急销</a>--%>
                            <%--<a href="javascript:void(0)" onclick="projectList.typeQuery(this,'7')">实现梦想</a>--%>
                        </dd>
                    </dl>

                    <dl>
                        <dt>项目标签：</dt>
                        <dd id="tagTypeDD">
                            <a href="javascript:void(0)" class="cur" onclick="projectList.tagTypeQuery(this,'')">全部</a>
                            <c:forEach var="item" items="${allTProjectLabelType}">
                                <a href="javascript:void(0)"
                                   onclick="projectList.tagTypeQuery(this,',${item.labelName},')">${item.labelName}</a>
                            </c:forEach>
                        </dd>
                    </dl>
                    <dl>
                        <dt>列表排序：</dt>
                        <dd id="sortDD">
                            <a href="" class="cur" onclick="projectList.sortQuery(this,'')">默认</a>
                            <a href="javascript:void(0)" onclick="projectList.sortQuery(this,'p.date_create')">最新上线<i
                                    class="down"></i></a>
                            <a href="javascript:void(0)" onclick="projectList.sortQuery(this,'raiseTotal')">筹资金额<i
                                    class="down"></i></a>
                            <a href="javascript:void(0)" onclick="projectList.sortQuery(this,'supportCount')">支持人数<i
                                    class="down"></i></a>

                        </dd>
                    </dl>
                </div>
            </div>
            <div class="wrap clearfix">
                <div class="xm-project-con clearfix">
                    <ul id="projectListD">

                    </ul>
                </div>
                <!--分页-->
                <div class="paging" id="paging"></div>
                <!--分页  --END-->
            </div>
        </div>
</form>

<script type="text/javascript" src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/projectList.js"></script>

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