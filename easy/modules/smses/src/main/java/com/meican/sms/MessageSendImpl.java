package com.meican.sms;

/**
 * Created by Hardy on 2017/9/20.
 */

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MessageSendImpl {
    private static final String product = "Dysmsapi";
    private static final String domain = "dysmsapi.aliyuncs.com";

    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    private static final String accessKeyId = "LTAIKB6aVrQgLxN9";
    private static final String accessKeySecret = "Bzc7SiF63Dny2xof2AKflFtI9p2rNM";


    // 从之前的短信模版中提取为 6 位数字的验证码
    private String filterCode(String content) {
        String s = "\\d{6}";
        Pattern p = Pattern.compile(s);
        Matcher m = p.matcher(content);
        return m.find() ? m.group(0) : "";
    }


    public SendSmsResponse sendSms(String phoneNums, String content) throws ClientException {

        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        //必填:待发送手机号
        request.setPhoneNumbers(phoneNums);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("中海软银");
        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_95150024");
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        String code = this.filterCode(content);
        request.setTemplateParam("{\"code\":\"" + code + "\"}");

        //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");

        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");

        //hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);

        return sendSmsResponse;
    }
}
