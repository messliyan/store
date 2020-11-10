package com.store.system.domain;

import java.util.ArrayList;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class WebOrd
{
    private  Long user_id;
    private ArrayList<WebOrders> products;

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public ArrayList<WebOrders> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<WebOrders> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "WebOrd{" +
                "user_id='" + user_id + '\'' +
                ", products=" + products +
                '}';
    }
}

