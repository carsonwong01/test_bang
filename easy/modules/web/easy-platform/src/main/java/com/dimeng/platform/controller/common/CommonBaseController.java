package com.dimeng.platform.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import com.dimeng.enums.SupportSourceEnum;
import com.dimeng.framework.controller.BaseController;

/**
 * 
 * 适配器
 * <功能详细描述>
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年3月14日]
 */
@Controller
public class CommonBaseController extends BaseController
{
    @Autowired
    ApplicationContext applicationContext;
    
    /**
     * 从容器中查找对应的service
     * @param functionNumCode
     * @param tClass
     * @param <T>
     * @return
     */
    
    @SuppressWarnings("unchecked")
    public <T> T getAdaptBeanName(String prefix, Class<T> cls,String terminal)
    {
    	//如果是sdkservice，就在前面加上Sdk
    	String sdk=SupportSourceEnum.ANDROID.dataBaseVal.equals(terminal)|| SupportSourceEnum.IOS.dataBaseVal.equals(terminal)?"Sdk":"";
    	//获取class的全小写
        String clsName = cls.getSimpleName();
        //拼接，拼接之后得到SdkPayServie
        clsName = sdk+ clsName.substring(1, 2).toUpperCase() + clsName.substring(2, clsName.length());
        //拼接，拼接之后得到如果是通联 allinpaySdkPayServie
        String serviceName = prefix + clsName;
       
        return (T)applicationContext.getBean(serviceName);
    }
    
}