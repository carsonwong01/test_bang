package com.dimeng.entity.table.user;

import java.util.Date;

public class TQUserBankCard {
    private String id;

    private String userId;

    private String cardUserName;

    private String cardNumberEncrypt;

    private String cardNumber;

    private String cardType;

    private String cardStatus;

    private String bankId;

    private Date dateCreate;

    private String bankRegionId;

    private String branchBank;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getCardUserName() {
        return cardUserName;
    }

    public void setCardUserName(String cardUserName) {
        this.cardUserName = cardUserName == null ? null : cardUserName.trim();
    }

    public String getCardNumberEncrypt() {
        return cardNumberEncrypt;
    }

    public void setCardNumberEncrypt(String cardNumberEncrypt) {
        this.cardNumberEncrypt = cardNumberEncrypt == null ? null : cardNumberEncrypt.trim();
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber == null ? null : cardNumber.trim();
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType == null ? null : cardType.trim();
    }

    public String getCardStatus() {
        return cardStatus;
    }

    public void setCardStatus(String cardStatus) {
        this.cardStatus = cardStatus == null ? null : cardStatus.trim();
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId == null ? null : bankId.trim();
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getBankRegionId() {
        return bankRegionId;
    }

    public void setBankRegionId(String bankRegionId) {
        this.bankRegionId = bankRegionId == null ? null : bankRegionId.trim();
    }

    public String getBranchBank() {
        return branchBank;
    }

    public void setBranchBank(String branchBank) {
        this.branchBank = branchBank == null ? null : branchBank.trim();
    }
}