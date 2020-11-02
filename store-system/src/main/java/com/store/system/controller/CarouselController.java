package com.store.system.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.store.common.annotation.Log;
import com.store.common.core.controller.BaseController;
import com.store.common.core.domain.AjaxResult;
import com.store.common.enums.BusinessType;
import com.store.system.domain.Carousel;
import com.store.system.service.ICarouselService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 轮播图片管理Controller
 *
 * @author store
 * @date 2020-11-02
 */
@RestController
@RequestMapping("/system/carousel")
public class CarouselController extends BaseController
{
    @Autowired
    private ICarouselService carouselService;

    /**
     * 查询轮播图片管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:list')")
    @GetMapping("/list")
    public TableDataInfo list(Carousel carousel)
    {
        startPage();
        List<Carousel> list = carouselService.selectCarouselList(carousel);
        return getDataTable(list);
    }

    /**
     * 导出轮播图片管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:export')")
    @Log(title = "轮播图片管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Carousel carousel)
    {
        List<Carousel> list = carouselService.selectCarouselList(carousel);
        ExcelUtil<Carousel> util = new ExcelUtil<Carousel>(Carousel.class);
        return util.exportExcel(list, "carousel");
    }

    /**
     * 获取轮播图片管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:query')")
    @GetMapping(value = "/{carouselId}")
    public AjaxResult getInfo(@PathVariable("carouselId") Long carouselId)
    {
        return AjaxResult.success(carouselService.selectCarouselById(carouselId));
    }

    /**
     * 新增轮播图片管理
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:add')")
    @Log(title = "轮播图片管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Carousel carousel)
    {
        return toAjax(carouselService.insertCarousel(carousel));
    }

    /**
     * 修改轮播图片管理
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:edit')")
    @Log(title = "轮播图片管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Carousel carousel)
    {
        return toAjax(carouselService.updateCarousel(carousel));
    }

    /**
     * 删除轮播图片管理
     */
    @PreAuthorize("@ss.hasPermi('system:carousel:remove')")
    @Log(title = "轮播图片管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carouselIds}")
    public AjaxResult remove(@PathVariable Long[] carouselIds)
    {
        return toAjax(carouselService.deleteCarouselByIds(carouselIds));
    }
}
