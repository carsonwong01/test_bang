package com.dimeng.modules.hospital.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.bus.FindHospitalProjectBaseReq;

public interface FindHospitalProjectService {

    /**
     * 指定医院的项目列表
     */
    public BaseDataResp findHospitalProject(FindHospitalProjectBaseReq req)
            throws Exception;
}
