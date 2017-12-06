package com.dimeng.modules.news.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.RecomNewsReq;

public interface RecommendNewsService {
    /**
     * 查询推荐新闻列表
     * @param req
     * @return
     * @throws Exception
     */
    public BaseDataResp findRecomNewsList(RecomNewsReq req)
            throws Exception;
}
