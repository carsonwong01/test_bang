<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/project-details.css">
<script type="text/javascript">
    var currUserId = "${currUser.userId}";//当前登录人ID
</script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easy/css/public.css">

<div class='center p-detail-content'>
	<div class='cent-nav'>
		<p	class='nav-po'><a href="<%=basePath%>home/index.do">首页&nbsp;>&nbsp;</a><a href="<%=basePath %>project/projectList.do">项目&nbsp;>&nbsp;</a><span>项目详情</span></p>
		<%--<h2 class="p-til">${projectDetails.title}</h2>--%>
		<div class='top-ns'>
			<div class='fl img-b'><a class="collection <c:if test="${projectDetails.isFocus eq 1}">active</c:if>"
									 onclick="projectDetails.collect(this,'${projectDetails.id}');"></a>
				<img src="${projectDetails.coverImgUrl}">
			</div>
			<div class='fr frt-xq'>
				<a></a>
				<p class='pop-s'>已筹金额<span></br>${projectDetails.supportAmt}</span><span>&nbsp;元</span></p>
				<div class='daohxi'>
					<div><span class='fr'>捐款 <span>${projectDetails.supportTimes}</span>次</span><div class='clear'></div></div>
					<div class='jqrt'>
						<p>
							<span id="progress"></span>
						</p>
					</div>
					<div><span class='fl'>剩余时间
						<c:choose>
							<c:when test="${projectDetails.projectStatus eq 1 && projectDetails.remainingDay >0}">${projectDetails.remainingDay}天</c:when>
							<c:when test="${projectDetails.projectStatus eq 1 && projectDetails.remainingDay ==0}">即将结束</c:when>
							<c:otherwise>已结束</c:otherwise>
						</c:choose>
					</span><span class='fr'>目标金额 <span>${projectDetails.facTarget}</span>元</span><div class='clear'></div></div>
				</div>
				<div class='img-wm'><img src="${projectDetails.qrcodeImg}"></br><span>扫码捐赠，更方便</span></div>
			</div>
			<div class='clear'></div>
		</div>
		<!-- 捐款说明 -->
		<div class='fl clik'>
			<ul>
				<li data="#donations" class='actionk'>捐款说明</li>
				<li data="#dynamicCount" class="control" id="dynamicTab">项目进展（<span class="num">${projectDetails.dynamicCount}</span>）<i></i></li>
				<li data="#record" class="control" id="commentTab">捐款记录（<span class="num">${projectDetails.supportTimes}</span>）<i></i></li>
				<div class='clear'></div>
			</ul>
			<div class='centsd'>
				<div id='donations' class='donations'>
					<div>${projectDetails.content}
						<div class="mod-project-pic clearfix">
							<ul>
								<c:forEach var="imgs"   items="${projectDetails.imgs}">
									<li><div class="mod-project-padd"><img src="${imgs.addr}" alt="" width="197"  height="199"></div></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<span>
						<img src="${projectDetails.qrcodeImg}"></br>
						<span>扫码捐赠，更方便</span>
					</span>
				</div>
				<div id='dynamicCount' class='dynamicCount'>
					<form id="dynamicForm" method="post">
						<input name="projectId" type="hidden"
							   value="${ projectDetails.id}">
						<div class="list">
							<div class="dynamic" id="dynamicD"></div>
							<!--项目动态分页-->
							<div class="paging" id="dynamicPaging"></div>
							<!--项目动态分页  --END-->
						</div>
					</form>
				</div>
				<div id='record' class='record'>
					<div class='hidden'>
						<!-- 支持者 -->
						<div class="list messageBox">
							<form id="commentForm" method="post">
								<input name="projectId" type="hidden"
									   value="${projectDetails.id}">
								<div id="commentD"></div>
								<!--项目动态分页-->
								<div class="paging" id="commentPaging"></div>
								<!--项目动态分页  --END-->
							</form>
						</div>
						<!-- 支持者 end-->
					</div>
					<%--<ul class='list'>--%>
						<%--数据加载中，请稍后...--%>
					<%--</ul>--%>
					<%--<p class='jzgd-s'><a href="javascript:;"  onClick="moreload.loadMore();">加载更多>></a></p>--%>
				</div>
			</div>
		</div>
		<div class='fr ft-na'>
			<div class='na-v'>
				<b></b><a href="<%=basePath%>hospital/hospitalList.do">我要求助</a>
			</div>
			<div class='xim-qi'>
				<p><i></i> <span>项目发起人</span></p>
				<div class="xim-id">
					<img src="${projectDetails.initiatorImgUrl}" class='fl'>
					<p class='fl'>
						<a>${projectDetails.initiatorNickName}</a></br>
						<span>${projectDetails.dateCreate}发起</span>
					</p>
					<div class='clear'></div>
				</div>
			</div>
			<div class='xim-qi'>
				<p><i></i> <span>专项管理基金会</span></p>
				<div class='xim-id'>
					<img src="<%=basePath%>easy/images/cn19.png" class='fl'>
					<p class='fl'>
						<a href=''>${projectDetails.foundationName}</a></br>
						<span>捐助的所有款项由该基金会管理拨及付</span>
					</p>
					<div class='clear'></div>

				</div>
			</div>
			<div class="p-detail-content">
				<!-- 项目详情右侧信息 -->
				<div class="rightbox">
					<c:choose>
						<c:when test="${projectDetails.type eq 6}">
							<div class="p-box order-des">
								<h4 class="til">
									运费说明和发货时间<i class="btn-blue"></i><em class="bord"></em>
								</h4>
								<div class="box">
									<p>运费说明：<b>${projectDetails.freight}</b></p>
									<p>发货时间：<b>${projectDetails.postTimeText}</b></p>
								</div>
							</div>
							<div class="p-box p-profit">
								<h4 class="til">
									产品回报<i class="btn-blue"></i><em class="bord"></em>
								</h4>
								<div class="box">
									<c:forEach var="dreamTarget"   items="${projectDetails.dreamTargets}">
										<dl class="clearfix">
											<dt>
												<p class="fl">
													支持<span class="Blue highlight">${dreamTarget.amount}</span>元
												</p>
												<c:choose>
													<c:when test="${dreamTarget.remainingNum lt 0}">
														<p class="fr">
															支持<span class="Red">${dreamTarget.supportCount}</span>份
														</p>
													</c:when>
													<c:when test="${dreamTarget.remainingNum eq 0}">
														<p class="fr">已售罄</p>
													</c:when>
													<c:otherwise>
														<p class="fr">
															支持<span class="Red">${dreamTarget.supportCount}</span>份 /
															剩余<span class="red">${dreamTarget.remainingNum}</span>份
														</p>
													</c:otherwise>
												</c:choose>
											</dt>
											<dd>
												<img src="${dreamTarget.imgUrl}" alt="">
												<p>${dreamTarget.content}</p>
											</dd>
										</dl>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:when test="${projectDetails.type eq 7}">
							<div class="p-box">
								<h4 class="til">梦想清单<i class="btn-blue"></i><em class="bord"></em></h4>
								<div class="">
									<div class="dreamList clearfix">
										<ul>
											<c:forEach var="dreamTarget"   items="${projectDetails.dreamTargets}">
												<li>
													<h6><span class="highlight">${dreamTarget.amount}</span>元</h6>
													<p>${dreamTarget.content}</p>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="p-box authentication">
								<h4 class="til">认证资料<i class="btn-blue"></i><br><em class="bord"></em></h4>
								<div class="">
									<ul>
										<c:choose>
											<c:when test="${projectDetails.validationType == null}">
												<li>
													<span class="fl red">项目暂未认证</span>
												</li>
											</c:when>
											<c:when test="${projectDetails.type ==1 && projectDetails.validationType == 1 }">
												<li>
													<span class="fl">收款人身份信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">医院医疗证明</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
											</c:when>
											<c:when test="${projectDetails.type ==1 && (projectDetails.validationType == 2 || projectDetails.validationType == 3)}">
												<li>
													<span class="fl">受助人（患者）身份信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">医院医疗证明</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">收款人身份信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">与受助人关系证明</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
											</c:when>
											<c:when test="${projectDetails.type == 1 && projectDetails.validationType == 4 }">
												<li>
													<span class="fl">组织机构信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">与受助人关系证明</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
												<li>
													<span class="fl">医院医疗证明</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
											</c:when>
											<c:when test="${(projectDetails.type == 2 || projectDetails.type == 3 ||projectDetails.type == 4
							                   || projectDetails.type == 5) && projectDetails.validationType == 1 }">
												<li>
													<span class="fl">本人信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<span class="fl">组织机构信息</span>
													<p class="fr">${projectDetails.validationStatus == 3 ? "<i class='status-yes'></i><span>已认证</span>" : "<i class='status-no'></i><span>未认证</span>" }</p>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
									<div class="des">
										<p>项目发起人已承诺，涉及本项目的文字、图片、证明等相关信息完全真实、有效，且不存在未经他人授权冒用他人名义进行求助的行为。</p>
										<p>本人收到的全部救助款项将直接用于被救助人的救助，不另行挪作他用。若发起人存在违反上述承诺的行为，愿自行承担全部法律责任。</p>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 项目详情右侧信息 end-->
				<div id="clear"></div>
			</div>
			<div class='xim-qi'>
				<p><i></i> <span>推荐救助</span></p>
				<li><i></i><span><ul class='ul-o'  id="projectListD">

				</ul></span></li>
			</div>
			<div class='xim-qi'>
				<p><i></i> <span>审核拨付流程</span></p>
				<ul class='shbflc'>
					<li>1.<span>初审</span>医院对项目材料进行初审</li>
					<li>2.<span>验证</span>“帮你筹”公益项目办公室实地探访</li>
					<li>3.<span>审批</span>“帮你筹”公益项目办公室综合评审项目</li>
					<li>4.<span>款项拨付</span>善款拨付实施救助</li>
				</ul>
			</div>
			<div class='xim-qi'>
				<p><i></i> <span>常见问题</span></p>
				<ul class='cjwt-s' id="helpCenterId">
				</ul>

				<input type="hidden" id="typeFooter" value="4" />
				<script id="helpCenterTemplate" type="text/x-jquery-tmpl">
	{{each(i,data) list}}
		<li><a href="<%=basePath %>frontHome/helpCenter.do" target="_blank"><i></i>{{= data.title}}</a></li>
	{{/each}}
