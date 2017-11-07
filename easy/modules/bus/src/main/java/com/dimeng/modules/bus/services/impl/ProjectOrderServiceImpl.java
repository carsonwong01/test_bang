/*
 * 文 件 名:  ProjectOrderServiceImpl.java
 * 版    权:  深圳市迪蒙网络科技有限公司
 * 描    述:  <描述>
 * 修 改 人:  huangjinbing
 * 修改时间:  2016年10月14日
 */
package com.dimeng.modules.bus.services.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dimeng.constants.CommonConstant;
import com.dimeng.constants.IDiMengResultCode;
import com.dimeng.entity.ext.bus.FindSupportListResp;
import com.dimeng.entity.ext.user.FrontUserInfo;
import com.dimeng.entity.table.order.TOrderSupport;
import com.dimeng.entity.table.project.TProjectInfo;
import com.dimeng.enums.ProjectStatusEnum;
import com.dimeng.enums.QOrderStatusEnum;
import com.dimeng.framework.constants.DigitalAndStringConstant;
import com.dimeng.framework.domain.BaseDataResp;
import com.dimeng.framework.exception.ServicesException;
import com.dimeng.framework.mybatis.utils.QueryEvent;
import com.dimeng.framework.mybatis.utils.page.PageContext;
import com.dimeng.framework.mybatis.utils.page.PageResult;
import com.dimeng.framework.utils.StringUtil;
import com.dimeng.model.bus.FindSupportListReq;
import com.dimeng.model.bus.FindUserSupportListReq;
import com.dimeng.model.bus.UpdateOrderSupportReq;
import com.dimeng.model.common.IdReq;
import com.dimeng.modules.bus.services.IProjectOrderService;
import com.dimeng.modules.bus.services.impl.base.UserCapitalCommonService;
import com.dimeng.utils.ExportUtil;
import com.dimeng.utils.LoginCache;

/**
 * 用户订单管理接口实现
 * <功能详细描述>
 * 
 * @author  huangjinbing
 * @version  [版本号, 2016年10月14日]
 */
