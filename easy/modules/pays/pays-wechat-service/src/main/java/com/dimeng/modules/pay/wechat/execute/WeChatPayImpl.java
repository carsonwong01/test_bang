package com.dimeng.modules.pay.wechat.execute;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.jdom.JDOMException;
import org.springframework.stereotype.Service;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.OrderPayReq;
import com.dimeng.modules.finance.services.impl.PayServiceImpl;
import com.dimeng.modules.pay.wechat.enumes.WeChatCallBackUrl;
import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
import com.dimeng.modules.pay.wechat.util.WxPaySendData;
import com.dimeng.utils.SystemCache;

/**
 * 
 * 微信支付 <功能详细描述>
 * 
 * @author sunqiuyan
 * @version [版本号, 2016年3月9日]
 */
@Service("wechatPayService")
public class WeChatPayImpl   extends PayServiceImpl {

	/**
	 * 支付发送请求
	 * 
	 * @param charge
	 * @param response
	 * @throws Exception
	 */
	public BaseDataResp commonSubmit(OrderPayReq httpEntity, Map<String, Object> param)
			throws Exception {
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
	      super.commonConfirm(httpEntity.getOrderId(), param);
	      return resp;
	  }
	

		// 判断如果是微信支付就使用微信支付地址
		 SortedMap<String, String> parameterMap = new TreeMap<String, String>(); 
		 
		Map<String, String> maps = createChargeMap(httpEntity,parameterMap);
		parameterMap.clear();
//		logs.info("充值请求地址：" + actionUrl + "  参数：[" + formString + "]");
	
		 long time=System.currentTimeMillis();
		 parameterMap.put("appId", SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID));  
		 parameterMap.put("package", "prepay_id="+maps.get("prepay_id"));  
         parameterMap.put("timeStamp",String.valueOf(time));  
         parameterMap.put("nonceStr",  PayCommonUtil.getRandomString(32));  
         parameterMap.put("signType","MD5");  
    	 String paySign = PayCommonUtil.createSign("UTF-8", parameterMap); 
    	  
    	 SortedMap<String, Object> returnMap = new TreeMap<String, Object>();
    	  
		 WxPaySendData sendData=new WxPaySendData();
		 sendData.setAppId(SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID)); 
		 sendData.setTimeStamp(String.valueOf(time));  
		 sendData.setNonceStr(String.valueOf(parameterMap.get("nonceStr")));  
		 sendData.setPrepayId(String.valueOf(maps.get("prepay_id")));  
		 sendData.setSignType("MD5");  
		 sendData.setPaySign(paySign);  
		 sendData.setProjectId(httpEntity.getProjectId());
		 sendData.setOrdeId(httpEntity.getOrderId());
		 returnMap.put("json",sendData);
		 resp.setData(returnMap);
		 resp.setCode(IDiMengResultCode.Commons.SUCCESS);
		return resp;

	}

	/**
	 * <一句话功能简述> <功能详细描述>
	 * 
	 * @param httpEntity
	 * @param parameterMap 
	 * @param bool
	 *            微信支付，true 其他支付false
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> createChargeMap(OrderPayReq httpEntity, SortedMap<String, String> parameterMap)
			throws Exception {
		
         parameterMap.put("appid", SystemCache.getProperty(WeChatVaribles.WECHAT_APP_ID));  
         parameterMap.put("mch_id", SystemCache.getProperty(WeChatVaribles.WECHAT_MCHID));  
         parameterMap.put("nonce_str",PayCommonUtil.getRandomString(32));  
         logs.info("=------"+httpEntity.getBody());
         parameterMap.put("body", "微信支付");
         parameterMap.put("detail", "");
       //附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
         parameterMap.put("attach",httpEntity.getOrderId());
         parameterMap.put("out_trade_no",  httpEntity.getOrderNo());
//         parameterMap.put("fee_type", "CNY");  
         if(SystemCache.getProperty(WeChatVaribles.WECHAT_IS_TEST).equals("true")){
             BigDecimal dec=  new BigDecimal("0.01");
             httpEntity.setAmount(dec);
         }
         BigDecimal total = httpEntity.getAmount().multiply(new BigDecimal(100));  
         java.text.DecimalFormat df=new java.text.DecimalFormat("0");  
         parameterMap.put("total_fee", df.format(total));  
         parameterMap.put("spbill_create_ip","127.0.0.1");  
         parameterMap.put("notify_url", SystemCache.getProperty(WeChatVaribles.WECHAT_DOMAIN_URL).concat(WeChatCallBackUrl.Charge.getNotify()));  
         parameterMap.put("trade_type", "JSAPI");
         //trade_type为JSAPI是 openid为必填项
         parameterMap.put("openid",httpEntity.getOpenId());// httpEntity.getOpenId());
       
         String sign = PayCommonUtil.createSign("UTF-8",  parameterMap); 
         parameterMap.put("sign", sign);  
         
         String requestXML = PayCommonUtil.getRequestXml(parameterMap); 
         
         // 授权请求URL
         logs.info("发送请求xml："+requestXML);  
         String result = PayCommonUtil.httpsRequest(SystemCache.getProperty(WeChatVaribles.WECHAT_PAY_URL), "POST",  
                 requestXML);  
         
         logs.info("支付申请结果返回:"+result);  
         try {  
            return  PayCommonUtil.doXMLParse(result);  
         } catch (JDOMException e) {  
             // TODO Auto-generated catch block  
           logs.error(e);
         } catch (IOException e) {  
             // TODO Auto-generated catch block  
             logs.error(e);
         }  

		return null;

	}

}
