<!--业务管理->项目管理->所有项目->项目详情--项目认证-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
	<c:if test="${validationDetail.auditStatus=='3' }">
		<div>
			<div class="pt20">
				<span class="pt20 mt40 f16">项目验证</span>
				<hr>

			</div>
			<div class="tab-content-container">
				<!--项目验证信息-->
				<div class="tab-item">
					<ul class="gray6">
						<li class="m20">

							<div class="tab-content-container p20">
								<div class="tab-item">
									<ul class="gray6 pt20">
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0 bold">认证类型：</span>
												<div class="tl h30 lh30">
													<c:if test="${validationDetail.projectType=='1' }">个人求助</c:if>
													<c:if test="${validationDetail.projectType=='2' }">个人求助</c:if>
													<c:if test="${validationDetail.projectType=='3' }">个人求助  </c:if>
													<c:if test="${validationDetail.projectType=='4' }">个人求助</c:if>
													<c:if test="${validationDetail.projectType=='5' }">个人求助</c:if>
													<c:if test="${validationDetail.projectType=='6' }">产品急销 </c:if>
													<c:if test="${validationDetail.projectType=='7' }">实现梦想 </c:if>
												</div>
											</div>
										</li>
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0 bold">认证类型：</span>
												<div class="tl h30 lh30">
													<c:if test="${validationDetail.validationType=='1' }">本人验证(个人验证)</c:if>
													<c:if test="${validationDetail.validationType=='2' }">亲属验证 </c:if>
													<c:if test="${validationDetail.validationType=='3' }">夫妻验证 </c:if>
													<c:if test="${validationDetail.validationType=='4' }">组织验证(企业验证) </c:if>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</li>
				</div>
				</li>
				</ul>
				</li>

				<!-- 大病救助（本人验证、亲属验证、夫妻验证） -->
				<c:if
					test="${validationDetail.projectType=='1' && (validationDetail.validationType=='1' || validationDetail.validationType=='2' || validationDetail.validationType=='3') }">
					<li class="mb20"><hr /></li>
					<!-- 收款人信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">收款人信息</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">真实姓名：</span>
											<div class="tl h30 lh30">${validationDetail.receiveRealName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">身份证号：</span>
											<div class="tl h30 lh30">${validationDetail.receiveIdCard }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
											<div class="tl h30 lh30">${validationDetail.receivePhone }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">收款人身份证照片：</span>
											<div class="tl">
												<ul class="gray6 input-list-container clearfix">
													<c:forEach var="item"
														items="${validationDetail.receiveCardImageIds}"
														varStatus="index">
														<li>
															<div class="pr30">
																<img src="${item.addr}"
																	class="border p4 w120 h80 imgPreviewNew">
																<!-- <div class="tl h30 lh30">${item.name }</div> -->
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
				<!-- 个人验证 -->
				<c:if
					test="${validationDetail.projectType!='1' && validationDetail.validationType=='1' }">
					<li class="mb20"><hr /></li>
					<!-- 个人验证信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">个人验证信息</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">真实姓名：</span>
											<div class="tl h30 lh30">${validationDetail.receiveRealName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">身份证号：</span>
											<div class="tl h30 lh30">${validationDetail.receiveIdCard }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
											<div class="tl h30 lh30">${validationDetail.receivePhone }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">收款人身份证照片：</span>
											<div class="tl">
												<ul class="gray6 input-list-container clearfix">
													<c:forEach var="item"
														items="${validationDetail.receiveCardImageIds}"
														varStatus="index">
														<li>
															<div class="pr30">
																<img src="${item.addr}"
																	class="border p4 w120 h80 imgPreviewNew">
																<!-- <div class="tl h30 lh30">${item.name }</div> -->
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</li>
									<!-- 公益项目 -->
									<c:if test="${validationDetail.projectType<='5' }">

										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">资金用途证明照片：</span>
												<div class="tl">
													<ul class="gray6 input-list-container clearfix">
														<c:forEach var="item"
															items="${validationDetail.useProveImgIds}"
															varStatus="index">
															<li>
																<div class="pr30">
																	<img src="${item.addr}"
																		class="border p4 w120 h80 imgPreviewNew">
																	<!-- <div class="tl h30 lh30">${item.name }</div> -->
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</li>
									</c:if>
									<!-- 实现梦想 -->
									<c:if test="${validationDetail.projectType=='7' }">
										<li class="mb20">

											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目相关证明照片：</span>
												<div class="tl">
													<ul class="gray6 input-list-container clearfix">
														<c:forEach var="item"
															items="${validationDetail.projectProveImgIds}"
															varStatus="index">
															<li>
																<div class="pr30">
																	<img src="${item.addr}"
																		class="border p4 w120 h80 imgPreviewNew">
																	<!-- <div class="tl h30 lh30">${item.name }</div> -->
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
				<c:if
					test="${validationDetail.projectType=='1' && validationDetail.validationType!='1' }">
					<li class="mb20"><hr /></li>
					<!-- 受助人（患者）信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">受助人（患者）信息</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">真实姓名：</span>
											<div class="tl h30 lh30">${validationDetail.recipientRealName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">身份证号：</span>
											<div class="tl h30 lh30">${validationDetail.recipient}</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">受助人身份证照片：</span>
											<div class="tl">
												<ul class="gray6 input-list-container clearfix">
													<c:forEach var="item"
														items="${validationDetail.recipientCardImageIds}"
														varStatus="index">
														<li>
															<div class="pr30">
																<img src="${item.addr}"
																	class="border p4 w120 h80 imgPreviewNew">
																<!-- <div class="tl h30 lh30">${item.name }</div> -->
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
				<c:if
					test="${validationDetail.projectType=='1' && (validationDetail.validationType=='2' || validationDetail.validationType=='3') }">

					<li class="mb20"><hr /></li>
					<!-- 收款人与受助人关系信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">收款人与受助人关系</div>
						<div class="tab-content-container p20">
							<!--验证类型-->
							<div class="tab-item">
								<ul class="gray6 pt20">

									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">
												<c:if test="${validationDetail.validationType=='2' }">户口本照片</c:if>
												<c:if test="${validationDetail.validationType=='3' }">结婚证</c:if>
												：
											</span>
											<div class="tl">
												<c:if test="${validationDetail.validationType=='3' }">
													<!-- 结婚证 -->
													<img src="${validationDetail.weddingPictureUrl}"
														class="border p4 w120 h80 imgPreviewNew" />
												</c:if>
												<c:if test="${validationDetail.validationType=='2' }">
													<!-- 户口本 -->
													<ul class="gray6 input-list-container clearfix">
														<c:forEach var="item"
															items="${validationDetail.accountBookImgIds}"
															varStatus="index">
															<li>
																<div class="pr30">
																	<img src="${item.addr}"
																		class="border p4 w120 h80 imgPreviewNew" />
																	<!-- <div class="tl h30 lh30">${item.name }</div> -->
																</div>
															</li>
														</c:forEach>
													</ul>
												</c:if>

											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</c:if>

				<c:if test="${validationDetail.projectType=='1'  }">

					<li class="mb20"><hr /></li>
					<!-- 疾病诊断医院信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">疾病诊断医院</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">所患疾病：</span>
											<div class="tl h30 lh30">${validationDetail.disease }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">医院所在省市：</span>
											<div class="tl h30 lh30">${validationDetail.hospitalRegionName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">医院名称：</span>
											<div class="tl h30 lh30">${validationDetail.hospitalName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">医疗诊断证明：</span>
											<div class="tl">
												<ul class="gray6 input-list-container clearfix">
													<c:forEach var="item"
														items="${validationDetail.proveImgIds}" varStatus="index">
														<li>
															<div class="pr30">
																<img src="${item.addr}"
																	class="border p4 w120 h80 imgPreviewNew">
																<div class="tl h30 lh30"></div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
				<!-- 组织机构验证 -->
				<c:if
					test="${validationDetail.projectType!='6' && validationDetail.validationType=='4' }">

					<li class="mb20"><hr /></li>
					<!-- 组织机构验证信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">组织机构验证信息</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">组织名称：</span>
											<div class="tl h30 lh30">${validationDetail.organizationName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
											<div class="tl h30 lh30">${validationDetail.organizationPhone }</div>
										</div>
									</li>

									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">组织机构资质证明照：</span>
											<div class="tl">
												<img src="${validationDetail.organizationAptitudeUrl}"
													class="border p4 w120 h80 imgPreviewNew" />
											</div>
										</div>
									</li>
									<!-- 公益项目 -->
									<c:if
										test="${validationDetail.projectType!='1' && validationDetail.projectType!='7'  }">
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">资金用途证明照片：</span>
												<div class="tl">
													<ul class="gray6 input-list-container clearfix">
														<c:forEach var="item"
															items="${validationDetail.useProveImgIds}"
															varStatus="index">
															<li>
																<div class="pr30">
																	<img src="${item.addr}"
																		class="border p4 w120 h80 imgPreviewNew">
																	<!-- <div class="tl h30 lh30">${item.name }</div> -->
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</li>
									</c:if>
									<!-- 实现梦想 -->
									<c:if test="${validationDetail.projectType=='7'  }">
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">项目相关证明照片：</span>
												<div class="tl">
													<ul class="gray6 input-list-container clearfix">
														<c:forEach var="item"
															items="${validationDetail.projectProveImgIds}"
															varStatus="index">
															<li>
																<div class="pr30">
																	<img src="${item.addr}"
																		class="border p4 w120 h80 imgPreviewNew">
																	<!-- <div class="tl h30 lh30">${item.name }</div> -->
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
				<!-- 企业验证 -->
				<c:if
					test="${validationDetail.projectType=='6' && validationDetail.validationType=='4' }">
					<li class="mb20"><hr /></li>
					<!-- 企业验证信息 -->
					<li class="mb20">
						<div class="tabnav-container bold f16">企业验证信息</div>
						<div class="tab-content-container p20">
							<div class="tab-item">
								<ul class="gray6 pt20">
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">法人姓名：</span>
											<div class="tl h30 lh30">${validationDetail.receiveRealName }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">身份证号：</span>
											<div class="tl h30 lh30">${validationDetail.receiveIdCard }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
											<div class="tl h30 lh30">${validationDetail.receivePhone }</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 pl160">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">手持身份证照：</span>
											<div class="tl">
												<ul class="gray6 input-list-container clearfix">
													<c:forEach var="item"
														items="${validationDetail.receiveCardImageIds}"
														varStatus="index">
														<li>
															<div class="pr30">
																<img src="${item.addr}"
																	class="border p4 w120 h80 imgPreviewNew">
																<!-- <div class="tl h30 lh30">${item.name }</div> -->
															</div>
														</li>
													</c:forEach>
												</ul>

											</div>
										</div>
									</li>
									<li class="mb20">
										<div class="pr mh30 bold f16">
											<span class="display-ib w140 lh30 tr mr5 pa left0 top0">营业执照：</span>
											<div class="tl">
												<img src="${validationDetail.organizationAptitudeUrl}"
													class="border p4 w120 h80 imgPreviewNew" />
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</li>
				</c:if>

				</ul>

			</div>
		</div>
</div>
</c:if>
</div>
<script language="javascript" src="<%=basePath%>js/framework/DM.js"></script>

<script>
	DM.Event.formatChar();//保留两位小数  format=2
</script>
