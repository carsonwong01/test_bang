<!--业务管理->验证管理-项目验证详情-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="p20">
	<div class="border">
		<div class="title-container">
			<i class="icon-i w30 h30 va-middle title-left-icon"></i><span>项目验证审核</span>
			<a class="btn-blue2 btn white radius-6 pl20 pr20 f14 m5 fr click-link"
					data-url="bus/auditingManage/projectAuditList.do">返回</a></li>

		</div>
		<div class="tab-content-container p20">
			<!--项目验证信息-->
			<div class="tab-item">
				<ul class="gray6 pt20">
					<!-- 项目标题 -->
					<li class="mb40">
						<div class="tabnav-container pl200 f20 bold">${validationDetail.projectName }
							（
							<c:if test="${validationDetail.projectType=='1' }">个人求助 </c:if>
							<c:if test="${validationDetail.projectType=='2' }">个人求助</c:if>
							<c:if test="${validationDetail.projectType=='3' }">个人求助 </c:if>
							<c:if test="${validationDetail.projectType=='4' }">个人求助</c:if>
							<c:if test="${validationDetail.projectType=='5' }">个人求助</c:if>
							<c:if test="${validationDetail.projectType=='6' }">产品急销 </c:if>
							<c:if test="${validationDetail.projectType=='7' }">实现梦想 </c:if>
							—
							<c:if test="${validationDetail.validationType=='1' }">本人验证(个人验证)</c:if>
							<c:if test="${validationDetail.validationType=='2' }">亲属验证 </c:if>
							<c:if test="${validationDetail.validationType=='3' }">夫妻验证 </c:if>
							<c:if test="${validationDetail.validationType=='4' }">组织验证(企业验证) </c:if>
							）
						</div>
					</li>

					<!-- 大病救助（本人验证、亲属验证、夫妻验证） -->
					<c:if
						test="${validationDetail.projectType=='1' && (validationDetail.validationType=='1' || validationDetail.validationType=='2' || validationDetail.validationType=='3') }">
						<!-- 收款人信息 -->
						<li class="mb20">
							<div class="tabnav-container pl200 f16 bold">收款人信息</div>
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
							<div class="tabnav-container pl200 f16 bold">个人验证信息</div>
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
							<div class="tabnav-container pl200 f16 bold">受助人（患者）信息</div>
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
							<div class="tabnav-container pl200 f16 bold">收款人与受助人关系</div>
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
							<div class="tabnav-container pl200 f16 bold">疾病诊断医院</div>
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
												<div class="tl h30 lh30">${validationDetail.province }${validationDetail.city }</div>
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
							<div class="tabnav-container pl200 f16 bold">组织机构验证信息</div>
							<div class="tab-content-container p20">
								<div class="tab-item">
									<ul class="gray6 pt20">
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">组织名称：</span>
												<div class="tl h30 lh30">${validationDetail.hospitalName }</div>
											</div>
										</li>
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0">联系电话：</span>
												<div class="tl h30 lh30">${validationDetail.mobilePhone }</div>
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
							<div class="tabnav-container pl200 f16 bold">企业验证信息</div>
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
											<div class="pr mh30 pl160">
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
					<c:if test="${validationDetail.auditStatus !='1' }">
						<li class="mb20"><hr /></li>
						<!-- 项目备案号信息 -->
						<li class="mb20">
							<div class="tabnav-container pl200 f16 bold">项目备案号信息</div>
							<div class="tab-content-container p20">
								<div class="tab-item">
									<ul class="gray6 pt20">
										<li class="mb20">
											<div class="pr mh30 pl160">
												<span class="display-ib w140 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>项目备案号：</span>
													<input name='projectRecord' readonly="readonly" maxlength="25" type="text" value='${validationDetail.projectRecord }'  class='upi' style="width: 300px;height: 30px; border:none">
											</div>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${to=='sh' && validationDetail.auditStatus=='1' }">
						<%--<li class="mb20"><hr /></li>--%>
						<%--<!-- 项目备案号信息 -->--%>
						<%--<li class="mb20">--%>
							<%--<div class="tabnav-container pl200 f16 bold">项目备案号信息</div>--%>
							<%--<div class="tab-content-container p20">--%>
								<%--<div class="tab-item">--%>
									<%--<ul class="gray6 pt20">--%>
										<%--<li class="mb20">--%>
											<%--<div class="pr mh30 pl160">--%>
												<%--<span class="display-ib w140 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>项目备案号：</span>--%>
												<%--<from class="pr">--%>
													<%--<input name='projectRecord' maxlength="25" type="text" value='${validationDetail.projectRecord }' placeholder="募捐活动在民政部备案号" style="width: 300px;height: 30px;" validate='q' class='upi'>--%>
												<%--</from>--%>
											<%--</div>--%>
										<%--</li>--%>
									<%--</ul>--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</li>--%>
						<li class="mb20 tc">
							<div id="sh" class="pr mh30 pl160">
								<a href="javascript:void(0);"
										class="btn-blue2 btn white radius-6 pl20 pr20 toAuditDialog"
										id="${validationDetail.validationId}">审核</a>
								<a class="btn-blue2 btn white radius-6 pl20 pr20 f14 click-link"
									data-url="bus/auditingManage/projectAuditList.do">返回</a>
	
							</div>
						</li>
					</c:if>
					<li class="mb20">
						<div class="mh30  pr50 pl50">
							<div class="f16 bold ml20">项目验证审核记录</div>
							<form id="dataForm">
								<input type="hidden" name="id"
									value="${validationDetail.validationId }" />

								<div class="mt20 table-container">
									<table class="table table-style gray6 tc">
										<thead>
											<tr class="title">
												<th class="tc">序号</th>
												<th>审核时间</th>
												<th>审核人</th>
												<th>审核结果</th>
												<th>审核意见</th>
											</tr>
										</thead>
										<tbody class="f12" id="authenticatedRecordData"></tbody>
										</tbody>
									</table>
								</div>
								<!--分页-->
								<div class="paging" id="authenticatedRecordTag"></div>
							</form>
						</div>
					</li>
				</ul>

			</div>
		</div>
	</div>
