package com.store.system.domain;

import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 轮播图片管理对象 carousel
 *
 * @author store
 * @date 2020-11-02
 */
public class WebCarousel
{
    private static final long serialVersionUID = 1L;

    /** 轮播图片地址 */
    private Long carousel_id;

    /** 轮播图片路径 */
    @Excel(name = "轮播图片路径")
    private String imgpath;

    /** 轮播图片秒速 */
    @Excel(name = "轮播图片秒速")
    private String describes;

    public void setCarousel_id(Long carousel_id)
    {
        this.carousel_id = carousel_id;
    }

    public Long getCarousel_id()
    {
        return carousel_id;
    }
    public void setImgpath(String imgpath)
    {
        this.imgpath = imgpath;
    }

    public String getImgpath()
    {
        return imgpath;
    }
    public void setDescribes(String describes)
    {
        this.describes = describes;
    }

    public String getDescribes()
    {
        return describes;
    }

    public WebCarousel(Long carousel_id, String imgpath, String describes) {
        this.carousel_id = carousel_id;
        this.imgpath = imgpath;
        this.describes = describes;
    }

    @Override
    public String toString() {
        return "WebCarousel{" +
            "carousel_id=" + carousel_id +
            ", imgpath='" + imgpath + '\'' +
            ", describes='" + describes + '\'' +
            '}';
    }
}
