package com.dimeng.modules.hospital.services.impl;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.expand.FindAllHospitalResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.expand.HospitalBasicReq;
import com.dimeng.modules.hospital.services.FindHospitalProjectService;
import com.dimeng.utils.SpringBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FindHospitalProjectServiceImpl extends BaseServiceImpl implements FindHospitalProjectService {

    @Autowired
    SpringBeanUtil springBeanUtil;

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHospitalProject(HospitalBasicReq req) throws Exception {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findHospitalProject");
        event.setObj(req);

        List<FindAllHospitalResp> findHosProjectList = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findHosProjectList));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHosProjectSum(HospitalBasicReq req) throws Exception {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findHosProjectSum");
        event.setObj(req);

        List<FindAllHospitalResp> findHosProjectSum = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findHosProjectSum));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
