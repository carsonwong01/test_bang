package com.dimeng.entity.ext.expand;

import java.io.Serializable;

public class FindProvinceAndCityResp implements Serializable {

    private String province;
    private String city;
    private String county;
    private String provinceId;

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }
    public FindProvinceAndCityResp(){};

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }
}
