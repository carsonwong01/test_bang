package com.dimeng.modules.pay.wechat.execute;

import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.RefundCheckReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.impl.RefundCheckServiceImpl;
import com.dimeng.modules.pay.wechat.entity.WeChatTradeStatus;
import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
import com.dimeng.modules.pay.wechat.util.RequestHandler;
import com.dimeng.utils.SystemCache;

/**
 * 
 * 退款对账
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月9日]
 */
@Service("wechatRefundCheckService")
public class WeChatRundCheckImpl extends RefundCheckServiceImpl
{
    /**
     * 退款对账 <功能详细描述>
     * 
     * @param req
     * @return
     * @throws Exception
     * @throws Throwable
     */
    @Override
    public BaseDataResp commonSubmit(RefundReq httpEntity, Map<String, Object> param)
        throws Exception, Throwable
    {
        BaseDataResp resp = new BaseDataResp();
        String test=  SystemCache.getProperty(WeChatVaribles.IS_TEST);
        if(test.equals("0")){
            param.put("refundId",  PayCommonUtil.getRandomString(32));
            param.put("resultDes", "");  
            param.put("resultCode", IDiMengResultCode.Commons.SUCCESS);
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            resp.setDescription("操作成功");
            super.commonConfirm(httpEntity.getOrderId(), param);
            return resp;
        }
       

        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("appid", SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID));
        packageParams.put("mch_id", SystemCache.getProperty(WeChatVaribles.WECHAT_MCHID));
        packageParams.put("nonce_str",PayCommonUtil.getRandomString(32));
        packageParams.put("out_trade_no", httpEntity.getOrderNo());
//        packageParams.put("out_refund_no",  httpEntity.getMchtRefundOrderNo());
 
        String sign = RequestHandler. createSign(packageParams);
        packageParams.put("sign",  sign);
        String requestXML = PayCommonUtil.getRequestXml(packageParams); 

      
        logs.info("退款发送请求:" + requestXML);
        // 授权请求URL
        String result = PayCommonUtil.httpsRequest(SystemCache.getProperty(WeChatVaribles.WECHAT_REFUND_CHECK_URL), "POST",  
            requestXML);  
        logs.info("退款查询接收返回信息:" + result);
        
        SortedMap<String,String> map = PayCommonUtil.doXMLParseToSortMap(result);
        //将从API返回的XML数据映射到Java对象

        if (map == null || map.get("return_code") == null) {
             resp.setDescription("退款查询API请求逻辑错误，请仔细检测传过去的每一个参数是否合法，或是看API能否被正常访问");
        }
        String returnCode=map.get("return_code");
        String resultCode=map.get("result_code");//退款状态
        //   退款状态：
        //   SUCCESS—退款成功
        //   FAIL—退款失败
        //   PROCESSING—退款处理中
        //   CHANGE—转入代发，退款到银行发现用户的卡作废或者冻结了，导致原路退款银行卡失败，资金回流到商户的现金帐号，需要商户人工干预，通过线下或者财付通转账的方式进行退款。
        String refundStatus=map.get("refund_status_0");//退款状态
        String refundId=map.get("refund_id_0");//微信退款单号
        
        param.put("resultCode",  IDiMengResultCode.PayResultCode.FAIL);  
        resp.setCode(IDiMengResultCode.PayResultCode.FAIL);
        if (returnCode.equals(WeChatTradeStatus.FALL)) {
            ///注意：一般这里返回FAIL是出现系统级参数错误，请检测Post给API的数据是否规范合法
             resp.setDescription("Case2:退款查询API系统返回失败，请检测Post给API的数据是否规范合法");
             return resp;
        } 
            
            logs.info("退款查询API系统成功返回数据");
            //--------------------------------------------------------------------
            //收到API的返回数据的时候得先验证一下数据有没有被第三方篡改，确保安全
            //--------------------------------------------------------------------

            if (!PayCommonUtil.checkIsSignValidFromResponseString(map)) {
                 resp.setDescription("Case3:退款查询API返回的数据签名验证失败，有可能数据被篡改了");
                 
            }
            else if (returnCode.equals(WeChatTradeStatus.SUCCESS) && resultCode.equals(WeChatTradeStatus.SUCCESS)) {    
                //
                if(refundStatus.equals(WeChatTradeStatus.SUCCESS)){
                    logs.info("退款成功");
                    resp.setDescription(map.get("err_code_des"));
                    param.put("refundFlowNo",refundId);
                    param.put("resultCode",IDiMengResultCode.Commons.SUCCESS);
                    resp.setCode(IDiMengResultCode.Commons.SUCCESS);
                    super.commonConfirm(httpEntity.getOrderId(), param);
                }
                 
                //PROCESSING—退款处理中
                else if (refundStatus.equals(WeChatTradeStatus.REFUND_PROCESSING)) {    
                
                    logs.info("退款处理中...");
                    resp.setDescription(map.get("err_code_des"));
                    resp.setCode(IDiMengResultCode.PayResultCode.REFUNDWAIT);
                } 
                else {
                    logs.info("出错，错误码：" + map.get("err_code")+ " 错误信息：" + map.get("err_code_des"));
                    resp.setDescription(map.get("err_code_des"));
                    resp.setCode(IDiMengResultCode.PayResultCode.REFUNDNOTDISPOSE);
                
                }
            //退款成功
         
        }  else {
            logs.info("出错，错误码：" + map.get("err_code")+ " 错误信息：" + map.get("err_code_des"));
            resp.setDescription(map.get("err_code_des"));
            
        }
        return resp;
    }  
}
