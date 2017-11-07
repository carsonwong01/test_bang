package com.dimeng.entity.ext.bus;

import java.io.Serializable;

/**
 * 查询项目内容
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class ProjectContentResp  implements Serializable
{

    /**
     * 注释内容
     */
    private static final long serialVersionUID = -3298472767373194151L;
    /**
     * 项目内容
     */
    private String content;
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
   
    
}
