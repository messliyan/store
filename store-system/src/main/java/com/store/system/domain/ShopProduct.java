package com.store.system.domain;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class ShopProduct
{
    private static final long serialVersionUID = 1L;

    private Long productID;


    private String productName;


    private Long maxNum;

    private String check;


    private String productImg;

    private Long price;

    private Long num;



    public static long getSerialVersionUID() {
        return serialVersionUID;
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

    public Long getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(Long maxNum) {
        this.maxNum = maxNum;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
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


    public ShopProduct() {
    }

    @Override
    public String toString() {
        return "ShopProduct{" +
            "productID=" + productID +
            ", productName='" + productName + '\'' +
            ", maxNum=" + maxNum +
            ", check='" + check + '\'' +
            ", productImg='" + productImg + '\'' +
            ", price=" + price +
            ", num=" + num +
            '}';
    }

    public ShopProduct(Long productID, String productName, Long maxNum, String check,
        String productImg, Long price, Long num) {
        this.productID = productID;
        this.productName = productName;
        this.maxNum = maxNum;
        this.check = check;
        this.productImg = productImg;
        this.price = price;
        this.num = num;
    }
}
