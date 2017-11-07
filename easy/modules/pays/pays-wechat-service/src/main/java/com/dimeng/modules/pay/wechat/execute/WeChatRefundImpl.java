package com.dimeng.modules.pay.wechat.execute;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.impl.RefundServiceImpl;
import com.dimeng.modules.pay.wechat.entity.WeChatTradeStatus;
import com.dimeng.modules.pay.wechat.util.ClientCustomSSL;
import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
import com.dimeng.modules.pay.wechat.util.RequestHandler;
import com.dimeng.utils.SystemCache;
 

/**
 * 
 * 退款操作，批量退款 <功能详细描述>
 * 
 * @author sunqiuyan
 * @version [版本号, 2016年3月9日]
 */
@Service("wechatRefundService")
public class WeChatRefundImpl extends RefundServiceImpl
{
    /**
     * 退款处理
     * 
     * @param refund
     * @param response
     * @throws Throwable 
     */
    public BaseDataResp commonSubmit(List<RefundReq> list, Map<String, Object> param)
        throws Throwable
    {
        BaseDataResp resp = new BaseDataResp();
        String test=  SystemCache.getProperty(WeChatVaribles.IS_TEST);
        if(test.equals("0")){
            param.put("refundId",  PayCommonUtil.getRandomString(32));
            param.put("resultDes", "");  
            param.put("resultCode", IDiMengResultCode.Commons.SUCCESS);
            resp.setCode(IDiMengResultCode.Commons.SUCCESS);
            resp.setDescription("操作成功");
            super.commonConfirm(list.get(0).getOrderId(), param);
            return resp;
        }
       
        if (null == param)
        {
            param = new HashMap<String, Object>();
        }
        if (null == list || list.size() < 1)
        {
            return resp;
        }
        //失败返回的退款对象
        // 批量处理
        BaseDataResp baseResp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        for (int i = 0; i < list.size(); i++)
        {
            if (list.get(i) != null && list.get(i).getOrderId() != null)
            {
              
                baseResp = getRefund(list.get(i), param);
                if (!IDiMengResultCode.Commons.SUCCESS.equals(baseResp.getCode()))
                {
                    resp = baseResp;
                }
            }
        }
        return resp;
    }
    
    
    /**
     * 退款发送请求 <功能详细描述>
     * 
     * @param httpEntity
     * @param param
     * @return
     * @throws Throwable 
     */
    @SuppressWarnings("unchecked")
    public BaseDataResp getRefund(RefundReq httpEntity, Map<String, Object> param)
        throws Throwable
    {
        String amount= String.valueOf(( httpEntity.getRefundAmount().multiply(new BigDecimal(100))).intValue());;
        BaseDataResp resp = new BaseDataResp();
        if(SystemCache.getProperty(WeChatVaribles.WECHAT_IS_TEST).equals("true")){
            BigDecimal dec=  new BigDecimal("0.01");
              amount=  String.valueOf((dec.multiply(new BigDecimal(100))).intValue());
        }
        
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("appid", SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID));
        packageParams.put("mch_id", SystemCache.getProperty(WeChatVaribles.WECHAT_MCHID));
        packageParams.put("nonce_str",PayCommonUtil.getRandomString(32));
        packageParams.put("out_trade_no", httpEntity.getOrderNo());
        packageParams.put("out_refund_no",  httpEntity.getRefundNo());
        packageParams.put("total_fee", amount);
        packageParams.put("refund_fee", amount);
        packageParams.put("op_user_id",  SystemCache.getProperty(WeChatVaribles.WECHAT_MCHID));
 
        String sign = RequestHandler. createSign(packageParams);
        packageParams.put("sign", sign);
        String requestXML = PayCommonUtil.getRequestXml(packageParams); 
    
        logs.info("退款发送请求:" + requestXML);
        //发送请求
        String result= ClientCustomSSL.doRefund(SystemCache.getProperty(WeChatVaribles.WECHAT_REFUND_URL), requestXML);
        
        logs.info("退款接收返回信息:" + result);
        
        SortedMap<String,String> map = PayCommonUtil.doXMLParseToSortMap(result);
        if (map == null || map.get("return_code") == null)
        {
            logs.info("Case1:退款API请求逻辑错误，请仔细检测传过去的每一个参数是否合法，或是看API能否被正常访问");
            
        }
      resp.setCode(IDiMengResultCode.PayResultCode.FAIL);
      String code=  map.get("return_code");
      String resultCode=  map.get("result_code");
      //String outRefundNo=  map.get("out_refund_no");//商户退款单号
      String refund_id=  map.get("refund_id");//微信退款单号第三方返回，对账时会用到
        //Debug:查看数据是否正常被填充到scanPayResponseData这个对象中
      param.put("resultCode",  IDiMengResultCode.PayResultCode.FAIL); 
      
      
        if (code.equals(WeChatTradeStatus.FALL))
        {
            ///注意：一般这里返回FAIL是出现系统级参数错误，请检测Post给API的数据是否规范合法
            logs.info("Case2:退款API系统返回失败，请检测Post给API的数据是否规范合法"+" "+code  +"  " +    map.get("return_msg"));
        }
        else
        {
            logs.info("退款API系统成功返回数据");
            //--------------------------------------------------------------------
            //收到API的返回数据的时候得先验证一下数据有没有被第三方篡改，确保安全
            //--------------------------------------------------------------------
            
            if (!PayCommonUtil.checkIsSignValidFromResponseString(map))
            {
                logs.info("Case3:退款请求API返回的数据签名验证失败，有可能数据被篡改了");
                
            }
            
            if (resultCode.equals(WeChatTradeStatus.SUCCESS))
            {

                param.put("refundId", refund_id);
                param.put("resultCode",  IDiMengResultCode.Commons.SUCCESS);  
                param.put("resultDes", map.get("err_code_des"));  
                //退款成功
                logs.info("Case5:【退款成功】");
                resp.setDescription("查询到订单支付不成功");
                resp.setCode(IDiMengResultCode.Commons.SUCCESS);
                super.commonSubmit(httpEntity.getOrderId(), param);
            }
            else
            {
                param.put("resultDes", map.get("err_code_des"));  
                logs.info("出错，错误码：" + map.get("err_code")+"     错误信息：" + map.get("err_code_des"));
                super.commonOrderFail(httpEntity.getOrderId(), param);
                //退款失败时再怎么延时查询退款状态都没有意义，这个时间建议要么再手动重试一次，依然失败的话请走投诉渠道进行投诉
                resp.setDescription("出错，错误码：" + map.get("err_code")+"     错误信息：" + map.get("err_code_des"));
               
            }
        }
        return resp;
    }
    
}
