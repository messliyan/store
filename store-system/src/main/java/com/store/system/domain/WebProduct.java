package com.store.system.domain;

import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class WebProduct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long product_id;


    private String product_name;


    private Long category_id;

    private String product_title;

    private String product_intro;

    private String product_picture;

    private Long product_price;

    private Long product_selling_price;

    private Long product_num;

    private Long product_sales;

    private String categoryName;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Long getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Long category_id) {
        this.category_id = category_id;
    }

    public String getProduct_title() {
        return product_title;
    }

    public void setProduct_title(String product_title) {
        this.product_title = product_title;
    }

    public String getProduct_intro() {
        return product_intro;
    }

    public void setProduct_intro(String product_intro) {
        this.product_intro = product_intro;
    }

    public String getProduct_picture() {
        return product_picture;
    }

    public void setProduct_picture(String product_picture) {
        this.product_picture = product_picture;
    }

    public Long getProduct_price() {
        return product_price;
    }

    public void setProduct_price(Long product_price) {
        this.product_price = product_price;
    }

    public Long getProduct_selling_price() {
        return product_selling_price;
    }

    public void setProduct_selling_price(Long product_selling_price) {
        this.product_selling_price = product_selling_price;
    }

    public Long getProduct_num() {
        return product_num;
    }

    public void setProduct_num(Long product_num) {
        this.product_num = product_num;
    }

    public Long getProduct_sales() {
        return product_sales;
    }

    public void setProduct_sales(Long product_sales) {
        this.product_sales = product_sales;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public WebProduct() {
    }

    public WebProduct(Long product_id, String product_name, Long category_id,
        String product_title, String product_intro, String product_picture,
        Long product_price, Long product_selling_price, Long product_num,Long product_sales) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.category_id = category_id;
        this.product_title = product_title;
        this.product_intro = product_intro;
        this.product_picture = product_picture;
        this.product_price = product_price;
        this.product_selling_price = product_selling_price;
        this.product_num = product_num;
        this.product_sales = product_sales;
    }

    @Override
    public String toString() {
        return "WebProduct{" +
            "product_id=" + product_id +
            ", product_name='" + product_name + '\'' +
            ", category_id=" + category_id +
            ", product_title='" + product_title + '\'' +
            ", product_intro='" + product_intro + '\'' +
            ", product_picture='" + product_picture + '\'' +
            ", product_price=" + product_price +
            ", product_selling_price=" + product_selling_price +
            ", productNum=" + product_num +
            ", product_num=" + product_sales +
            ", categoryName='" + categoryName + '\'' +
            '}';
    }
}
