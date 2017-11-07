/*
 * 文 件 名:  IRechargeService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  chenwb
 * 修改时间:  2016年1月13日
 */
package com.dimeng.modules.finance.services;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.dimeng.entity.ext.finance.FindRefundListResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.pay.RefundCheckReq;
import com.dimeng.model.pay.RefundReq;
import com.dimeng.modules.finance.services.base.BaseCommonInterface;

/**
 * 退款接口
 * 
 * @author  sunqiuyan
 * @version  [版本号, 2016年1月13日]
 */
public interface IRefundService extends BaseCommonInterface<List<RefundReq>>
{
   
    BaseDataResp commonSubmit(List<RefundReq> list, Map<String, Object> param)
        throws  Exception, Throwable;
    /**
     * 查询退款订单
     * 1查询待退款的
     * 2查询退款中的
     * <功能详细描述>
     * @return
     */
    public    List<RefundReq> getRefundList(String type);

}
