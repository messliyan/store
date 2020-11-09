package com.store.system.controller;

import com.store.common.core.domain.StoreResult;
import com.store.system.domain.Category;
import com.store.system.domain.Product;
import com.store.system.domain.WebProduct;
import com.store.system.service.IProductService;
import java.util.ArrayList;
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
import com.store.system.domain.Collect;
import com.store.system.service.ICollectService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 个人收藏Controller
 *
 * @author store
 * @date 2020-11-05
 */
@RestController
@RequestMapping("/user/collect")
public class CollectController extends BaseController
{
    @Autowired
    private ICollectService collectService;
    @Autowired
    private IProductService productService;

    /**
     * 查询个人收藏列表
     */
    @PostMapping("/getCollect")
    public StoreResult list(Collect collect){
        ArrayList hashMaps=new ArrayList<Category>();

        List<Collect> list = collectService.selectCollectList(collect);

        for (Collect collect1 : list) {

            Product product1 = productService.selectProductById(collect1.getProduct_id());
            hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
                product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
                product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));
        }


        return StoreResult.success(" 获取用户的所有收藏商品信息成功！","collectList",hashMaps);
    }

    /**
     * 导出个人收藏列表
     */
    @PreAuthorize("@ss.hasPermi('system:collect:export')")
    @Log(title = "个人收藏", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Collect collect)
    {
        List<Collect> list = collectService.selectCollectList(collect);
        ExcelUtil<Collect> util = new ExcelUtil<Collect>(Collect.class);
        return util.exportExcel(list, "collect");
    }

    /**
     * 获取个人收藏详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(collectService.selectCollectById(id));
    }

    /**
     * 新增个人收藏
     */
    @PostMapping(value = "/addCollect")
    public StoreResult add(@RequestBody Collect collect)
    {
        collect.setCollectTime(Long.valueOf(System.currentTimeMillis()));
        collectService.insertCollect(collect);
        return StoreResult.success("添加收藏成功");
    }

    /**
     * 修改个人收藏
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Collect collect)
    {
        return toAjax(collectService.updateCollect(collect));
    }

    /**
     * 删除个人收藏
     */
	@PostMapping("/deleteCollect")
    public StoreResult remove(@RequestBody  Collect collect)
    {
        List<Collect> list = collectService.selectCollectList(collect);
        collectService.deleteCollectByIds(new Long[]{list.get(0).getId()});
        return StoreResult.success("删除收藏成功!");
    }
}
