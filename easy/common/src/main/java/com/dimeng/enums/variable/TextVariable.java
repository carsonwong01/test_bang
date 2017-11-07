package com.dimeng.enums.variable;

import java.io.InputStreamReader;

import com.dimeng.entity.base.VariableBean;
import com.dimeng.utils.VariableTypeAnnotation;

/**
 * 
 * 文本参数设置
 * <功能详细描述>
 * 
 * @author  chencc
 * @version  [版本号, 2016年1月21日]
 */
@VariableTypeAnnotation(id = "STOCK_TEXT", name = "文本参数设置")
public enum TextVariable implements VariableBean
{
    //平台客服电话
    PLATFORM_CUSTOMER_SERVICE("平台客服电话")
    {
        @Override
        public String getValue()
        {
            return "400-666-8888";
        }
    },
    //平台服务邮箱
    PLATFORM_SERVICE_EMAIL("平台服务邮箱")
    {
        @Override
        public String getValue()
        {
            return "kefu1@dimeng.net";
        }
    },
    //平台服务时间
    PLATFORM_SERVICE_TIME("平台服务时间")
    {
        @Override
        public String getValue()
        {
            return "9:00 - 18:00";
        }
    },
    //平台地址
    PLATFORM_SERVICE_ADDRESS("平台地址")
    {
        @Override
        public String getValue()
        {
            return "广东省深圳市罗湖区宝安南路振业大厦";
        }
    },
    //平台版本信息
    PLATFORM_VERSION_INFORMATION("平台版本信息")
    {
        @Override
        public String getValue()
        {
            return "深圳市迪蒙网络科技有限公司 © 2016  All Rights Reserved | 备案号：粤ICP备13082949号";
        }
    };
    
    protected final String key;
    
    protected final String description;
    
    TextVariable(String description)
    {
        key = name();
        this.description = description;
    }
    
    @Override
    public String getType()
    {
        return TextVariable.class.getAnnotation(VariableTypeAnnotation.class).id();
    }
    
    @Override
    public String getTypeName()
    {
        return TextVariable.class.getAnnotation(VariableTypeAnnotation.class).name();
    }
    
    @Override
    public String getKey()
    {
        return key;
    }
    
    @Override
    public String getDescription()
    {
        return description;
    }
    
    @Override
    public String getValue()
    {
        try (
            InputStreamReader reader = new InputStreamReader(TextVariable.class.getResourceAsStream(getKey()), "UTF-8"))
        {
            StringBuilder builder = new StringBuilder();
            char[] cbuf = new char[1024];
            int len = reader.read(cbuf);
            while (len > 0)
            {
                builder.append(cbuf, 0, len);
                len = reader.read(cbuf);
            }
            return builder.toString();
        }
        catch (Throwable t)
        {
        }
        return null;
    }
    
    @Override
    public boolean isInit()
    {
        return true;
    }
    
    @Override
    public boolean isDb()
    {
        return true;
    }
    
}
