<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!--用户管理 子菜单-->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div class="item-subnav-box" data-title="user">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text fl">用户信息</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="YHGL_YHXX_GRXX_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="userManage/perInformation.do">用户信息</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YHGL_YHXX_GRXX_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						   data-url="userManage/hospitalUserList.do">医院用户信息</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
	</dl>
</div>


<!--业务管理 子菜单-->
<div class="item-subnav-box hide" data-title="business">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text fl">项目管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="YWGL_XMGL_SYXM_MU"> 
					<li><a href="javascript:void(0);" class="click-link"
						data-url="bus/projectManage/allProjectList.do">所有项目</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YWGL_XMGL_ZCZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="bus/projectManage/pendingSubmitList.do">众筹中</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YWGL_XMGL_ZCCG_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="bus/projectManage/pendingAuditingList.do">众筹成功</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YWGL_XMGL_ZCSB_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="bus/projectManage/auditingNotPassList.do">众筹失败</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YWGL_XMGL_YSC_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="bus/projectManage/preheatingList.do">已删除</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text fl">订单管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="YWGL_DDGL_SYDD_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="bus/orderManage/allOrderList.do">所有订单</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		
				<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text fl">审核管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="YWGL_SHGL_XMYZSH_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="bus/auditingManage/projectAuditList.do">项目验证审核</a></li>
				</shiro:hasPermission>
				
					<shiro:hasPermission name="YWGL_SHGL_XMDTGL_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="bus/auditingManage/findDynamicsList.do">项目动态管理</a></li>
				</shiro:hasPermission>
				
						<shiro:hasPermission name="YWGL_SHGL_PLGL_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="bus/auditingManage/findCommentList.do">评论管理</a></li>
				</shiro:hasPermission>
				
					<shiro:hasPermission name="YWGL_SHGL_JBGL_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="bus/auditingManage/findInformantList.do">举报管理</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		
	</dl>
</div>


<!--财务管理 子菜单-->
<div class="item-subnav-box hide" data-title="finance">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">支付记录</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
			        <shiro:hasPermission name="CWGL_ZFJL_ZFJL_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="finance/searchPaymentRecords.do">支付记录</a></li>
					</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">提现管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
			
			    <shiro:hasPermission name="CWGL_TXGL_DSH_MU">
			    <li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchWaitWithdraw.do">待审核</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="CWGL_TXGL_DFK_MU">
				<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchLoanWithdraw.do">待放款</a></li>
			    </shiro:hasPermission>
				<shiro:hasPermission name="CWGL_TXGL_TXCG_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchSuccWithdraw.do">提现成功</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="CWGL_TXGL_TXSB_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchFailedWithdraw.do">提现失败</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">退款管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
			        <shiro:hasPermission name="CWGL_TKGL_DDDTK_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchWaitRefundList.do">订单待退款</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="CWGL_TKGL_DDTKSB_MU">	
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchRefundFailedList.do">订单退款失败</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="CWGL_TKGL_DDTKJL_MU">	
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchRefundRecordList.do">订单退款记录</a></li>
					</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">账务管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
					<shiro:hasPermission name="CWGL_TKGL_PTTZGL_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchPlatformAdjustList.do">平台调账管理</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="CWGL_TKGL_PTZJMX_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchPFCapitalDetailsList.do">平台资金明细</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="CWGL_TKGL_YHZJMX_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchUserCapitalDetailsList.do">用户资金明细</a></li>
				    </shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">对账管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
			        <shiro:hasPermission name="CWGL_DZGL_ZFYCDZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchPayCheckList.do">支付对账</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="CWGL_DZGL_TKYCDZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="finance/searchRefundCheckList.do">退款对账</a></li>
					</shiro:hasPermission>
			
			</ul>
		</dd>
	</dl>
</div>

<!--统计管理 子菜单-->
<div class="item-subnav-box hide" data-title="statistics">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">资金统计</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
					<shiro:hasPermission name="TJGL_ZJTJ_PTSY_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/platformCapitalStatistics.do">平台收益统计</a></li>
					</shiro:hasPermission>	
						<shiro:hasPermission name="TJGL_ZJTJ_YHZC_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/userSupportStatistics.do">用户支持统计</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="TJGL_ZJTJ_YHFQ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/userInitiateStatistics.do">用户发起统计</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="TJGL_ZJTJ_TXTJ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/withdrawCapitalStatistics.do">提现统计</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">用户统计</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="TJGL_YHTJ_ZXYH_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/userOnlineStatistics.do">在线用户统计</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="TJGL_YHTJ_YHTJ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="statistics/userRelevantStatistics.do">用户统计</a></li>
				</shiro:hasPermission> 
			</ul>
		</dd>
	</dl>
