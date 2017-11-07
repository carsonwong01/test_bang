<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var currUserId = "${currUser.userId}";//当前登录人ID
</script>
<div class="p-detail-content">
	<div class="layout clearfix">
		<div class="leftbox fl">
			<h2 class="p-til">${projectDetails.title}</h2>
			<div class="p-headImg">
				<img src="${projectDetails.coverImgUrl}" alt="" width="873"  height="423"> <a
					class="collection <c:if test="${projectDetails.isFocus eq 1}">active</c:if>"
					onclick="projectDetails.collect(this,'${projectDetails.id}');"></a>
			</div>
			<div class="p-detail">
				<ul class="p-tabbox clearfix">
					<a class="control active">项目详情<i></i></a>
					<a class="control" id="dynamicTab">项目动态（<span class="num">${projectDetails.dynamicCount}</span>）<i></i></a>
					<a class="control" id="commentTab">支持（<span class="num">${projectDetails.supportTimes}</span>）<i></i></a>
				</ul>
				<div class="p-tabCont">
					<!-- 项目详情 -->
					<div class="list width-full">${projectDetails.content}
					  <!--项目图片  -->
					  <div class="mod-project-pic clearfix">
						<ul>
						    <c:forEach var="imgs"   items="${projectDetails.imgs}">
							     <li><div class="mod-project-padd"><img src="${imgs.addr}" alt="" width="197"  height="199"></div></li>
							</c:forEach>
						</ul>	
					   </div>		
					</div>
					<!-- 项目详情 end-->
					<!-- 项目动态 -->
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
					<!-- 项目动态 end -->


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
		</div>
    </div>

		<!-- 项目详情右侧信息 -->
		<div class="rightbox fr">
			<div class="p-getMoney p-box">
				<c:choose>
					<c:when test="${projectDetails.projectStatus eq 1}">
						<i class="p-statusIco"></i>
					</c:when>
					<c:when test="${projectDetails.projectStatus eq 2}">
						<i class="p-statusIco p-successfulIco"></i>
					</c:when>
					<c:when test="${projectDetails.projectStatus eq 3}">
						<i class="p-statusIco p-failureIco"></i>
					</c:when>
				</c:choose>
				<h4 class="til">
					已筹金额<i class="btn-blue"></i>
				</h4>
				<p class="g-money">
					<span class="fz18px">￥</span><span class="fz36">${projectDetails.supportAmt}</span>
				</p>
				<p class="a-money">
					目标金额<span>￥${projectDetails.facTarget}</span>
				</p>
				<p class="progressbox clearfix">
					<span class="progress fl"><em class="btn-blue" data-progress=""></em></span> <span
						class="fr"><span id="progress"></span>%</span>
				</p>
				<p class="clearfix support">
					<span class="fl">支持人次：${projectDetails.supportTimes}</span> 
					<span class="fr">剩余时间：
					<c:choose>
					<c:when test="${projectDetails.projectStatus eq 1 && projectDetails.remainingDay >0}">${projectDetails.remainingDay}天</c:when>
					<c:when test="${projectDetails.projectStatus eq 1 && projectDetails.remainingDay ==0}">即将结束</c:when>
					<c:otherwise>已结束</c:otherwise>
					</c:choose>
				   </span>
				</p>
				<c:if test="${projectDetails.type eq 6 || projectDetails.type eq 7 }">
				  <p class="Notebox">
				  <c:if test="${projectDetails.labels != null}">
					<i></i> <span class="highlight">#${projectDetails.labels[0]}</span>
					<c:if test="${projectDetails.labels[1] != null}">
						<span class="highlight">#${projectDetails.labels[1]}</span>
					</c:if>
				  </c:if>
				</p>
				</c:if>
				<div class="eqcbox">
					<img src="${projectDetails.qrcodeImg}" alt="" width="136"  height="136"> <span>扫描左侧二维码<br>立即支持
					</span>
				</div>
			</div>
			<div class="p-box">
				<h4 class="til">
					项目发起人<i class="btn-blue"></i><em class="bord"></em>
				</h4>
				<div class="">
					<div class="promoter clearfix">
						<img class="fl" src="${projectDetails.initiatorImgUrl}" alt="">
						<div class="namebox fl">
							<p class="name">${projectDetails.initiatorNickName}</p>
							<p class="time">${projectDetails.dateCreate}发起</p>
						</div>
					</div>
				</div>
			</div>
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
						<h4 class="til">认证资料<i class="btn-blue"></i><br><span class="tips">提示：请确保您了解项目后再帮助</span><em class="bord"></em></h4>
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
   </div>
</div>
<link rel="stylesheet" href="<%=basePath%>css/lytebox.css" />
<script type="text/javascript"  src="<%=basePath %>easy/js/project/projectDetails.js"></script>
<script type="text/javascript" src="<%=basePath %>js/common/formValidate.js"></script>
<script language="javascript" src="<%=basePath %>js/common/lytebox.js"></script>
<script type="text/javascript"  src="<%=basePath %>js/common/jquery.tmpl.min.js"></script>

<script id="dynamicTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}  
           <div class="schedule">
				<h6>{{= data.dateCreate}}<i class="ico"></i></h6>
				<p>{{= data.content}}</p>
                <div class="mod-project-padd clearfix">
                {{each(i,img) data.imgsUrl}}
                <img src="{{= img.addr}}" alt="" width="90"  height="60" onclick=javascript:projectDetails.showImg(this);>
                {{/each}}  
                </div>
		   </div>
{{/each}}
</script>
<script id="commentTemp" type="text/x-jquery-tmpl">
{{each(i,data) pageResult.list}}  
                            <div class="messagelist">
									<img src="{{= data.imageUrl}}" alt="" class="m-headImg">
									<div class="userinfo">
										<p class="namebox">
											<span class="name Color333">{{= data.nickName}}</span>
											<span class="money color999">支持了<b class="highlight">{{= data.supportAmount}}</b>元</span>
											<a class="replaybtn" onclick="projectDetails.showReplyDiv('{{= data.orderId}}')"></a>
										</p>
										<p class="color999">{{= data.supportTime}}</p>
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
                                      <p class="message color333">{{= data.comments[0].content}}</p>
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
<script type="text/javascript" >
   var supportAmt = ${projectDetails.supportAmt};
   var facTarget = ${projectDetails.facTarget};
   var progress = parseInt(supportAmt/facTarget*100);
   $("#progress").html(progress);
   if(progress>100){
	   progress = 100;
   }
   $(".progress").children().attr("data-progress",progress);
   var projectStatus = ${projectDetails.projectStatus};
</script>
