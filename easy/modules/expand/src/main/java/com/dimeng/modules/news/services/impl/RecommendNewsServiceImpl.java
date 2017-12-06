package com.dimeng.modules.news.services.impl;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.expand.RecomNewsResp;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.service.impl.BaseServiceImpl;
import com.dimeng.model.expand.RecomNewsReq;
import com.dimeng.modules.news.services.RecommendNewsService;
import com.dimeng.utils.SpringBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecommendNewsServiceImpl extends BaseServiceImpl implements RecommendNewsService {
    @Autowired
    SpringBeanUtil springBeanUtil;

    @Override
    public BaseDataResp findRecomNewsList(RecomNewsReq req) throws Exception {

        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<RecomNewsReq> event = new QueryEvent<RecomNewsReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findRecNewsList");
        event.setObj(req);
        List<RecomNewsResp> recomNewsList = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, recomNewsList));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;

    }
}
