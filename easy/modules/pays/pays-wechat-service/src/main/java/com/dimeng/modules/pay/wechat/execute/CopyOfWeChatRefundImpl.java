//package com.dimeng.modules.pay.wechat.execute;
//
//import java.math.BigDecimal;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.SortedMap;
//import java.util.TreeMap;
//
//import org.springframework.stereotype.Service;
//
//import com.dimeng.constants.IDiMengResultCode;
//import com.dimeng.enums.variable.WeChatVaribles;
//import com.dimeng.framework.domain.BaseDataResp;
//import com.dimeng.model.pay.RefundReq;
//import com.dimeng.modules.finance.services.impl.RefundServiceImpl;
//import com.dimeng.modules.pay.wechat.entity.RefundReqData;
//import com.dimeng.modules.pay.wechat.entity.WeChatTradeStatus;
//import com.dimeng.modules.pay.wechat.util.HttpsRequest;
//import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
//import com.dimeng.utils.SystemCache;
// 
//
///**
// * 
// * 退款操作，批量退款 <功能详细描述>
// * 
// * @author sunqiuyan
// * @version [版本号, 2016年3月9日]
// */
//public class CopyOfWeChatRefundImpl  
//{ 
//    
//    public static void main(String[] args)
//    {
//        SortedMap<String, Object> parameterMap = new TreeMap<String, Object>();  
//        parameterMap.put("appid", "wx89a42dec00f8c5de");  
//        parameterMap.put("mch_id", "1390132902");  
//        parameterMap.put("nonce_str","jmRKqpsMxAIHOh1PrII6C82E5B5NGEzy");  
//        parameterMap.put("out_trade_no", "161024256544921");
//        parameterMap.put("out_refund_no", "161103365165");
//        
//        parameterMap.put("total_fee", 2200);
//        parameterMap.put("refund_fee",2200);
//        parameterMap.put("op_user_id",  "1390132902");
//        
//       
//        String sign = PayCommonUtil.createSign("UTF-8", (SortedMap<String, Object>) parameterMap); 
//        System.out.println(sign);
//     
//
//    }
//    
//}
