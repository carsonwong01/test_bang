/*
 * 文 件 名:  InsertFilesReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月31日
 */
package com.dimeng.model.bus;

import java.util.List;

import com.dimeng.framework.domain.BaseReq;
import com.dimeng.model.expand.InsertSystemFilesReq;

/**
 * 上传多张系统附件
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月31日]
 */
public class InsertFilesReq extends BaseReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -4537007531869184966L;
    
    List<InsertSystemFilesReq> files;
    
    /**
     * @return 返回 files
     */
    public List<InsertSystemFilesReq> getFiles()
    {
        return files;
    }
    
    /**
     * @param 对files进行赋值
     */
    public void setFiles(List<InsertSystemFilesReq> files)
    {
        this.files = files;
    }
    
}
