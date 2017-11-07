//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.dimeng.modules.smses.weilaiwuxian.impl;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.dimeng.framework.abilitys.sms.ISmsService;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.meican.sms.MessageSendImpl;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageSendServiceImpl extends BaseServiceImpl implements ISmsService {
    private static final String encode = "UTF-8";

    public MessageSendServiceImpl() {
    }

    public BaseDataResp batchSendSms(List<String> mobileList, String content) {
        return this.doSendSms(mobileList, content);
    }

    public BaseDataResp sendSms(String mobile, String content) {
        List<String> mobileList = new ArrayList(1);
        mobileList.add(mobile);
        return this.doSendSms(mobileList, content);
    }

    private BaseDataResp doSendSms(List<String> mobileList, String content) {
        this.logs.info("sending msg with aliyun msg service");
        BaseDataResp resp = new BaseDataResp();
        MessageSendImpl ms = new MessageSendImpl();
        StringBuilder sb = new StringBuilder();
        String phtoneNums = "";
        SendSmsResponse rs = null ;
        try {
            for(String num:mobileList){
                sb.append(num);
                sb.append(",");
            }
            if(!"".equals(sb.toString())){
                phtoneNums = sb.toString().substring(0,sb.toString().length());
            }
            rs = ms.sendSms(phtoneNums,content);
            resp.setCode("000000");
            resp.setDescription(rs.getMessage());
        } catch (ClientException e) {
            resp.setDescription("短信发送时出现异常!");
        }
        return resp;
    }
//    private BaseDataResp doSendSms(List<String> mobileList, String content) {
//        BaseDataResp resp = new BaseDataResp();
//        resp.setCode("000001");
//        resp.setDescription("短信发送失败");
//        int len = mobileList.size();
//        if(len <= 0) {
//            return resp;
//        } else {
//            StringBuilder sb = new StringBuilder();
//            sb.setLength(0);
//
//            try {
//                sb.append("cust_code=");
//                sb.append(URLEncoder.encode(SystemCache.getProperty(WeiLaiWuXianVariables.WLWX_SMS_USER_ID), "UTF-8"));
//                sb.append("&destMobiles=");
//
//                for(int i = 0; i < len; ++i) {
//                    if(i > 0) {
//                        sb.append(",");
//                    }
//
//                    sb.append((String)mobileList.get(i));
//                }
//
//                sb.append("&content=");
//                String urlencContent = URLEncoder.encode(content, "UTF-8");
//                sb.append(urlencContent);
//                sb.append("&sign=");
//                String sign = DigestUtils.md5Hex(getContentBytes(urlencContent + SystemCache.getProperty(WeiLaiWuXianVariables.WLWX_SMS_USER_PASSWORD), "UTF-8"));
//                sb.append(sign);
//                sb.append("&sp_code=");
//                sb.append(SystemCache.getProperty(WeiLaiWuXianVariables.WLWX_SMS_SP_CODE));
//                this.logs.info("sms ahahah req url:" + SystemCache.getProperty(WeiLaiWuXianVariables.WLWX_SMS_URI) + ",req params:" + sb);
//                URL postUrl = new URL(SystemCache.getProperty(WeiLaiWuXianVariables.WLWX_SMS_URI));
//                URLConnection connection = postUrl.openConnection();
//                connection.setRequestProperty("accept", "*/*");
//                connection.setRequestProperty("connection", "Keep-Alive");
//                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//                connection.setReadTimeout(30000);
//                connection.setDoOutput(true);
//                connection.setDoInput(true);
//                connection.setAllowUserInteraction(false);
//                DataOutputStream out = new DataOutputStream(connection.getOutputStream());
//                Throwable var11 = null;
//
//                try {
//                    out.write(sb.toString().getBytes("utf-8"));
//                    out.close();
//                } catch (Throwable var21) {
//                    var11 = var21;
////                    throw var21;
//                } finally {
//                    if(out != null) {
//                        if(var11 != null) {
//                            try {
//                                out.close();
//                            } catch (Throwable var20) {
//                                var11.addSuppressed(var20);
//                            }
//                        } else {
//                            out.close();
//                        }
//                    }
//
//                }
//
//                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
//                String result = "";
//
//                for(String s = ""; (s = in.readLine()) != null; result = result + s + "\r\n") {
//                    ;
//                }
//
//                in.close();
//                if(result != null && result.contains(":")) {
//                    String[] SucStr = result.split(":");
//                    if(Integer.valueOf(SucStr[3]).intValue() == 0) {
//                        resp.setCode("000000");
//                    }
//
//                    resp.setDescription(this.getMessage(SucStr[3]));
//                    resp.setData(result);
//                } else {
//                    this.logs.info("send sms return result is NULL");
//                }
//            } catch (Exception var23) {
//                this.logs.error(var23.getMessage());
//                resp.setDescription("短信发送时出现异常！");
//            }
//
//            return resp;
//        }
//    }

    private static byte[] getContentBytes(String content, String charset) {
        if(charset != null && !"".equals(charset)) {
            try {
                return content.getBytes(charset);
            } catch (UnsupportedEncodingException var3) {
                throw new RuntimeException("MD5签名过程中出现错??指定的编码集不对,您目前指定的编码集是:" + charset);
            }
        } else {
            return content.getBytes();
        }
    }

    private String getMessage(String result) {
        String message = "";
        if(result != null) {
            byte var4 = -1;
            switch(result.hashCode()) {
                case 48:
                    if(result.equals("0")) {
                        var4 = 0;
                    }
                    break;
                case 54:
                    if(result.equals("6")) {
                        var4 = 2;
                    }
                    break;
                case 56:
                    if(result.equals("8")) {
                        var4 = 3;
                    }
                    break;
                case 1444:
                    if(result.equals("-1")) {
                        var4 = 1;
                    }
                    break;
                case 1451:
                    if(result.equals("-8")) {
                        var4 = 8;
                    }
                    break;
                case 1570:
                    if(result.equals("13")) {
                        var4 = 4;
                    }
                    break;
                case 1572:
                    if(result.equals("15")) {
                        var4 = 5;
                    }
                    break;
                case 1601:
                    if(result.equals("23")) {
                        var4 = 6;
                    }
                    break;
                case 1605:
                    if(result.equals("27")) {
                        var4 = 7;
                    }
                    break;
                case 1607:
                    if(result.equals("29")) {
                        var4 = 9;
                    }
            }

            switch(var4) {
                case 0:
                    message = "短信发送成功";
                    break;
                case 1:
                    message = "未知错误";
                    break;
                case 2:
                    message = "短信内容超过规定的长度";
                    break;
                case 3:
                    message = "流量控制错，超出最高流量";
                    break;
                case 4:
                    message = "目标号码在黑名单中";
                    break;
                case 5:
                    message = "通道不支持(当前账号所配置的通道不支持该号码所属的号段)";
                    break;
                case 6:
                    message = "客户账号状态错误";
                    break;
                case 7:
                    message = "长短信拆分条数过多";
                    break;
                case 8:
                    message = "用户通道设置不对，需要设置三个通道";
                    break;
                case 9:
                    message = "错误号码";
            }
        } else {
            message = "短信发送返回码为空，请检查服务器公网IP是否已被封锁！";
        }

        return message;
    }
}
