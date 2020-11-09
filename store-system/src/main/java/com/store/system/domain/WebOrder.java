package com.store.system.domain;

/**
 * 商品管理对象 product
 *
 * @author store
 * @date 2020-10-27
 */
public class WebOrder
{
    private static final long serialVersionUID = 1L;

    private Long id;


    private Long order_id;


    private Long user_id;

    private Long product_id;

    private Long product_num;


    private Long product_price;

    private Long order_time;

    private String product_name;

    private String product_picture;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public Long getProduct_num() {
        return product_num;
    }

    public void setProduct_num(Long product_num) {
        this.product_num = product_num;
    }

    public Long getProduct_price() {
        return product_price;
    }

    public void setProduct_price(Long product_price) {
        this.product_price = product_price;
    }

    public Long getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Long order_time) {
        this.order_time = order_time;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_picture() {
        return product_picture;
    }

    public void setProduct_picture(String product_picture) {
        this.product_picture = product_picture;
    }

    public WebOrder(Long id, Long order_id, Long user_id, Long product_id, Long product_num,
        Long product_price, Long order_time, String product_name, String product_picture) {
        this.id = id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.product_num = product_num;
        this.product_price = product_price;
        this.order_time = order_time;
        this.product_name = product_name;
        this.product_picture = product_picture;
    }



    @Override
    public String toString() {
        return "WebOrder{" +
            "id=" + id +
            ", order_id=" + order_id +
            ", user_id=" + user_id +
            ", product_id=" + product_id +
            ", product_num=" + product_num +
            ", product_price=" + product_price +
            ", order_time=" + order_time +
            ", product_name='" + product_name + '\'' +
            ", product_picture='" + product_picture + '\'' +
            '}';
    }
}
