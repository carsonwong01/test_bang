package com.dimeng.modules.hospital.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.HospitalBasicReq;

public interface FindHospitalProjectService {

    /**
     * 指定医院的项目列表以及详情
     */
    BaseDataResp findHospitalProject(HospitalBasicReq req)
            throws Exception;
    BaseDataResp findHosProjectSum(HospitalBasicReq req)
            throws Exception;
}
