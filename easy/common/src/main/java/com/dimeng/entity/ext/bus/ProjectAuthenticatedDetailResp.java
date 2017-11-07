package com.dimeng.entity.ext.bus;

import java.io.Serializable;
import java.util.List;

/**
 * 返回项目认证详细信息
 * <功能详细描述>
 * 
 * @author  wenguanhai
 * @version  [版本号, 2016年9月30日]
 */
public class ProjectAuthenticatedDetailResp implements Serializable
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8343862878301039365L;
    /**
     * 验证ID
     */
    private String id;
    /**
     * 项目标题
     */
    private String title;
    /**
     * 项目类型
     */
    private String projecType;
    /**
     * 验证类型
     */
    private String type;
    /**
     * 真实姓名
     */
    private String realName;
    /**
     * 身份证号码
     */
    private String idcard;
    /**
     * 联系电话
     */
    private String phone;
    /**
     * 身份证图片URL
     */
    private String identityPhtoUrl;
    /**
     * 受助人真实姓名
     */
    private String behelpRealName;
    /**
     * 受助人身份证号码
     */
    private String behelpIdcard;
    /**
     * 受助人身份证图片URL
     */
    private String behelpIdentityPhtoUrl;
    /**
     * 组织机构名称
     */
    private String orgName;
    /**
     * 组织机构联系电话
     */
    private String orgPhone;
    /**
     * 组织机构资质证明图片URL
     */
    private String credentialsPhtoUrl;
    /**
     * 户口本照片图片URL集合
     */
    private List<String> accountBookPhtoUrls;
    /**
     * 结婚证图片URL
     */
    private String marrCertificatePhtoUrls;
    /**
     * 所属疾病
     */
    private String disease;
    /**
     * 医院地址
     */
    private String hospitalAddr;
    /**
     * 医院名称
     */
    private String hospitalName;
    /**
     * 医疗诊断证明图片URL集合
     */
    private List<String> proveImgUrls;
    /**
     * 资金用途证明图片URL集合
     */
    private List<String> useProveImgUrls;
    /**
     * 营业执照图片
     */
    private String licenseImgUrl;
    /**
     * 项目相关证明图片URL集合
     */
    private List<String> projectProveImgs;
    /**
     * 验证审核状态
     */
    private String status;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getProjecType()
    {
        return projecType;
    }

    public void setProjecType(String projecType)
    {
        this.projecType = projecType;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getRealName()
    {
        return realName;
    }

    public void setRealName(String realName)
    {
        this.realName = realName;
    }

    public String getIdcard()
    {
        return idcard;
    }

    public void setIdcard(String idcard)
    {
        this.idcard = idcard;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getIdentityPhtoUrl()
    {
        return identityPhtoUrl;
    }

    public void setIdentityPhtoUrl(String identityPhtoUrl)
    {
        this.identityPhtoUrl = identityPhtoUrl;
    }

    public String getBehelpRealName()
    {
        return behelpRealName;
    }

    public void setBehelpRealName(String behelpRealName)
    {
        this.behelpRealName = behelpRealName;
    }

    public String getBehelpIdcard()
    {
        return behelpIdcard;
    }

    public void setBehelpIdcard(String behelpIdcard)
    {
        this.behelpIdcard = behelpIdcard;
    }

    public String getBehelpIdentityPhtoUrl()
    {
        return behelpIdentityPhtoUrl;
    }

    public void setBehelpIdentityPhtoUrl(String behelpIdentityPhtoUrl)
    {
        this.behelpIdentityPhtoUrl = behelpIdentityPhtoUrl;
    }

    public String getOrgName()
    {
        return orgName;
    }

    public void setOrgName(String orgName)
    {
        this.orgName = orgName;
    }

    public String getOrgPhone()
    {
        return orgPhone;
    }

    public void setOrgPhone(String orgPhone)
    {
        this.orgPhone = orgPhone;
    }

    public String getCredentialsPhtoUrl()
    {
        return credentialsPhtoUrl;
    }

    public void setCredentialsPhtoUrl(String credentialsPhtoUrl)
    {
        this.credentialsPhtoUrl = credentialsPhtoUrl;
    }

    public List<String> getAccountBookPhtoUrls()
    {
        return accountBookPhtoUrls;
    }

    public void setAccountBookPhtoUrls(List<String> accountBookPhtoUrls)
    {
        this.accountBookPhtoUrls = accountBookPhtoUrls;
    }

    public String getMarrCertificatePhtoUrls()
    {
        return marrCertificatePhtoUrls;
    }

    public void setMarrCertificatePhtoUrls(String marrCertificatePhtoUrls)
    {
        this.marrCertificatePhtoUrls = marrCertificatePhtoUrls;
    }

    public String getDisease()
    {
        return disease;
    }

    public void setDisease(String disease)
    {
        this.disease = disease;
    }

    public String getHospitalAddr()
    {
        return hospitalAddr;
    }

    public void setHospitalAddr(String hospitalAddr)
    {
        this.hospitalAddr = hospitalAddr;
    }

    public String getHospitalName()
    {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName)
    {
        this.hospitalName = hospitalName;
    }

    public List<String> getProveImgUrls()
    {
        return proveImgUrls;
    }

    public void setProveImgUrls(List<String> proveImgUrls)
    {
        this.proveImgUrls = proveImgUrls;
    }

    public List<String> getUseProveImgUrls()
    {
        return useProveImgUrls;
    }

    public void setUseProveImgUrls(List<String> useProveImgUrls)
    {
        this.useProveImgUrls = useProveImgUrls;
    }

    public String getLicenseImgUrl()
    {
        return licenseImgUrl;
    }

    public void setLicenseImgUrl(String licenseImgUrl)
    {
        this.licenseImgUrl = licenseImgUrl;
    }

    public List<String> getProjectProveImgs()
    {
        return projectProveImgs;
    }

    public void setProjectProveImgs(List<String> projectProveImgs)
    {
        this.projectProveImgs = projectProveImgs;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
    
}
