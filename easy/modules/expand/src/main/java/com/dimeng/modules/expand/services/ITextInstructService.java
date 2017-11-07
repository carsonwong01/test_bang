/*
 * 文 件 名:  ITextInstructService.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.modules.expand.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.TextInstructReq;

/**
 * 文本说明service
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public interface ITextInstructService
{
    
    /**
     * 文本说明列表查询
     * <功能详细描述>
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findTextInstructList(TextInstructReq req)
        throws Exception;
    
    /**
     * 修改文本说明
     * <功能详细描述>
     * @param body
     * @return
     * @throws Exception
     */
    public BaseDataResp commonTextInstruct(TextInstructReq req)
        throws Exception;
    
}
