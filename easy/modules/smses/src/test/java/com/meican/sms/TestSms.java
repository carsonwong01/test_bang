package com.meican.sms;

/**
 * Created by Hardy on 2017/9/20.
 */

import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class TestSms {
    private String filterCode(String content) {
        String s = "\\d{6}";
        Pattern p = Pattern.compile(s);
        Matcher m = p.matcher(content);
        return m.find() ? m.group(0) : "";


    }
    public static void main( String args[] ){
        TestSms t =  new TestSms();
        String line = "【轻众筹】尊敬的用户：您的登录验证码是：053266,180秒内有效，请尽快验证。（为了您的账号安全，请勿将验证码告诉他人";
        System.out.println(t.filterCode(line));
        // 按指定模式在字符串查找
//        String line = "This order was placed for QT300000! OK?";

        String pattern = "\\d{6}";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        if (m.find()) {
            System.out.println("Found value: " + m.group(0) );
        } else {
            System.out.println("NO MATCH");
        }
    }
}
