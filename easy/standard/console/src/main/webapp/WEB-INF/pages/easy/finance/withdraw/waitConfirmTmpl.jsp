<%--提现审核弹框 --%>
<div>
           <input value="{{= id}}"   type="hidden" id="id" />
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">用户：</span>
              <div class="tl h30 lh30" id="userName">{{= userName}}</div>
            </div>
          </li>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">开户所在地：</span>
              <div class="tl h30 lh30" id="bankPlace">{{= bankPlace}}</div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">所在支行：</span>
              <div class="tl h30 lh30" id="bankBranch">{{= bankBranch}}</div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">银行卡账号：</span>
              <div class="tl h30 lh30" id="bankCardNo">{{= bankCardNo}}</div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">提现金额：</span>
              <div class="tl h30 lh30 display-ib pr5" id="withdrawAmt">{{= withdrawAmt}}</div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">手续费：</span>
             <div class="tl h30 lh30 display-ib pr5" id="poundage">{{= poundage}}</div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl160"><span class="display-ib w140 lh30 tr mr5 pa left0 top0">审核意见：</span>
             <div class="tl"><textarea id="checkOpinion"   rows="3" cols="38" maxlength="200"  class="border ww60 mh100 p5 "></textarea></div>
             <p class='gray9 mt5'>200字以内</p>
            </div>
          </li>
        <div class="pl140"><a href="javascript:searchWaitWithdraw.auditWithdraw('1');"  class="btn btn-blue radius-6 mr10  pl20 pr20">审核通过</a>
               <a href="javascript:searchWaitWithdraw.auditWithdraw('2');"  class="btn btn-blue radius-6 mr10  pl20 pr20">审核不通过</a>
               <a href="javascript:Dialog.close();" class="btn btn-blue radius-6 mr10  pl20 pr20">取消</a></div>
</div>