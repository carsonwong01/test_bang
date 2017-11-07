package com.dimeng.platform.controller.home.console;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.dimeng.framework.controller.BaseController;
import com.dimeng.modules.home.services.BackgroundHomeService;

/**
 * 后台首页查询 
 * @author  song
 * @version  [版本号, 2016年9月27日]
 */
@Controller
@RequestMapping("home/backgroundHome")
public class BackgroundHomeController extends BaseController
{
    @Resource
    BackgroundHomeService backIndexService;
    
    /**
     * 今日数据
     * <功能详细描述>
     * @author  song
     * @param httpEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{v}/homeTodayData", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findHomeTodayData()
        throws Exception
    {
        return backIndexService.findHomeTodayData();
    }
    
    /**
     * 数据统计
     * <功能详细描述>
     * @author  song
     * @param httpEntity
     * @return
     * @throws Exception
     */ 
    @RequestMapping(value = "/{v}/homeStatData", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findHomeStatData()
        throws Exception
    {
        return backIndexService.findHomeStatData();
    }
    
     /**
     * 待办事项
     * <功能详细描述>
     * @author  song
     * @param httpEntity
     * @return
     * @throws Exception
     */  
    @RequestMapping(value = "/{v}/homeBacklog", method = RequestMethod.POST, produces = {"application/json",
        "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findHomeBacklog()
        throws Exception
    {
        return backIndexService.findHomeBacklog();
    }
 }
