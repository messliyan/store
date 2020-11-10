package com.store.system.domain;

import com.store.common.core.domain.BaseEntity;

/**
 * 订单管理对象 orders
 *
 * @author store
 * @date 2020-11-02
 */
public class WebOrders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单表示符 */
    private Long id;

    /** 订单id */
    private Long orderId;

    /** 用户id */
    private String productImg;

    /** 产品id */
    private Long productID;

    /** 产品数量 */
    private String productName;

    /** 产品价格 */
    private Long price;

    /** 支付时间 */
    private Long num;
    private Long  maxNum;
    private Boolean check;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public Long getProductID() {
        return productID;
    }

    public void setProductID(Long productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Long getNum() {
        return num;
    }

    public void setNum(Long num) {
        this.num = num;
    }

    public Long getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(Long maxNum) {
        this.maxNum = maxNum;
    }

    public Boolean getCheck() {
        return check;
    }

    public void setCheck(Boolean check) {
        this.check = check;
    }

    @Override
    public String toString() {
        return "WebOrders{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", productImg='" + productImg + '\'' +
                ", productId=" + productID +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", maxNum=" + maxNum +
                ", check=" + check +
                '}';
    }
}