</div>

<!--站点管理 子菜单-->
<div class="item-subnav-box hide" data-title="site">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">帮助中心</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
						<shiro:hasPermission name="ZDGL_BZZX_FQXM_MU">
							<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type=1">发起项目相关问题</a></li>
						</shiro:hasPermission> 
						<shiro:hasPermission name="ZDGL_BZZX_XMGL_MU">
							<li><a href="javascript:void(0);" class="click-link"
						data-url="site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type=2">项目管理相关问题</a></li>
						</shiro:hasPermission> 
						<shiro:hasPermission name="ZDGL_BZZX_ZCXM_MU">
							<li><a href="javascript:void(0);" class="click-link"
							data-url="site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type=3">支持项目相关问题</a></li>
						</shiro:hasPermission> 
						<shiro:hasPermission name="ZDGL_BZZX_QTWT_MU"> 
							<li><a href="javascript:void(0);" class="click-link"
							data-url="site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type=4">其他问题</a></li>
						 </shiro:hasPermission> 
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">关于我们</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<shiro:hasPermission name="ZDGL_GYWM_GYWM_MU">
				<ul id="aboutUsLeftMenu">
				</ul>
			</shiro:hasPermission>
		</dd>

		<%-- <dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">关于我们</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
				<ul>
				<shiro:hasPermission name="ZDGL_GYWM_GYWM_MU"> 
					  <li><a href="javascript:void(0);" class="click-link" data-url="site/aboutUs/aboutUsList.do?type=7">关于我们</a></li>
			      </shiro:hasPermission>
			      <shiro:hasPermission name="ZDGL_GYWM_LXFS_MU"> 
			          <li><a href="javascript:void(0);" class="click-link" data-url="site/aboutUs/aboutUsList.do?type=8">联系方式</a></li>
			     </shiro:hasPermission>
			     <shiro:hasPermission name="ZDGL_GYWM_BQSM_MU"> 
			          <li><a href="javascript:void(0);" class="click-link" data-url="site/aboutUs/aboutUsList.do?type=9">版权声明</a></li>
			      </shiro:hasPermission>
			      <shiro:hasPermission name="ZDGL_GYWM_FLFW_MU"> 
			          <li><a href="javascript:void(0);" class="click-link" data-url="site/aboutUs/aboutUsList.do?type=10">法律服务</a></li> 
			      </shiro:hasPermission>
			      <shiro:hasPermission name="ZDGL_GYWM_JRWM_MU"> 
			          <li><a href="javascript:void(0);" class="click-link" data-url="site/aboutUs/aboutUsList.do?type=12">加入我们</a></li>
			        </shiro:hasPermission> 
			        
			          <li><shiro:hasPermission name="ZDGL_HZHB_HZHB_MU">
								<a href="javascript:void(0);" class="click-link"
									data-url="site/partner/queyrPartnerList.do">合作伙伴</a>
					   </shiro:hasPermission></li>
				</ul>
		</dd> --%>

		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">广告</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="ZDGL_GG_GGTP_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="site/banner/queryAdImageList.do">广告图片</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="ZDGL_GG_GZWM_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="site/follow/attentionList.do">关注我们</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">媒体资讯</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul> 
				<li><shiro:hasPermission name="ZDGL_MTZX_PTGG_MU">
						<a href="javascript:void(0);" class="click-link"
							data-url="site/infomedia/queryPlatformNoticeList.do?investmentInfoType=1">平台公告</a>
					</shiro:hasPermission></li>
				<li><shiro:hasPermission name="ZDGL_MTZX_XWZX_MU">
						<a href="javascript:void(0);" class="click-link"
							data-url="site/infomedia/queryPlatformNoticeList.do?investmentInfoType=2">新闻资讯</a>
					</shiro:hasPermission></li>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">项目推荐</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<li><shiro:hasPermission name="ZDGL_SYXM_XMTJ_MU">
						<a href="javascript:void(0);" class="click-link"
							data-url="bus/projectManage/recommendProList.do">项目推荐管理</a>
					</shiro:hasPermission></li> 
			</ul>
		</dd> 
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">站点设置</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<li><shiro:hasPermission name="ZDGL_ZDSZ_ZDXX_MU">
						<a href="javascript:void(0);" class="click-link"
							data-url="site/siteSetting/querySiteSetting.do">站点信息设置</a>
					</shiro:hasPermission></li>
				<li><shiro:hasPermission name="ZDGL_ZDSZ_ZDLG_MU">
						<a href="javascript:void(0);" class="click-link"
							data-url="site/siteSetting/querySiteLogo.do">站点logo</a>
					</shiro:hasPermission></li>  
			</ul>
		</dd>
	</dl>
