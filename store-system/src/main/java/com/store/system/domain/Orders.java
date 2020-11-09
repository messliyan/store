package com.store.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;

/**
 * 订单管理对象 orders
 *
 * @author store
 * @date 2020-11-02
 */
public class Orders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单表示符 */
    private Long id;

    /** 订单id */
    @Excel(name = "订单id")
    private Long orderId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 产品id */
    @Excel(name = "产品id")
    private Long productId;

    /** 产品数量 */
    @Excel(name = "产品数量")
    private Long productNum;

    /** 产品价格 */
    @Excel(name = "产品价格")
    private Long productPrice;

    /** 支付时间 */
    @Excel(name = "支付时间")
    private Long orderTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }

    public void setProductId(Long productId)
    {
        this.productId = productId;
    }

    public Long getProductId()
    {
        return productId;
    }
    public void setProductNum(Long productNum)
    {
        this.productNum = productNum;
    }

    public Long getProductNum()
    {
        return productNum;
    }
    public void setProductPrice(Long productPrice)
    {
        this.productPrice = productPrice;
    }

    public Long getProductPrice()
    {
        return productPrice;
    }
    public void setOrderTime(Long orderTime)
    {
        this.orderTime = orderTime;
    }

    public Long getOrderTime()
    {
        return orderTime;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Orders{" +
            "id=" + id +
            ", orderId=" + orderId +
            ", userId=" + userId +
            ", productId=" + productId +
            ", productNum=" + productNum +
            ", productPrice=" + productPrice +
            ", orderTime=" + orderTime +
            '}';
    }
}
