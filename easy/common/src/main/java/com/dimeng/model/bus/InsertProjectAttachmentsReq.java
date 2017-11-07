/*
 * 文 件 名:  InsertProjectAttachmentsReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月27日
 */
package com.dimeng.model.bus;

import java.util.List;

import com.dimeng.framework.domain.BaseReq;

/**
 * 多项目图片附件新增请求实体
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月27日]
 */
public class InsertProjectAttachmentsReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -3748686629867957055L;
    
    private List<InsertProjectAttachmentReq> attachmentsReqs;
    
    /**
     * @return 返回 attachmentsReqs
     */
    public List<InsertProjectAttachmentReq> getAttachmentsReqs()
    {
        return attachmentsReqs;
    }
    
    /**
     * @param 对attachmentsReqs进行赋值
     */
    public void setAttachmentsReqs(List<InsertProjectAttachmentReq> attachmentsReqs)
    {
        this.attachmentsReqs = attachmentsReqs;
    }
    
}