</div>
<!--  一级菜单暂时未做权限begin -->
<!--运营管理 子菜单-->
<div class="item-subnav-box hide" data-title="operate"
	style="display: block;">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">基本设置</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul style="display: none;">
				<shiro:hasPermission name="YYGL_JBSZ_XMHY_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/projectLabelSetPage.do">项目标签设置</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YYGL_JBSZ_SFSZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/projectWithdrawSetPage.do">平台提现设置</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YYGL_JBSZ_DXMB_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/msgModelsPage.do">短信模板</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YYGL_JBSZ_TPMB_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/imgModelsPage.do">图片模板</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">资料管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul style="display: none;">
				<shiro:hasPermission name="YYGL_ZLGL_XYTK_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="informationMgt/protocol.do">协议条款</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="YYGL_ZLGL_WBSM_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="site/textInstructionsList.do">文本说明</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">消息管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul style="display: block;">
				<shiro:hasPermission name="YYGL_XXGL_DX_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/msgMngPage.do">短信</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">意见反馈</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul style="display: block;">
				<shiro:hasPermission name="YYGL_YJFK_YJFK_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="operations/feedbackList.do">意见反馈</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
	</dl>
</div>

<!--系统管理 子菜单-->
<div class="item-subnav-box hide" data-title="system">
	<dl>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">后台账号管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="XTGL_HTZH_ZHLB_MU">
					<li><a href="javascript:void(0);" class="click-link select-a"
						data-url="system/sysUserListPage.do">账号列表</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="XTGL_HTZH_YHZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/userGpListPage.do">用户组管理</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">系统参数设置</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="XTGL_XTCS_PTCL_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/systemParam/platformContantList.do">平台常量设置</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="XTGL_XTCS_XTSX_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/systemParam/systemProperty.do">系统属性设置</a></li>
				</shiro:hasPermission> 
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">系统日志</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="XTGL_XTRZ_QTRZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/systemLog/frontLogList.do">前台日志</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="XTGL_XTRZ_HTRZ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/systemLog/consoleLogList.do">后台日志</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">数据库备份</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="XTGL_SJBF_BFSJ_MU">
					<li><a href="javascript:void(0);" class="click-link"
						data-url="system/database/backUpDatabaseList.do">备份数据库</a></li>
				</shiro:hasPermission>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" class="click-link item-a"><span
				class="a-text">APP版本管理</span><i
				class="icon-i w30 h30 arrow-down-icon mt5 fr"></i></a>
			<ul>
				<shiro:hasPermission name="XTGL_APP_APP_MU">
					<li><a id="appbbgl" href="javascript:void(0);"
						class="click-link" data-url="system/app/appVersionList.do">APP版本管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="XTGL_APP_QDY_MU">
				<li><a id="appqdysz" href="javascript:void(0);"
						class="click-link" data-url="system/app/appIndexSetPage.do">APP启动页设置</a></li>
			    </shiro:hasPermission>
			</ul>
		</dd>
	</dl>
</div>
<!--  一级菜单暂时未做权限begin -->
<!------------------------------------------------------------------------->
<script type="text/javascript"
	src="<%=basePath%>js/common/about_us_left_menu.js"></script>
<script id="aboutUsLeftMenuTemple" type="text/x-jquery-tmpl">
{{each(i,zd) list}}
      <li><a href="javascript:void(0);" id="abtUs_{{= zd.type}}" class="click-link" data-url="site/aboutUs/aboutUsList.do?type={{= zd.type}}">{{= zd.title}}</a></li>
{{/each}}
 </script>
 <script>
 $(function(){
	 $('<li><shiro:hasPermission name="ZDGL_HZHB_HZHB_MU"><a href="javascript:void(0);" class="click-link" data-url="site/partner/queyrPartnerList.do">合作伙伴</a></shiro:hasPermission></li>').appendTo($("#aboutUsLeftMenu"));
 });
 </script>