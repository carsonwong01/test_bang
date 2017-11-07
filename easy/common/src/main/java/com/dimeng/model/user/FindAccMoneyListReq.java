/*
 * 文 件 名:  FindAccMoneyListReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月18日
 */
package com.dimeng.model.user;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 查询账户交易记录请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月18日]
 */
public class FindAccMoneyListReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 6856076591596400348L;
    
    /**
     * 资金方向
     * 1收入
     * 2支出
     */
    private String direction;
    
    /**
     * @return 返回 direction
     */
    public String getDirection()
    {
        return direction;
    }
    
    /**
     * @param 对direction进行赋值
     */
    public void setDirection(String direction)
    {
        this.direction = direction;
    }
    
}
