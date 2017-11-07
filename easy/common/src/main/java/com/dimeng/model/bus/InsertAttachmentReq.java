/*
 * 文 件 名:  InsertAttachmentReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月19日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BaseReq;

/**
 * 图片上传(多张图片附件表)请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月19日]
 */
public class InsertAttachmentReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 5914527153125317809L;
    
    /**
     * 图片类型
     * 1项目图片
     * 2验证医疗证明
     * 3户口本照片
     * 4资金用途证明
     * 5项目相关证明材料
     * 6项目动态
     * 7举报项目
     */
    private String fileType;
    
    /**
     * @return 返回 fileType
     */
    public String getFileType()
    {
        return fileType;
    }
    
    /**
     * @param 对fileType进行赋值
     */
    public void setFileType(String fileType)
    {
        this.fileType = fileType;
    }
    
}
