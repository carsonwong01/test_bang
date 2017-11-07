package com.dimeng.enums;

public enum ProjectAttachmentTypeEnum
{
    /**
     * 项目图片
     */
    PROJECT_IMGS("1", "项目图片"),
    
    /**
    * 验证医疗证明
    */
    MEDICAL_CERTIFICATE("2", "验证医疗证明"),
    
    /**
     * 户口本照片
     */
    ACCOUNT_PHOTO("3", "户口本照片"),
    
    /**
     * 资金用途证明
     */
    PROOF_USER_FUNDS("4", "资金用途证明"),
    
    /**
    * 项目相关证明材料
    */
    PROJECT_RELATED_CER_MATERIAL("5", "项目相关证明材料"),
    
    /**
     * 项目动态
     */
    PROJECT_DYNAMICS("6", "项目动态"),
    /**
     * 举报项目
     */
    PROJECT_REPORT("7", "举报项目"),
    
    /**
     * 收款人身份证图片
     */
    PROJECT_RECEIVECARD("8", "收款人身份证图片"),
    
    /**
     * 受助人身份证图片
     */
    PROJECT_RECIPIENTCARD("9", "受助人身份证图片");
    
    public String dataBaseVal;
    
    public String descr;
    
    ProjectAttachmentTypeEnum(String dataBaseVal, String descr)
    {
        this.dataBaseVal = dataBaseVal;
        this.descr = descr;
    }
    
    /**
     * 返回描述
     *
     * @return descr 描述
     */
    public String getDescr()
    {
        return descr;
    }
    
    /**
     * 返回数据库存储值
     *
     * @return dataBaseVal 数据库存储值
     */
    public String getDataBaseVal()
    {
        return dataBaseVal;
    }
}
