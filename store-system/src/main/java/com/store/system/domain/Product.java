package com.store.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class Product extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品id */
    private Long productId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 商品分类 */
    @Excel(name = "商品分类")
    private Long categoryId;

    /** 商品标题 */
    @Excel(name = "商品标题")
    private String productTitle;

    /** 商品介绍 */
    @Excel(name = "商品介绍")
    private String productIntro;

    /** 商品照片地址 */
    @Excel(name = "商品照片地址")
    private String productPicture;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private Long productPrice;

    /** 销售价格 */
    @Excel(name = "销售价格")
    private Long productSellingPrice;

    /** 数量 */
    @Excel(name = "数量")
    private Long productNum;

    /** 销售量 */
    @Excel(name = "销售量")
    private Long productSales;

    public void setProductId(Long productId)
    {
        this.productId = productId;
    }

    public Long getProductId()
    {
        return productId;
    }
    public void setProductName(String productName)
    {
        this.productName = productName;
    }

    public String getProductName()
    {
        return productName;
    }
    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
    }
    public void setProductTitle(String productTitle)
    {
        this.productTitle = productTitle;
    }

    public String getProductTitle()
    {
        return productTitle;
    }
    public void setProductIntro(String productIntro)
    {
        this.productIntro = productIntro;
    }

    public String getProductIntro()
    {
        return productIntro;
    }
    public void setProductPicture(String productPicture)
    {
        this.productPicture = productPicture;
    }

    public String getProductPicture()
    {
        return productPicture;
    }
    public void setProductPrice(Long productPrice)
    {
        this.productPrice = productPrice;
    }

    public Long getProductPrice()
    {
        return productPrice;
    }
    public void setProductSellingPrice(Long productSellingPrice)
    {
        this.productSellingPrice = productSellingPrice;
    }

    public Long getProductSellingPrice()
    {
        return productSellingPrice;
    }
    public void setProductNum(Long productNum)
    {
        this.productNum = productNum;
    }

    public Long getProductNum()
    {
        return productNum;
    }
    public void setProductSales(Long productSales)
    {
        this.productSales = productSales;
    }

    public Long getProductSales()
    {
        return productSales;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("productName", getProductName())
            .append("categoryId", getCategoryId())
            .append("productTitle", getProductTitle())
            .append("productIntro", getProductIntro())
            .append("productPicture", getProductPicture())
            .append("productPrice", getProductPrice())
            .append("productSellingPrice", getProductSellingPrice())
            .append("productNum", getProductNum())
            .append("productSales", getProductSales())
            .toString();
    }
}
