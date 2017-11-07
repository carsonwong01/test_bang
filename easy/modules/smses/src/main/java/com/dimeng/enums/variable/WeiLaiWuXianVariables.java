//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.dimeng.enums.variable;

import com.dimeng.entity.base.VariableBean;
import com.dimeng.utils.VariableTypeAnnotation;

@VariableTypeAnnotation(
        id = "WEILAIWUXIAN",
        name = "未来无限短信发送信息"
)
public enum WeiLaiWuXianVariables implements VariableBean {
    WLWX_SMS_URI("http://218.207.201.87:8860/sendSms.do", "未来无限短信发送地址"),
    WLWX_SMS_USER_PASSWORD("LHKZNP6XHJ", "未来无限短信发送用户密码"),
    WLWX_SMS_USER_ID("530109", "未来无限短信发送用户名"),
    WLWX_SMS_SP_CODE("", "未来无线短信接入号，只能在平台为客户分配的子号码上扩展，若为空则默认为平台分配给客户的长号码");

    private String key;
    private String description;
    private String value;

    private WeiLaiWuXianVariables(String value, String description) {
        StringBuilder builder = new StringBuilder(this.getType());
        builder.append('.').append(this.name());
        this.key = this.name();
        this.description = description;
        this.value = value;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return ((VariableTypeAnnotation)WeiLaiWuXianVariables.class.getAnnotation(VariableTypeAnnotation.class)).id();
    }

    public String getKey() {
        return this.key;
    }

    public String getValue() {
        return this.value;
    }

    public String getDescription() {
        return this.description;
    }

    public boolean isInit() {
        return true;
    }

    public String getTypeName() {
        return null;
    }

    public boolean isDb() {
        return true;
    }
}
