/*
 * 文 件 名:  TextInstructController.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年9月29日
 */
package com.dimeng.platform.controller.expand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.model.expand.TextInstructReq;
import com.dimeng.modules.expand.services.ITextInstructService;

/**
 * 文本说明controller
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年9月29日]
 */
@RequestMapping(value = "site/textInstruct")
@Controller
public class TextInstructController
{
    
    @Autowired
    ITextInstructService textInstructService;
    
    /**
     * 文本说明列表查询
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/findTextInstructList", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object findTextInstructList(HttpEntity<TextInstructReq> httpEntity)
        throws Exception
    {
        return textInstructService.findTextInstructList(httpEntity.getBody());
    }
    
    /**
     * 修改文本说明
     * <功能详细描述>
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/commonTextInstruct", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Object commonTextInstruct(HttpEntity<TextInstructReq> httpEntity)
        throws Exception
    {
        return textInstructService.commonTextInstruct(httpEntity.getBody());
    }
}
