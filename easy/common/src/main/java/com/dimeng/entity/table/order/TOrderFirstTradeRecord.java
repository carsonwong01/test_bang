package com.dimeng.entity.table.order;

import java.math.BigDecimal;
import java.util.Date;

public class TOrderFirstTradeRecord {
    private String orderId;

    private String userId;

    private BigDecimal amount;

    private String type;

    private Date dateTrade;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getDateTrade() {
        return dateTrade;
    }

    public void setDateTrade(Date dateTrade) {
        this.dateTrade = dateTrade;
    }
}