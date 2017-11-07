package com.dimeng.modules.pay.wechat.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.enums.variable.WeChatVaribles;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.modules.finance.services.IPayService;
import com.dimeng.modules.pay.wechat.abstr.WeChatBaseController;
import com.dimeng.modules.pay.wechat.entity.WeChatTradeStatus;
import com.dimeng.modules.pay.wechat.util.Method;
import com.dimeng.modules.pay.wechat.util.PayCommonUtil;
import com.dimeng.utils.SystemCache;

/**
 * 支付回调controller
 * 
 * @author sunqiuyan
 * @version 2016/2/16
 */
@Controller
@RequestMapping("/wechat/callback")
public class CallBackWeChatChargeController extends WeChatBaseController
{
    
    /**
     * 支付service
     */
    @Autowired
    private IPayService payService;
    
   
    
    /**
     * 后台支付回调
     * 
     * @param request
     * @param response
     * @return
     * @throws Throwable
     */
    @RequestMapping("chargeNotify.do")
    @ResponseBody
    public void chargeNotify(HttpServletRequest request, HttpServletResponse response)
        throws Throwable
    {
        String resultXml="";
        getResult(  request,   response ,resultXml);
        
        try(BufferedOutputStream out = new BufferedOutputStream(
            response.getOutputStream())){
            out.write(resultXml.getBytes());
    }
        
    }
    
    /**
     * 回调
     * 
     * @param request
     * @param response
     * @throws Throwable
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("chargeResp.do")
    @ResponseBody
    public String chargeResp(HttpServletRequest request, HttpServletResponse response)
        throws Throwable
    {
        String resultXml="";
         getResult(  request,   response, resultXml);
        writerPrint(response, resultXml );
       return resultXml;
	}
    private BaseDataResp   getResult(HttpServletRequest request, HttpServletResponse response,  String resultXml) throws Exception{

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        BaseDataResp result = new BaseDataResp();
        InputStream inputStream ;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s ;
        try(BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"))){
        while ((s = in.readLine()) != null){
            sb.append(s);
        }
        }
           logs.info("第三方支付后回调信息: "+sb.toString());
           //解析xml成map
        SortedMap<String,String> packageParams = PayCommonUtil.doXMLParseToSortMap(sb.toString());
        
        //判断签名是否正确
        if(PayCommonUtil.checkIsSignValidFromResponseString(packageParams)) {
            packageParams.put("resultCode",IDiMengResultCode.PayResultCode.FAIL);
            Map<String, Object> map=new HashMap<String,Object>();
            String transactionId = (String)packageParams.get("transaction_id");
            String timeEnd = (String)packageParams.get("time_end");
            //商家数据包，原样返回 存储orderId
            String orderId = (String)packageParams.get("attach");
            //------------------------------
            //处理业务开始
            //------------------------------
            if(WeChatTradeStatus.SUCCESS.equals((String)packageParams.get("result_code"))){
                // 这里是支付成功
                //////////执行自己的业务逻辑////////////////
                
                map.put("resultCode", IDiMengResultCode.Commons.SUCCESS);
                map.put("transactionId",  transactionId); //微信支付订单号 
                map.put("timeEnd",  timeEnd); //支付完成时间
                result.setCode(IDiMengResultCode.Commons.SUCCESS);
                result.setDescription("操作成功");
                payService.commonConfirm(orderId, map);
                
                logs.info("支付成功");
                //通知微信.异步确认成功.必写.不然会一直通知后台.八次之后就认为交易失败了.
                resultXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
                
            } else {
                logs.info("支付失败,错误信息：" + packageParams.get("err_code"));
                resultXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
                result.setCode(IDiMengResultCode.PayResultCode.FAIL);
                result.setDescription("操作失败");
                payService.commonConfirm(orderId, map);
                
            }
         
        } else{
            logs.info("通知签名验证失败");
        }
        result.setData(packageParams);
        return result;
}
    
}
