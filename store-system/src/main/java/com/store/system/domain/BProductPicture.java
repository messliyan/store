package com.store.system.domain;

import com.store.common.annotation.Excel;
import java.util.Arrays;

public class BProductPicture {
    /** 产品详细唯一标识 */
    private Long id;

    /** 产品唯一标识 */
    private Long product_id;

    /** 产品详细图片 */
    private String product_picture;

    /** 产品描述 */
    private String intro;

    public BProductPicture(Long id, Long product_id, String product_picture, String intro) {
        this.id = id;
        this.product_id = product_id;
        this.product_picture = product_picture;
        this.intro = intro;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public String getProduct_picture() {
        return product_picture;
    }

    public void setProduct_picture(String product_picture) {
        this.product_picture = product_picture;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    @Override
    public String toString() {
        return "BProductPicture{" +
            "id=" + id +
            ", product_id=" + product_id +
            ", product_picture='" + product_picture + '\'' +
            ", intro='" + intro + '\'' +
            '}';
    }
}
