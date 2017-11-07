package com.dimeng.modules.pay.wechat.execute;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.OrderPayCheckReq;
import com.dimeng.modules.finance.services.IPayService;
import com.dimeng.modules.finance.services.impl.PayCheckServiceImpl;
import com.dimeng.modules.pay.wechat.entity.WeChatTradeStatus;
import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
import com.dimeng.modules.pay.wechat.util.RequestHandler;
import com.dimeng.utils.SystemCache;

/**
 * 
 * 支付对账
 * <功能详细描述>
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月9日]
 */
@Service("wechatPayCheckService")
public class WeChatPayCheckImpl extends PayCheckServiceImpl
{
   
    
    /**
     * 发送查询请求
     * @param model
     * @return
     * @throws Throwable
     */
    @Override
    public BaseDataResp commonSubmit(OrderPayCheckReq httpEntity, Map<String, Object> param)
        throws Throwable
    {
        BaseDataResp resp = new BaseDataResp();

        String test=  SystemCache.getProperty(WeChatVaribles.IS_TEST);
        if(test.equals("0")){
            
            param.put("resultCode", IDiMengResultCode.Commons.SUCCESS);
            param.put("transactionId",  PayCommonUtil.getRandomString(32));  
            SimpleDateFormat t = new SimpleDateFormat("yyyyMMddHHmmss");
            String orderDatetime = t.format(new Date());
            param.put("timeEnd",  orderDatetime); //支付完成时间
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            resp.setDescription("操作成功");
            
            return resp;
        }
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("appid", SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID));
        packageParams.put("mch_id", SystemCache.getProperty(WeChatVaribles.WECHAT_MCHID));
        packageParams.put("out_trade_no",httpEntity.getOrderNo());
        packageParams.put("nonce_str",PayCommonUtil.getRandomString(32));
    
        String sign = RequestHandler.createSign(packageParams);
        packageParams.put("sign",  sign);
        String requestXML = PayCommonUtil.getRequestXml(packageParams); 

      
        logs.info("支付订单查询API发送请求:" + requestXML);
        //发送请求
        String result = PayCommonUtil.httpsRequest(SystemCache.getProperty(WeChatVaribles.WECHAT_PAY_CHECK_URL), "POST",  
            requestXML);  
        logs.info("支付查询接收返回信息:" + result);
        
        SortedMap<String,String> map = PayCommonUtil.doXMLParseToSortMap(result);
        logs.info("支付订单查询API返回的数据如下："+ result);
        resp.setCode(IDiMengResultCode.PayResultCode.FAIL);
        //将从API返回的XML数据映射到Java对象
        if (map == null || map.get("return_code")==null) {
            logs.info("支付订单查询请求逻辑错误，请仔细检测传过去的每一个参数是否合法");
            resp.setDescription("支付订单查询请求逻辑错误，请仔细检测传过去的每一个参数是否合法");
        }
            String returnCode=map.get("return_code");
            String result_code=map.get("result_code");
            String returnMsg=map.get("return_msg");
            String errCodeDes=map.get("err_code_des");
            String errCode=map.get("err_code");
        if (!PayCommonUtil.checkIsSignValidFromResponseString(map)) {
            resp.setDescription("Case3:支付查询API返回的数据签名验证失败，有可能数据被篡改了");
            return  resp;
        }
        if (returnCode.equals(WeChatTradeStatus.SUCCESS)&&result_code.equals(WeChatTradeStatus.SUCCESS)) {
        //     SUCCESS—支付成功  REFUND—转入支付  NOTPAY—未支付  CLOSED—已关闭  REVOKED—已撤销（刷卡支付）
        //     USERPAYING--用户支付中   PAYERROR--支付失败(其他原因，如银行返回失败)
        String tradeState =map.get("trade_state");//
   
        String transactionId=map.get("transaction_id");
         //交易状态描述 
        String tradeStateDesc=map.get("trade_state_desc");
        String timeEnd =map.get("time_end");
      
        
        param.put("resultCode",  IDiMengResultCode.PayResultCode.FAIL);  
        param.put("transactionId",  transactionId); //微信支付订单号 
        param.put("timeEnd",  timeEnd); //支付完成时间
        resp.setCode(IDiMengResultCode.PayResultCode.FAIL);  
                //SUCCESS—支付成功
                if (tradeState.equals(WeChatTradeStatus.SUCCESS)) {
                    
                    //表示查单结果为“支付成功”
                    logs.info("查询到订单支付成功");
                    resp.setDescription("查询到订单支付成功");
                    param.put("resultCode", IDiMengResultCode.Commons.SUCCESS);  
                    resp.setCode(IDiMengResultCode.Commons.SUCCESS);  
                    super.commonConfirm(httpEntity.getOrderId(), param);
                } 
                //USERPAYING--用户支付中
                else if(tradeState.equals(WeChatTradeStatus.USERPAYING) || tradeState.equals(WeChatTradeStatus.NOTPAY)) {
                    
                    //表示查单结果为“支付中，暂不处理订单”
                    logs.info("查询到订单支付中..."+tradeStateDesc);
                    resp.setDescription("查询到订单支付中...");
 
                } 
                //REFUND—转入支付
                else  if(tradeState.equals(WeChatTradeStatus.REFUND)){
                    
                    //支付不成功
                    logs.info("支付失败(其他原因，如银行返回失败)     "+tradeStateDesc);
                    resp.setDescription("查询到订单支付不成功");
                    resp.setCode(IDiMengResultCode.PayResultCode.PAY_REFUND);  
                    super.commonConfirm(httpEntity.getOrderId(), param);
                    
                }else{
                    //支付不成功
                    logs.info("支付失败(其他原因，如银行返回失败)   "+tradeStateDesc);
                    resp.setDescription("查询到订单支付不成功");
                    resp.setCode(IDiMengResultCode.PayResultCode.PAY_FAIL);  
                    super.commonConfirm(httpEntity.getOrderId(), param);
                }
        }
        else{
            resp.setCode( errCode.equals("ORDERNOTEXIST")?IDiMengResultCode.PayResultCode.ORDERNOTEXISTS
                :IDiMengResultCode.PayResultCode.PAY_FAIL);
            //注意：一般这里返回FAIL是出现系统级参数错误，请检测Post给API的数据是否规范合法
            logs.info("支付订单查询API系统返回失败，失败信息为：" +returnMsg+" "+errCodeDes+ " "+errCode);
            resp.setDescription("支付订单查询API系统返回失败，失败信息为：" +returnMsg+" "+errCodeDes+""+errCode);
            super.commonConfirm(httpEntity.getOrderId(), param);
            return  resp;
            
        }
        return resp;
    }
    
   
}
