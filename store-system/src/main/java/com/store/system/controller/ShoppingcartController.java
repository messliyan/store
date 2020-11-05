package com.store.system.controller;

import com.store.common.core.domain.StoreResult;
import com.store.system.domain.Category;
import com.store.system.domain.Collect;
import com.store.system.domain.Product;
import com.store.system.domain.WebProduct;
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
import com.store.system.domain.Shoppingcart;
import com.store.system.service.IShoppingcartService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 个人购物车Controller
 *
 * @author store
 * @date 2020-11-05
 */
@RestController
@RequestMapping("/user/shoppingCart")
public class ShoppingcartController extends BaseController
{
    @Autowired
    private IShoppingcartService shoppingcartService;

    /**
     * 查询个人购物车列表
     */
    @GetMapping("/getShoppingCart")
    public StoreResult list(Shoppingcart shoppingcart) {
        ArrayList hashMaps = new ArrayList<Category>();

        List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(shoppingcart);

//        for (Shoppingcart collect1 : list) {
//
//            Product product1 = productService.selectProductById(collect1.getProduct_id());
//            hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(),
//                product1.getCategoryId(),
//                product1.getProductTitle(), product1.getProductIntro(),
//                product1.getProductPicture(),
//                product1.getProductPrice(), product1.getProductSellingPrice(),
//                product1.getProductNum(), product1.getProductSales()));
//
//        }

        return StoreResult.success(" 获取用户的所有收藏商品信息成功！", "collectList", hashMaps);
    }
    /**
     * 导出个人购物车列表
     */
    @PreAuthorize("@ss.hasPermi('system:shoppingcart:export')")
    @Log(title = "个人购物车", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Shoppingcart shoppingcart)
    {
        List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(shoppingcart);
        ExcelUtil<Shoppingcart> util = new ExcelUtil<Shoppingcart>(Shoppingcart.class);
        return util.exportExcel(list, "shoppingcart");
    }

    /**
     * 获取个人购物车详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:shoppingcart:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(shoppingcartService.selectShoppingcartById(id));
    }

    /**
     * 新增个人购物车
     */
    @PreAuthorize("@ss.hasPermi('system:shoppingcart:add')")
    @Log(title = "个人购物车", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Shoppingcart shoppingcart)
    {
        return toAjax(shoppingcartService.insertShoppingcart(shoppingcart));
    }

    /**
     * 修改个人购物车
     */
    @PreAuthorize("@ss.hasPermi('system:shoppingcart:edit')")
    @Log(title = "个人购物车", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Shoppingcart shoppingcart)
    {
        return toAjax(shoppingcartService.updateShoppingcart(shoppingcart));
    }

    /**
     * 删除个人购物车
     */
    @PreAuthorize("@ss.hasPermi('system:shoppingcart:remove')")
    @Log(title = "个人购物车", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shoppingcartService.deleteShoppingcartByIds(ids));
    }
}
