package com.dimeng.model.expand;

public class CooPartnerReq extends FindExportExcelParamsReq {
    private String partnerId;
    private String partnerName;
    private String partnerType;

    public CooPartnerReq(){}

    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getPartnerType() {
        return partnerType;
    }

    public void setPartnerType(String partnerType) {
        this.partnerType = partnerType;
    }
}