@Service
public class ProjectOrderServiceImpl extends UserCapitalCommonService implements IProjectOrderService
{
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp findSupportList(FindSupportListReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindSupportListReq> event = new QueryEvent<FindSupportListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(StringUtil.isEmpty(req.getExportPath()) ? true : false);
        //列表
        event.setStatement("findSupportList");
        event.setObj(req);
        List<FindSupportListResp> findSupportList = baseDao.findAllIsPageByCustom(event);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, findSupportList));
        
        /**
         * 导出
         */
        if (!StringUtil.isEmpty(req.getExportPath()))
        {
            Map<String, String> enumsValue = new HashMap<String, String>();
            enumsValue.put("status", "com.dimeng.enums.QOrderStatusEnum");
            req.setEnumsValue(enumsValue);
            ExportUtil.export(req, findSupportList);
        }
        
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getType()))
        {
            //总计
            event.setStatement("findSupportListCount");
            event.setObj(req);
            data.put(CommonConstant.JSON_KEY_STAT_RESULT, baseDao.findOneByCustom(event));
        }
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp updateOrderSupport(UpdateOrderSupportReq req)
        throws Exception
    {
        TOrderSupport orderSupport = new TOrderSupport();
        orderSupport.setOrderId(req.getOrderId());
        orderSupport = (TOrderSupport)baseDao.findById(orderSupport);
        //订单是否存在
        if (null == orderSupport || !QOrderStatusEnum.DFH.getDataBaseVal().equals(orderSupport.getStatus()))
        {
            logs.info("###订单不存在###");
            throw new ServicesException(IDiMengResultCode.Finance.ORDER_NOT_EXIST);
        }
        TProjectInfo projectInfo = new TProjectInfo();
        projectInfo.setProjectId(orderSupport.getProjectId());
        projectInfo = (TProjectInfo)baseDao.findById(projectInfo);
        if (projectInfo == null)
        {
            throw new ServicesException(IDiMengResultCode.Finance.PROJECT_NOT_EXIST);
        }
        if (!projectInfo.getProjectCreatorId().equals(req.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        //发物流
        if (DigitalAndStringConstant.StringConstant.ONE.equals(req.getIsLogistics()))
        {
            orderSupport.setSendFlowNo(req.getCourierNumber());
            orderSupport.setLogisticsName(req.getCourierCompany());
        }
        orderSupport.setDateSend(new Date());
        //设置订单状态为待收货
        orderSupport.setStatus(QOrderStatusEnum.DSH.getDataBaseVal());
        if (baseDao.update(orderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            logs.info("###用户发货错误###");
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE_ODER);
        }
        
        //判断是否已经全部发货，如果已经全部发货且项目成功并且项目验证通过就解冻冻结金额
        if (ProjectStatusEnum.ZCCG.getDataBaseVal().equals(projectInfo.getProjectStatus())
            && isAllOrderSend(projectInfo.getProjectId()) && isValidProject(projectInfo.getProjectId()))
        {
            FrontUserInfo userInfo = LoginCache.getFrontUserInfo();
            updateAvailableAndFrozenAmount(userInfo.getUserId(),
                projectInfo.getProjectId(),
                projectInfo.getRaisedAmount());
        }
        
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    /** {@inheritDoc} */
    
    @Override
    public BaseDataResp findUserSupportList(FindUserSupportListReq req)
        throws Exception
    {
        BaseDataResp resp = new BaseDataResp();
        Map<String, Object> data = new HashMap<String, Object>();
        QueryEvent<FindUserSupportListReq> event = new QueryEvent<FindUserSupportListReq>();
        //分页属性
        PageContext page = PageContext.getContext();
        page.setCurrentPage(req.getReqPageNum());
        page.setPageSize(req.getMaxResults());
        //分页开关，一定要设置成true，才会分页
        page.setPagination(true);
        event.setStatement("findUserSupportList");
        event.setObj(req);
        data.put(CommonConstant.JSON_KEY_PAGERESULT, new PageResult(page, baseDao.findAllIsPageByCustom(event)));
        resp.setData(data);
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonCancelOrder(IdReq req)
        throws ServicesException
    {
        TOrderSupport tOrderSupport = new TOrderSupport();
        tOrderSupport.setOrderId(req.getId());
        tOrderSupport = (TOrderSupport)baseDao.findById(tOrderSupport);
        if (tOrderSupport == null)
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_NO_DATA_BY_ID);
        }
        if (!tOrderSupport.getUserId().equals(req.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        if (!QOrderStatusEnum.DZF.dataBaseVal.equals(tOrderSupport.getStatus()))
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        tOrderSupport = new TOrderSupport();
        tOrderSupport.setOrderId(req.getId());
        tOrderSupport.setStatus(QOrderStatusEnum.YQX.dataBaseVal);
        //更新订单状态
        if (baseDao.update(tOrderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public BaseDataResp commonConfirmReceipt(IdReq req)
        throws ServicesException
    {
        TOrderSupport tOrderSupport = new TOrderSupport();
        tOrderSupport.setOrderId(req.getId());
        tOrderSupport = (TOrderSupport)baseDao.findById(tOrderSupport);
        if (tOrderSupport == null)
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_NO_DATA_BY_ID);
        }
        if (!tOrderSupport.getUserId().equals(req.getUserId()))
        {
            throw new ServicesException(IDiMengResultCode.UserManager.ERROR_USERNAME_NO_PERMISSION);
        }
        if (!QOrderStatusEnum.DSH.dataBaseVal.equals(tOrderSupport.getStatus()))
        {
            throw new ServicesException(IDiMengResultCode.OrderManager.ERROR_ORDER_OP_FAIL);
        }
        tOrderSupport = new TOrderSupport();
        tOrderSupport.setOrderId(req.getId());
        tOrderSupport.setStatus(QOrderStatusEnum.YSH.dataBaseVal);
        //更新订单状态
        if (baseDao.update(tOrderSupport) < DigitalAndStringConstant.DigitalConstant.DATABASE_OP_SUCCESS_INT)
        {
            throw new ServicesException(IDiMengResultCode.DataManage.ERROR_UPDATE);
        }
        BaseDataResp resp = new BaseDataResp();
        resp.setCode(IDiMengResultCode.Commons.SUCCESS);
        return resp;
    }
}
