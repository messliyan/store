package com.store.system.domain;

import java.util.Arrays;

public class A{
    String[] categoryName;
    Long productID;

    public String[] getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String[] categoryName) {
        this.categoryName = categoryName;
    }

    public A() {
    }

    public Long getProductID() {
        return productID;
    }

    public void setProductID(Long productID) {
        this.productID = productID;
    }

    public A(String[] categoryName, Long productID) {
        this.categoryName = categoryName;
        this.productID = productID;
    }
}
