 <div class="index-container">
  <div class=" ml40 mr40 main-bg-white">
    <div class="pr agency-container h200 overflow-h">
      <div class="agency-left-title tc"><span class="display-b h30 lh30 mt20">今</span><span class="display-b h30 lh30">日</span><span class="display-b h30 lh30">数</span><span class="display-b h30 lh30">据</span><i class="icon-i pa bottom0 left0 w80 h80 agency-icon-1"></i><i class="icon-i agency-arrow-icon"></i></div>
      <ul class="clearfix agency-ul-box pt10 ml80">
        <li>
          <div class="agency-li-box">
            <h3 class="gray3 f10">${todayDataJson.registerPerCount }</h3>
            <p class="gray6">今日个人注册（人）</p>
          </div>
        </li>
        
        <li>
          <div class="agency-li-box">
            <h3 class="gray3 f10">${todayDataJson.loginUserCount }</h3>
            <p class="gray6">今日登录（人）</p>
          </div>
        </li> 
        
       <%--   <li>
          <div class="agency-li-box">
            <h3 class="gray3 f10">${todayDataJson.onlineUserCount }</h3>
            <p class="gray6">当前在线（人）</p>
          </div>
        </li>  --%>
      </ul>
    </div>
  </div>
  <!--box2--------------------------------->
  <div class=" ml40 mr40 mt30 main-bg-white">
    <div class="pr agency-container h200 overflow-h">
      <div class="agency-left-title tc"><span class="display-b h30 lh30 mt20">统</span><span class="display-b h30 lh30">计</span><span class="display-b h30 lh30">数</span><span class="display-b h30 lh30">据</span><i class="icon-i pa bottom0 left0 w80 h80 agency-icon-2"></i><i class="icon-i agency-arrow-icon"></i></div>
      <ul class="clearfix agency-ul-box pt10 ml80">
       <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18"><fmt:formatNumber pattern="##,####,###,##0.00" value="${statDataJson.crowdfundingAmount}"/></h3>
            <p class="gray6">累计众筹总额（元）</p>
          </div>
        </li>
        <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18"><fmt:formatNumber pattern="##,####,###,##0.00" value="${statDataJson.cfdSuccessAmount}"/></h3>
            <p class="gray6">累计众筹成功总金额（元）</p>
          </div>
        </li>
        <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18">${statDataJson.sucProjectCount}</h3>
            <p class="gray6">累计众筹成功项目数（个）</p>
          </div>
        </li> 
        
         <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18">${statDataJson.supportPersonTime}</h3>
            <p class="gray6">累计支持总人次（次）</p>
          </div>
        </li> 
        
       <%--  <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18">${statDataJson.supportUserCount}</h3>
            <p class="gray6">累计支持人数（人）</p>
          </div>
        </li> --%>
        
        <li>
          <div class="agency-li-box">
            <h3 class="gray3 f18"><fmt:formatNumber pattern="##,####,###,##0.00" value="${statDataJson.withdrawAmount}"/></h3>
            <p class="gray6">累计提现总额（元）</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <!--box3--------------------------------->
  <div class=" ml40 mr40 mt30 main-bg-white">
    <div class="pr agency-container h200 overflow-h">
      <div class="agency-left-title tc"><span class="display-b h30 lh30 mt20">待</span><span class="display-b h30 lh30">办</span><span class="display-b h30 lh30">事</span><span class="display-b h30 lh30">项</span><i class="icon-i pa bottom0 left0 w80 h80 agency-icon-3"></i><i class="icon-i agency-arrow-icon"></i></div>
      <ul class="clearfix agency-ul-box pt10 ml80" > <br/>
       <shiro:hasPermission name="YWGL_SHGL_XMYZSH_MU">
        <li>
          <div class="agency-li-box">
            <p class="gray6">项目验证待审核<span class="blue">（<a href="javascript:void(0);"  data-top="business" data-left-a="项目验证审核" class="blue navtab-link" data-url="bus/auditingManage/projectAuditList.do" name="home_agency_link" >${backlogJson.proVerification }</a>）</span>个</p>
          </div>
        </li>
        </shiro:hasPermission>
        <shiro:hasPermission name="CWGL_TXGL_DSH_MU">
        <li>
          <div class="agency-li-box">
            <p class="gray6"> 提现待审核<span class="blue">（<a href="javascript:void(0);" data-top="finance" data-left-a="待审核" class="blue navtab-link" data-url="finance/searchWaitWithdraw.do" name="home_agency_link" >${backlogJson.withdrawAudit }</a>）</span>个</p>
          </div>
        </li>
         </shiro:hasPermission>
         <shiro:hasPermission name="CWGL_TXGL_DFK_MU">
        <li>
          <div class="agency-li-box">
            <p class="gray6">提现放款待审核<span class="blue">（<a href="javascript:void(0);" data-top="finance" data-left-a="待放款" class="blue navtab-link" data-url="finance/searchLoanWithdraw.do" name="home_agency_link" >${backlogJson.withdrawLoan }</a>）</span>个</p>
          </div>
        </li>
         </shiro:hasPermission>
         <shiro:hasPermission name="CWGL_TKGL_DDDTK_MU">
        <li>
          <div class="agency-li-box">
            <p class="gray6">订单失败待退款<span class="blue">（<a href="javascript:void(0);" data-top="finance" data-left-a="订单待退款" class="blue navtab-link" data-url="finance/searchWaitRefundList.do" name="home_agency_link" >${backlogJson.orderFailRefund }</a>）</span>个</p>
          </div>
        </li>
         </shiro:hasPermission>
         
      </ul>
    </div>
  </div>
  <div class=" ml40 mr40 mt30 main-bg-white">
    <p class="gray6">登录IP：${currentIP}&nbsp;&nbsp;上次登录IP : ${lastLoginIp}</p>
  </div>
</div>
<!--首页内容 结束-->
<script type="text/javascript">
$(".viewFramework-content").css({"background":"none"});
</script>
