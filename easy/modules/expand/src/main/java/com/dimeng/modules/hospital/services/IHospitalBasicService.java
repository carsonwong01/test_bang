package com.dimeng.modules.hospital.services;

import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.model.expand.HospitalBasicReq;

public interface IHospitalBasicService {

    /**
     * 查询医院列表
     */
    BaseDataResp findHospitalList(HospitalBasicReq req)
            throws Exception;

    /**
     * 查询医院详细信息
     */
    BaseDataResp getHospitalDetails(HospitalBasicReq req)
            throws Exception;
    /**
     * 弹窗显示医院联系方式
     */
    BaseDataResp getLinkMethod(HospitalBasicReq req)
            throws Exception;
}
