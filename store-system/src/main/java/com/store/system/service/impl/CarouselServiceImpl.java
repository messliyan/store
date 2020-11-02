package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.CarouselMapper;
import com.store.system.domain.Carousel;
import com.store.system.service.ICarouselService;

/**
 * 轮播图片管理Service业务层处理
 *
 * @author store
 * @date 2020-11-02
 */
@Service
public class CarouselServiceImpl implements ICarouselService
{
    @Autowired
    private CarouselMapper carouselMapper;

    /**
     * 查询轮播图片管理
     *
     * @param carouselId 轮播图片管理ID
     * @return 轮播图片管理
     */
    @Override
    public Carousel selectCarouselById(Long carouselId)
    {
        return carouselMapper.selectCarouselById(carouselId);
    }

    /**
     * 查询轮播图片管理列表
     *
     * @param carousel 轮播图片管理
     * @return 轮播图片管理
     */
    @Override
    public List<Carousel> selectCarouselList(Carousel carousel)
    {
        return carouselMapper.selectCarouselList(carousel);
    }

    /**
     * 新增轮播图片管理
     *
     * @param carousel 轮播图片管理
     * @return 结果
     */
    @Override
    public int insertCarousel(Carousel carousel)
    {
        return carouselMapper.insertCarousel(carousel);
    }

    /**
     * 修改轮播图片管理
     *
     * @param carousel 轮播图片管理
     * @return 结果
     */
    @Override
    public int updateCarousel(Carousel carousel)
    {
        return carouselMapper.updateCarousel(carousel);
    }

    /**
     * 批量删除轮播图片管理
     *
     * @param carouselIds 需要删除的轮播图片管理ID
     * @return 结果
     */
    @Override
    public int deleteCarouselByIds(Long[] carouselIds)
    {
        return carouselMapper.deleteCarouselByIds(carouselIds);
    }

    /**
     * 删除轮播图片管理信息
     *
     * @param carouselId 轮播图片管理ID
     * @return 结果
     */
    @Override
    public int deleteCarouselById(Long carouselId)
    {
        return carouselMapper.deleteCarouselById(carouselId);
    }
}
