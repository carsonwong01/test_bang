package com.dimeng.entity.table.order;

import java.math.BigDecimal;
import java.util.Date;

public class TOrderSupport {
    private String orderId;

    private String projectId;

    private String returnId;

    private String orderNo;

    private String payType;
    
    private String paySource;

    private String payFlowNo;
    
    private Date datePay;

    private String userId;

    private BigDecimal supportAmount;

    private String status;

    private Date dateInvalid;

    private String receiveName;

    private String region;

    private String address;

    private String phone;

    private Date dateCreate;

    private String refundType;

    private Date dateRefund;
    
    private Date dateRefundFinish;

    private String refundFlowNo;

    private String refundReason;

    private String sendFlowNo;

    private String logisticsName;

    private Date dateSend;

    private Date dateReceive;

    private String remark;

    private Date datePayCheck;

    private String payCheckStatus;

    private Date dateRefundCheck;

    private String refundCheckStatus;
    
    private String supportCount;
    
    private String refundNo;
    
    private String message;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getReturnId() {
        return returnId;
    }

    public void setReturnId(String returnId) {
        this.returnId = returnId == null ? null : returnId.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType == null ? null : payType.trim();
    }

    public String getPayFlowNo() {
        return payFlowNo;
    }

    public void setPayFlowNo(String payFlowNo) {
        this.payFlowNo = payFlowNo == null ? null : payFlowNo.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public BigDecimal getSupportAmount() {
        return supportAmount;
    }

    public void setSupportAmount(BigDecimal supportAmount) {
        this.supportAmount = supportAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getDateInvalid() {
        return dateInvalid;
    }

    public void setDateInvalid(Date dateInvalid) {
        this.dateInvalid = dateInvalid;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName == null ? null : receiveName.trim();
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region == null ? null : region.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getRefundType() {
        return refundType;
    }

    public void setRefundType(String refundType) {
        this.refundType = refundType == null ? null : refundType.trim();
    }

    public Date getDateRefund() {
        return dateRefund;
    }

    public void setDateRefund(Date dateRefund) {
        this.dateRefund = dateRefund;
    }

    public String getRefundFlowNo() {
        return refundFlowNo;
    }

    public void setRefundFlowNo(String refundFlowNo) {
        this.refundFlowNo = refundFlowNo == null ? null : refundFlowNo.trim();
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundReason) {
        this.refundReason = refundReason == null ? null : refundReason.trim();
    }

    public String getSendFlowNo() {
        return sendFlowNo;
    }

    public void setSendFlowNo(String sendFlowNo) {
        this.sendFlowNo = sendFlowNo == null ? null : sendFlowNo.trim();
    }

    public String getLogisticsName() {
        return logisticsName;
    }

    public void setLogisticsName(String logisticsName) {
        this.logisticsName = logisticsName == null ? null : logisticsName.trim();
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public Date getDateReceive() {
        return dateReceive;
    }

    public void setDateReceive(Date dateReceive) {
        this.dateReceive = dateReceive;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getDatePayCheck() {
        return datePayCheck;
    }

    public void setDatePayCheck(Date datePayCheck) {
        this.datePayCheck = datePayCheck;
    }

    public String getPayCheckStatus() {
        return payCheckStatus;
    }

    public void setPayCheckStatus(String payCheckStatus) {
        this.payCheckStatus = payCheckStatus == null ? null : payCheckStatus.trim();
    }

    public Date getDateRefundCheck() {
        return dateRefundCheck;
    }

    public void setDateRefundCheck(Date dateRefundCheck) {
        this.dateRefundCheck = dateRefundCheck;
    }

    public String getRefundCheckStatus() {
        return refundCheckStatus;
    }

    public void setRefundCheckStatus(String refundCheckStatus) {
        this.refundCheckStatus = refundCheckStatus == null ? null : refundCheckStatus.trim();
    }

    public Date getDatePay()
    {
        return datePay;
    }

    public void setDatePay(Date datePay)
    {
        this.datePay = datePay;
    }

    public Date getDateRefundFinish()
    {
        return dateRefundFinish;
    }

    public void setDateRefundFinish(Date dateRefundFinish)
    {
        this.dateRefundFinish = dateRefundFinish;
    }

    public String getSupportCount()
    {
        return supportCount;
    }

    public void setSupportCount(String supportCount)
    {
        this.supportCount = supportCount;
    }

    public String getPaySource()
    {
        return paySource;
    }

    public void setPaySource(String paySource)
    {
        this.paySource = paySource;
    }

    public String getRefundNo()
    {
        return refundNo;
    }

    public void setRefundNo(String refundNo)
    {
        this.refundNo = refundNo;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }
    
    
}