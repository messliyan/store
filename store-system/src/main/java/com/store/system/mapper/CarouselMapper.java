package com.store.system.mapper;

import java.util.List;
import com.store.system.domain.Carousel;

/**
 * 轮播图片管理Mapper接口
 * 
 * @author store
 * @date 2020-11-02
 */
public interface CarouselMapper 
{
    /**
     * 查询轮播图片管理
     * 
     * @param carouselId 轮播图片管理ID
     * @return 轮播图片管理
     */
    public Carousel selectCarouselById(Long carouselId);

    /**
     * 查询轮播图片管理列表
     * 
     * @param carousel 轮播图片管理
     * @return 轮播图片管理集合
     */
    public List<Carousel> selectCarouselList(Carousel carousel);

    /**
     * 新增轮播图片管理
     * 
     * @param carousel 轮播图片管理
     * @return 结果
     */
    public int insertCarousel(Carousel carousel);

    /**
     * 修改轮播图片管理
     * 
     * @param carousel 轮播图片管理
     * @return 结果
     */
    public int updateCarousel(Carousel carousel);

    /**
     * 删除轮播图片管理
     * 
     * @param carouselId 轮播图片管理ID
     * @return 结果
     */
    public int deleteCarouselById(Long carouselId);

    /**
     * 批量删除轮播图片管理
     * 
     * @param carouselIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCarouselByIds(Long[] carouselIds);
}
