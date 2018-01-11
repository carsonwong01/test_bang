package com.dimeng.modulesfoundation.services.impl;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.expand.FindFoundationResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.expand.FindFoundationReq;
import com.dimeng.modulesfoundation.services.FindFoundationService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class FindFoundationServiceImpl extends BaseServiceImpl implements FindFoundationService {

    /**
     * 查找基金会列表
     * @param req
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findFoundationList(FindFoundationReq req) throws Exception {
        BaseDataResp resp = new BaseDataResp();
        Map<String,Object> data = new HashMap<String,Object>();
        QueryEvent<FindFoundationReq> event = new QueryEvent<>();
        //分页显示
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findFoundationList");
        event.setObj(req);
        List<FindFoundationResp> list = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_PAGERESULT,new PageResult(page,list));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }

    /**
     * 查找基金会详细信息
     * @param req
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findFoundationDetails(FindFoundationReq req) throws Exception {
        BaseDataResp resp = new BaseDataResp();
        Map<String,Object> data = new HashMap<String,Object>();
        QueryEvent<FindFoundationReq> event = new QueryEvent<FindFoundationReq>();

        event.setStatement("findFoundationDetails");
        event.setObj(req);
        FindFoundationResp findFoundationResp = (FindFoundationResp) baseDao.findOneByCustom(event);
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, findFoundationResp);
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