</script>
				<!--常见问题--内容-->
				<script language="javascript"
						src="<%=basePath%>easy/js/helpCenter/helpCenter.js"></script>
			</div>
		</div>
		<div class='clear'></div>
	</div>
</div>



<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script type="text/javascript"  src="<%=basePath %>easy/js/project/projectDetails.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>

<script id="dynamicTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
           <ul class="schedule">
           <li>
           <b></b>
				<p>{{= data.dateCreate}}<p>
				<p>{{= data.content}}</p>
                <div class="mod-project-padd clearfix">
                {{each(i,img) data.imgsUrl}}
                <img src="{{= img.addr}}" alt="" width="140"  height="80" onclick=javascript:projectDetails.showImg(this);>
                {{/each}}
                </div>
           </li>
		   </ul>
{{/each}}
</script>
<script id="commentTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}
                            <div class="messagelist">
									<img src="{{= data.imageUrl}}" alt="" class="m-headImg1">
									<div class="userinfo">
										<p class="namebox">
											<span class="name Color333">{{= data.nickName}}</span>
											<span class="money color999">帮助了<b class="highlight1">{{= data.supportAmount}}</b>元</span>
											<%--<a class="replaybtn" onclick="projectDetails.showReplyDiv('{{= data.orderId}}')"></a>--%>
											<a class="replay">{{= data.supportTime}}</a>
										</p>
										<%--<p class="color999">{{= data.supportTime}}</p>--%>
									</div>
                                     {{if data.comments[0] == null}}
                                      <div class="otherReplay">
										<ul>
										</ul>
										<div class="replyBox hide">
											<form method="post"  id="{{= data.orderId}}">
                                                <input  name="orderId"  value="{{= data.orderId}}" type="hidden"/>
                                                <input  name="replyId"   type="hidden"/>
												<textarea name="commentContent"  cols="30" rows="6" maxlength='50' validate="q"></textarea>
												<a class="mt20 mb20 btn-w80 btn-public btn-blue" onclick="projectDetails.commont(this,'{{= data.orderId}}');">回复</a>
											</form>
										</div>
									</div>
                                    {{/if}}
                                     {{if data.comments[0] != null && data.comments[0].supportAmount != null}}
                                      <%--<p class="message color333">{{= data.comments[0].content}}</p>--%>
                                      <div class="otherReplay">
										<ul>
                                        {{each(i,d) data.comments}}
                                            {{if i != 0}}
                                            <li>
                                                {{if d.replyUserName == null}}
												  <p><span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.userId}}')">{{= d.nickName}}</a>
                                                  </span>：{{= d.content}}</p>
                                                {{/if}}
                                                {{if d.replyUserName != null}}
												  <p><span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.userId}}')">{{= d.nickName}}</a>
                                                  </span>回复<span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.replyUserId}}')">{{= d.replyNickName}}</a>
                                                  </span>：{{= d.content}}</p>
                                                {{/if}}
                                             </li>
                                            {{/if}}
                                        {{/each}}
										</ul>
										<div class="replyBox hide">
											<form method="post"  id="{{= data.orderId}}">
                                                <input  name="orderId"  value="{{= data.orderId}}" type="hidden"/>
                                                <input  name="replyId"   type="hidden"/>
												<textarea name="commentContent"  cols="30" rows="6" maxlength='50' validate="q" ></textarea>
												<a class="mt20 mb20 btn-w80 btn-public btn-blue"  onclick="projectDetails.commont(this,'{{= data.orderId}}');">回复</a>
											</form>
										</div>
									</div>
                                    {{/if}}
                                    {{if data.comments[0] != null && data.comments[0].supportAmount == null}}
                                      <div class="otherReplay">
										<ul>
                                        {{each(i,d) data.comments}}
                                            <li>
                                            {{if d.replyUserName == null}}
												  <p><span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.userId}}')">{{= d.nickName}}</a>
                                                  </span>：{{= d.content}}</p>
                                            {{/if}}
                                            {{if d.replyUserName != null}}
												  <p><span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.userId}}')">{{= d.nickName}}</a>
                                                  </span>回复<span class="highlight">
                                                  <a href="javascript:void(0)" class="highlight" onclick="projectDetails.showReplyDiv('{{= data.orderId}}',this,'{{= d.replyUserId}}')">{{= d.replyNickName}}</a>
                                                  </span>：{{= d.content}}</p>
                                            {{/if}}
                                            </li>
                                        {{/each}}
										</ul>
										<div class="replyBox hide">
											<form method="post"  id="{{= data.orderId}}">
                                                <input  name="orderId"  value="{{= data.orderId}}" type="hidden"/>
                                                <input  name="replyId"   type="hidden"/>
												<textarea name="commentContent"  cols="30" rows="6" maxlength='50' validate="q"></textarea>
												<a class="mt20 mb20 btn-w80 btn-public btn-blue" onclick="projectDetails.commont(this,'{{= data.orderId}}');">回复</a>
											</form>
										</div>
									</div>
                                    {{/if}}
								</div>
{{/each}}
</script>
<script id="projectListTemp" type="text/x-jquery-tmpl">
    {{each(i,data) pageResult.list}}
    	<li><i></i><a href="<%=basePath %>project/projectDetails.do?projectId={{= data.projectId}}"><span>{{= data.projectName}}</span></a></li>
    {{/each}}
