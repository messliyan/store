package com.store.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;

/**
 * 个人收藏对象 collect
 *
 * @author store
 * @date 2020-11-05
 */
public class Collect extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 标识符 */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long user_id;

    /** 产品id */
    @Excel(name = "产品id")
    private Long product_id;

    /** 收藏时间 */
    @Excel(name = "收藏时间")
    private Long collectTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUser_id(Long user_id)
    {
        this.user_id = user_id;
    }

    public Long getUser_id()
    {
        return user_id;
    }
    public void setProduct_id(Long product_id)
    {
        this.product_id = product_id;
    }

    public Long getProduct_id()
    {
        return product_id;
    }
    public void setCollectTime(Long collectTime)
    {
        this.collectTime = collectTime;
    }

    public Long getCollectTime()
    {
        return collectTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUser_id())
            .append("productId", getProduct_id())
            .append("collectTime", getCollectTime())
            .toString();
    }
}
