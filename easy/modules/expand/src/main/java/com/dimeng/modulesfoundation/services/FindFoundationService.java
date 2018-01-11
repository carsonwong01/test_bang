package com.dimeng.modulesfoundation.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.FindFoundationReq;

public interface FindFoundationService {
    /**
     * 查看基金会列表
     */
    public BaseDataResp findFoundationList(FindFoundationReq req)
            throws Exception;
    /**
     * 查看基金会详细信息
     */
    public BaseDataResp findFoundationDetails(FindFoundationReq req)
            throws Exception;
}
