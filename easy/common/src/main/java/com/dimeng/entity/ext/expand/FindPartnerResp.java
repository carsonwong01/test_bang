package com.dimeng.entity.ext.expand;

import java.io.Serializable;

public class FindPartnerResp implements Serializable {

    private String partnerId;
    private String partnerName;
    private String partnerType;

    public FindPartnerResp(){}

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
