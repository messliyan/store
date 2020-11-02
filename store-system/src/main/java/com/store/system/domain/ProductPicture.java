package com.store.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;

/**
 * 产品详细管理对象 product_picture
 *
 * @author store
 * @date 2020-11-02
 */
public class ProductPicture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产品详细唯一标识 */
    private Long id;

    /** 产品唯一标识 */
    @Excel(name = "产品唯一标识")
    private Long productId;

    /** 产品详细图片 */
    @Excel(name = "产品详细图片")
    private String productPicture;

    /** 产品描述 */
    @Excel(name = "产品描述")
    private String intro;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setProductId(Long productId)
    {
        this.productId = productId;
    }

    public Long getProductId()
    {
        return productId;
    }
    public void setProductPicture(String productPicture)
    {
        this.productPicture = productPicture;
    }

    public String getProductPicture()
    {
        return productPicture;
    }
    public void setIntro(String intro)
    {
        this.intro = intro;
    }

    public String getIntro()
    {
        return intro;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("productId", getProductId())
            .append("productPicture", getProductPicture())
            .append("intro", getIntro())
            .toString();
    }
}