</script>
<script type="text/javascript" src="<%=basePath %>easy/js/project/projectList.js"></script>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    $(function(){
        var withs=$('.jqrt>p>span').html();
        $('.jqrt>p').css('width',withs)
        if(parseInt(withs)<10){
            $('.jqrt>p>span').css('left',-4)
        }

        $(".clik>ul>li").click(function(){
            if(!$(this).hasClass('actionk')){
                $(this).addClass('actionk').siblings('li').removeClass('actionk');
                $($(this).attr('data')).css('display','block').siblings('div').css('display','none')
            }
        })
    })
//    var _content = []; //临时存储li循环内容
//    var moreload = {
//        _default:15, //默认显示图片个数
//        _loading:5,  //每次点击按钮后加载的个数
//        init:function(){
//            var lis = $(".record .hidden li");
//            $(".record ul.list").html("");
//            for(var n=0;n<moreload._default;n++){
//                lis.eq(n).appendTo(".record ul.list");
//            }
//            for(var i=moreload._default;i<lis.length;i++){
//                _content.push(lis.eq(i));
//            }
//            $(".record .hidden").html("");
//        },
//        loadMore:function(){
//            var mLis = $(".record ul.list li").length;
//            for(var i =0;i<moreload._loading;i++){
//                var target = _content.shift();
//                if(!target){
//                    $('.record .jzgd-s').html("<a href='javascript:;'>全部加载完毕...</a>");
//                    break;
//                }
//                $(".record ul.list").append(target);
//                /*$(".record ul.list li").eq(mLis+i).each(function(){
//                    $(this).attr('src',$(this).attr('realSrc'));
//                });*/
//            }
//        }
//    }
//    moreload.init();
</script>
<%--<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />--%>
<script type="text/javascript"  src="<%=basePath %>easy/js/project/projectDetails.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>
<script type="text/javascript" >
    var supportAmt = ${projectDetails.supportAmt};
    var facTarget = ${projectDetails.facTarget};
    var progress = parseInt(supportAmt/facTarget*100);
    $("#progress").html(progress+"%");
    if(progress>100){
        progress = 100;
    }
    $(".progress").children().attr("data-progress",progress);
    var projectStatus = ${projectDetails.projectStatus};
</script>
