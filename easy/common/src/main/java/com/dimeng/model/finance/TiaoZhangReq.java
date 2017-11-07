package com.dimeng.model.finance;

import com.dimeng.framework.domain.BaseReq;

/**
 * 
 * 平台调账参数实体类
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年10月11日]
 */
public class TiaoZhangReq extends BaseReq
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = 1987064380282771057L;
    
    /**
     * 类型：1收入调账、2支出调账
     */
    private String type;
   
    /**
     * 调账金额（元）
     */
    private String tiaozhangAmt;
    
    /**
     * 备注
     */
    private String remark;

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getTiaozhangAmt()
    {
        return tiaozhangAmt;
    }

    public void setTiaozhangAmt(String tiaozhangAmt)
    {
        this.tiaozhangAmt = tiaozhangAmt;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }
    
    
    
    
}
