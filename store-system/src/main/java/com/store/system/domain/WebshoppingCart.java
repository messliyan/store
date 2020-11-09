package com.store.system.domain;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class WebshoppingCart
{
    private static final long serialVersionUID = 1L;

    private Long id;


    private Long productID;


    private String productName;

    private String productImg;

    private Long price;

    private Long num;

    private Long maxNum;

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

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
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

    public WebshoppingCart(Long id, Long productID, String productName, String productImg,
        Long price, Long num, Long maxNum, Boolean check) {
        this.id = id;
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.price = price;
        this.num = num;
        this.maxNum = maxNum;
        this.check = check;
    }

    @Override
    public String toString() {
        return "WebshoppingCart{" +
            "id=" + id +
            ", productID=" + productID +
            ", productName='" + productName + '\'' +
            ", productImg='" + productImg + '\'' +
            ", price='" + price + '\'' +
            ", num=" + num +
            ", maxNum=" + maxNum +
            ", check=" + check +
            '}';
    }
}
