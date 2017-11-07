/*
 * 文 件 名:  EasySystemVariable.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月27日
 */
package com.dimeng.enums.variable;

import java.io.InputStreamReader;

import com.dimeng.entity.base.VariableBean;
import com.dimeng.utils.VariableTypeAnnotation;

/**
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月27日]
 */
@VariableTypeAnnotation(id = "EASY_SYSTEM", name = "系统参数设置")
public enum EasySystemVariable implements VariableBean
{
    WXGZH_APPID("公众号APPID")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    WXGZH_SECRET("公众号秘钥")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    WX_APPID("微信APPID")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    WX_SECRET("微信秘钥")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    WB_APPID("微博APPID")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    WB_SECRET("微博秘钥")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    QQ_APPID("QQAPPID")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    QQ_SECRET("QQ秘钥")
    {
        @Override
        public String getValue()
        {
            return "XXXXXXX";
        }
    },
    ORDER_OVERDUE_TIME("订单有效时间(分钟)")
    {
        @Override
        public String getValue()
        {
            return "120";
        }
    },
    DEFAULT_RECEIPT_PERIOD("默认收货期限(天数)")
    {
        @Override
        public String getValue()
        {
            return "20";
        }
    },
    ADDRESS_MAX_COUNT("收货地址最大设置个数")
    {
        @Override
        public String getValue()
        {
            return "5";
        }
    },
    REFUND_AFTER_DAYS("多少天之后退款")
    {
        @Override
        public String getValue()
        {
            return "3";
        }
    },
    PROJECT_AMOUNT_MIN("发起项目最低金额")
    {
        @Override
        public String getValue()
        {
            return "1000";
        }
    },
    RETURN_COUNT_MAX("添加回报最大数量")
    {
        @Override
        public String getValue()
        {
            return "10";
        }
    },
    TARGET_COUNT("添加梦想目标最大数量")
    {
        @Override
        public String getValue()
        {
            return "10";
        }
    },
    /**
     * 绑定银行卡最大张数
     */
    BIND_BANK_CARD_MAX_COUNT("绑定银行卡最大张数")
    {
        @Override
        public String getValue()
        {
            return "5";
        }
    },
    SETTING_WITHDRAWAL_PASSWORD("是否开启提现密码，true 开启，false 关闭")
    {
        @Override
        public String getValue()
        {
            return "true";
        }
    };
    
    protected final String key;
    
    protected final String description;
    
    EasySystemVariable(String description)
    {
        key = name();
        this.description = description;
    }
    
    @Override
    public String getType()
    {
        return EasySystemVariable.class.getAnnotation(VariableTypeAnnotation.class).id();
    }
    
    @Override
    public String getTypeName()
    {
        return EasySystemVariable.class.getAnnotation(VariableTypeAnnotation.class).name();
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
        try (InputStreamReader reader =
            new InputStreamReader(EasySystemVariable.class.getResourceAsStream(getKey()), "UTF-8"))
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
