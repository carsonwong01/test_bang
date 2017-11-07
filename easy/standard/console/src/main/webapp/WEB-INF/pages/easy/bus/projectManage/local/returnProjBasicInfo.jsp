<!--业务管理->项目管理->所有项目->项目详情--项目基本信息-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
	<div>
		<div class="pt20">
				<span class="pt20 mt40 f16">项目信息</span>
				<hr>
			</div>
		<div class="tab-content-container p20">
			<!--项目信息-->
			<div class="tab-item" id="projectBasicInfoId">

				<ul class="gray6 pt20">
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">发起人：</span>
							<div class="tl h30 lh30">${proDetail.initiator }
								(${proDetail.initiatorNickName })</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目类型：</span>
							<div class="tl h30 lh30">
								<c:if test="${proDetail.type<='5' }"> 个人求助 </c:if>
								<c:if test="${proDetail.type=='6' }"> 产品急销 </c:if>
								<c:if test="${proDetail.type=='7' }"> 实现梦想  </c:if>
							</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目标签：</span>
							<div class="tl h30 lh30">${proDetail.label }</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目标题：</span>
							<div class="tl h30 lh30">${proDetail.title }</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目简介：</span>
							<div class="tl h30 lh30">${proDetail.projectIntro}</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">筹资目标：</span>
							<div class="tl h30 lh30">${proDetail.facTarget}元</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">筹资期限：</span>
							<div class="tl h30 lh30">${proDetail.timeLimit}天</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">支持提供收货地址：</span>
							<div class="tl h30 lh30">${proDetail.isNeddAddr==1?'是' :'否'}</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">运费：</span>
							<div class="tl h30 lh30">${proDetail.freight != '' ? proDetail.freight :'0'}</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">发货时间：</span>
							<div class="tl h30 lh30">${proDetail.postTimeText != '' ? proDetail.postTimeText  :''}
							</div>
						</div>
					</li>
					<li class="mb20">
						<div class="pr mh30 pl160">
							<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目图片：</span>
							<div class="tl">
								<ul class="gray6 input-list-container clearfix">
									<li>
										<div class="pr30">
											<div
												style="filter: alpha(opacity = 100); opacity: 0.1; position: absolute; top: 71px; left: 161px; min-width: 128px; height: 18px; line-height: 19px; text-align: center; background: #000; border-radius: 3px; text-align: center; font-size: small; color: black;"></div>
											<div
												style="position: absolute; top: 71px; left: 161px; min-width: 128px; height: 18px; line-height: 19px; text-align: center; border-radius: 3px; text-align: center; font-size: small; color: black;">封面图片</div>
											<img src="${proDetail.coverImgUrl}"
												class="border p4 w120 h80 imgPreviewNew" id="img_img_0">
											<div class="tl h30 lh30">
												<a href="javascript:void(0);" style="color: #008dc4"
													class="imgPreviewNew" id="img_0">查看</a> <a
													href="<%=basePath %>common/downLoad.do?url=${proDetail.coverImgUrl }&fileName=${proDetail.title }封面图片.${proDetail.extension}"
													style="color: #008dc4">下载</a>
											</div>
										</div>

									</li>
									<c:forEach var="item" items="${proDetail.imgs}"
										varStatus="index">
										<c:if test="${item.fileId!=proDetail.coverImageId }">
											<li>
												<div class="pr30">
													<img src="${item.addr}"
														class="border p4 w120 h80 imgPreviewNew"
														id="img_img_${index.index}">
													<div class="tl h30 lh30">
														<a href="javascript:void(0);" style="color: #008dc4"
															class="imgPreviewNew" id="img_${index.index}">查看</a> <a
															href="<%=basePath %>common/downLoad.do?url=${item.addr }&fileName=${item.name }"
															style="color: #008dc4">下载</a>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>

							</div>
						</div>
					</li>
				</ul>

			</div>
		</div>
	</div>
</div>
<script language="javascript" src="<%=basePath%>js/framework/DM.js"></script>

<script language="javascript"
	src="<%=basePath%>js/easy/bus/projectManage/local/projectDetail.js"></script>

<script>
	DM.Event.formatChar();//保留两位小数  format=2
</script>
