/*
 * 文 件 名:  FindProjectBaseReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月11日
 */
package com.dimeng.model.bus;

import com.dimeng.framework.domain.BasePageReq;

/**
 * 前台-我发起的项目列表请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月11日]
 */
public class FindHospitalProjectBaseReq extends BasePageReq
{
    
    /**
     * 项目状态
     * 1众筹中
     * 2众筹成功
     * 3众筹失败
     */
    private String projectStatus;
    /**
     * 获取当前医院ID
     */
    private String hosptialId;

    public String getHosptialId() {
        return hosptialId;
    }

    public void setHosptialId(String hosptialId) {
        this.hosptialId = hosptialId;
    }

    /**
     * @return 返回 projectStatus
     */
    public String getProjectStatus()
    {
        return projectStatus;
    }
    
    /**
     * @param 对projectStatus进行赋值
     */
    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }
    
}
