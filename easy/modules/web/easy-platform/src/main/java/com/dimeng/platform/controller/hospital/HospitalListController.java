package com.dimeng.platform.controller.hospital;

import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.framework.controller.BaseController;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.modules.hospital.services.IHospitalBasicService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 项目列表
 * <一句话功能简述>
 * <功能详细描述>
 * 
 * @author  zhangshuai
 * @version  [版本号, 2016年11月7日]
 */
@Controller
@RequestMapping("hospital")
public class HospitalListController extends BaseController
{
    @Resource
    IHospitalBasicService hospitalBasicService;
    /**
     * 前台 -医院列表
     */

    @RequestMapping(value = "/{v}/findAllHospital",method = RequestMethod.POST,
                    produces = {"application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object findAllHospital(HttpEntity<HospitalBasicReq> httpEntity, HttpServletRequest request)throws Exception{
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        return hospitalBasicService.findHospitalList(httpEntity.getBody());
    }
    @RequestMapping(value = "/{v}/hospitalDetails",method = RequestMethod.POST,
            produces = {"application/json", "application/xml"})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Object getHospitalDetails(HttpEntity<HospitalBasicReq> httpEntity, HttpServletRequest request)throws Exception{
        BaseDataResp resp = this.validator(httpEntity);
        if (!IDiMengResultCode.Commons.SUCCESS.equals(resp.getCode()))
        {
            return resp;
        }
        return hospitalBasicService.getHospitalDetails(httpEntity.getBody());
    }
}

