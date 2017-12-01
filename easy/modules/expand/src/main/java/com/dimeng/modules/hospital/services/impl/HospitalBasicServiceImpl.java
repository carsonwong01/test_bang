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
import com.dimeng.modules.hospital.services.IHospitalBasicService;
import com.dimeng.utils.SpringBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HospitalBasicServiceImpl extends BaseServiceImpl implements IHospitalBasicService {

    @Autowired
    SpringBeanUtil springBeanUtil;

    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findHospitalList(HospitalBasicReq req) throws Exception {
        //去掉前后空格
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findAllHospital");
        event.setObj(req);
        List<FindAllHospitalResp> list = baseDao.findAllIsPageByCustom(event);

        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, list));

        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;

    }
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp getHospitalDetails(HospitalBasicReq req) throws Exception {
        //去掉前后空格
        QueryEvent<HospitalBasicReq> event = new QueryEvent<HospitalBasicReq>();
        event.setStatement("findHospitalDetails");
        event.setObj(req);
        FindAllHospitalResp findAllHospitalResp = (FindAllHospitalResp) baseDao.findOneByCustom(event);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put(CommonConstant.JSON_KEY_SINGLE_RESULT, findAllHospitalResp);

        BaseDataResp resp = new BaseDataResp();
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
        /*
        //查询附件
        TProjectAttachment projectAttachment = new TProjectAttachment();
        projectAttachment.setAssociatedId(projectDetailsResp.getId());
        projectAttachment.setType(ProjectAttachmentTypeEnum.PROJECT_IMGS.getDataBaseVal());
        List<TProjectAttachment> imgs =
            (List<TProjectAttachment>)baseDao.executeSQL(null, "getProjectAttachments", projectAttachment);
        projectDetailsResp.setImgs(imgs);
         */









