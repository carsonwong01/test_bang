/*
 * 文 件 名:  IWithdrawSetService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月23日
 */
package com.dimeng.modules.expand.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.WithdrawSetReq;

/**
 * 平台提现设置接口
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月23日]
 */
public interface IWithdrawSetService
{
    
    /**
     * 平台提现设置
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp commonWithdrawSet(WithdrawSetReq req)
        throws Exception;
    
    /**
     * 获取平台收费设置
     * <功能详细描述>
     * @return
     * @throws Exception
     */
    public BaseDataResp findWithdrawSet()
        throws Exception;
    
}
