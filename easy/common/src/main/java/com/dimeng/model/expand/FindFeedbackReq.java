/*
 * 文 件 名:  FindFeedbackReq.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.model.expand;


/**
 * 意见反馈请求参数
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
public class FindFeedbackReq extends FindExportExcelParamsReq
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = -8051565842141045649L;
    
    /**
     * 反馈人
     */
    private String userName;
    
    /**
     * 昵称
     */
    private String nickName;
    
    /**
     * 开始时间
     */
    private String startTime;
    
    /**
     * 结束时间
     */
    private String endTime;
    
    /**
     * @return 返回 userName
     */
    public String getUserName()
    {
        return userName;
    }
    
    /**
     * @param 对userName进行赋值
     */
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
    
    /**
     * @return 返回 nickName
     */
    public String getNickName()
    {
        return nickName;
    }
    
    /**
     * @param 对nickName进行赋值
     */
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
    
    /**
     * @return 返回 startTime
     */
    public String getStartTime()
    {
        return startTime;
    }
    
    /**
     * @param 对startTime进行赋值
     */
    public void setStartTime(String startTime)
    {
        this.startTime = startTime;
    }
    
    /**
     * @return 返回 endTime
     */
    public String getEndTime()
    {
        return endTime;
    }
    
    /**
     * @param 对endTime进行赋值
     */
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    
}
