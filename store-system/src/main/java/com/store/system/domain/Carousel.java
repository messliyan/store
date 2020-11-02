package com.store.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;

/**
 * 轮播图片管理对象 carousel
 *
 * @author store
 * @date 2020-11-02
 */
public class Carousel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 轮播图片地址 */
    private Long carouselId;

    /** 轮播图片路径 */
    @Excel(name = "轮播图片路径")
    private String imgpath;

    /** 轮播图片秒速 */
    @Excel(name = "轮播图片秒速")
    private String describes;

    public void setCarouselId(Long carouselId)
    {
        this.carouselId = carouselId;
    }

    public Long getCarouselId()
    {
        return carouselId;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("carouselId", getCarouselId())
            .append("imgpath", getImgpath())
            .append("describes", getDescribes())
            .toString();
    }
}