</div>
<script id="authenticatedRecordTemp" type="text/x-jquery-tmpl">
{{each(i,data) list}}   
       <tr {{if i %2 == 0}}class="tr-even" {{/if}}>
          <td class="tc">{{= i+1}}</td>
          <td>{{= data.dateCheck}}</td>
          <td>{{= data.author}}</td>
		  <td>
		  {{if data.status<="1"}}    
	     	 待审核
	      {{/if}}
		   {{if data.status=="2"}}        
	                         审核不通过
	      {{/if}}
   		   {{if data.status=="3"}}       
	       	 审核通过
	      {{/if}}
          </td>
          <td>
		       <a href="javascript:void(0);" class="link-blue ml10  mr10 toShowReasonDialog" id="{{= data.opinion}}" >查看</a>
		  </td>
        </tr>
{{/each}}
</script>
<script id="auditReasonTemp" type="text/x-jquery-tmpl">
   <%@include file="/WEB-INF/pages/easy/bus/projectManage/dialog/showReasonTmpl.jsp" %>
</script>

<script id="toAuditTemp" type="text/x-jquery-tmpl">
<div class="popup-content-container-2">
		<div class="p30">
          <form id="auditTmplForm">
		    <!--业务管理->项目管理->-取消项目模板-->
			<div> 
				<!-- 验证id -->
				<input type="hidden" id="id" name="id" value="{{= validationId}}"/>
				<!-- 审核状态 -->
				<input type="hidden" id="status" name="status" value=""/>

				<div class="f16 fb gray3">项目备案号：</div>
				<div class="pr tl" style="margin: 10px 0px 10px 30px">
				   <input name="projectRecord" class="border" maxlength="25" value="" validate="q" id="projectRecord" placeholder="募捐活动在民政部备案号" style="width: 300px;height: 30px;"/>
				</div>

				<div class="f16 fb gray3"><em class="red pr5">*</em>审核意见：</div> 
				<div class="pr tl" style="margin: 10px 0px 0px 30px">
				   <textarea name="auditInfo" cols="53" rows="5" class="border p10" maxlength="200" validate="q" least="1|200" id="reasonText"></textarea>
				</div>
				<span class="lh30" style="margin-left: 30px">200字以内</span>
				<p class="prompt" id="reasonTextMsg"></p>
			</div> 
		 </form>
	   </div>
	</div>
</script>
<script language="javascript" src="<%=basePath%>js/framework/DM.js"></script>

<script language="javascript"
	src="<%=basePath%>js/easy/bus/auditingManage/proAuthenticatedDetail.js"></script>

<script>
	DM.Event.formatChar();//保留两位小数  format=2
</script>
