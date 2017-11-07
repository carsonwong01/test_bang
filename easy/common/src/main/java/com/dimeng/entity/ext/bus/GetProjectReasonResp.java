package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询项目失败、删除原因
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class GetProjectReasonResp  implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -3298472767373194151L;
    /**
     * 项目失败、删除原因
     */
    private String reason;
    public String getReason()
    {
        return reason;
    }
    public void setReason(String reason)
    {
        this.reason = reason;
    }
}
