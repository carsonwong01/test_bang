/*
 * 文 件 名:  FindUserSupportListReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月17日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 我支持的项目订单列表请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月17日]
 */
public class FindUserSupportListReq extends BasePageReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -6465249408821030495L;
    
    /**
     * 订单状态
     * 1待支付
     * 2已取消
     * 3已支付
     * 4待发货
     * 5待收货
     * 6已收货
     * 7待退款
     * 8已退款
     * 9已失败
     * 10退款中
     */
    private String status;
    
    /**
     * @return 返回 status
     */
    public String getStatus()
    {
        return status;
    }
    
    /**
     * @param 对status进行赋值
     */
    public void setStatus(String status)
    {
        this.status = status;
    }
    
}
