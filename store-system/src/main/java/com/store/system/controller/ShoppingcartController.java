package com.store.system.controller;

import com.store.common.core.domain.StoreResult;
import com.store.system.domain.Category;
import com.store.system.domain.Collect;
import com.store.system.domain.Product;
import com.store.system.domain.WebProduct;
import com.store.system.domain.WebshoppingCart;
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
    @Autowired
    private IProductService productService;
    /**
     * 查询个人购物车列表
     */
    @PostMapping("/getShoppingCart")
    public StoreResult list(@RequestBody  Shoppingcart shoppingcart) {
        ArrayList hashMaps = new ArrayList<Category>();

        List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(shoppingcart);

        for (Shoppingcart collect1 : list) {

            Product product1 = productService.selectProductById(collect1.getProduct_id());
            hashMaps.add(new WebshoppingCart(collect1.getId(), collect1.getProduct_id(),
                product1.getProductName(),
                product1.getProductPicture(),
                product1.getProductPrice(), collect1.getNum(),
                product1.getProductNum(), false));

        }

        return StoreResult.success(" 得到购物车成功！", "shoppingCartData", hashMaps);
    }

    @PostMapping("/updateShoppingCart")
    public StoreResult updateShoppingCart(@RequestBody  Shoppingcart shoppingcart) {
        shoppingcartService.updateShoppingcart(shoppingcart);
        return StoreResult.success(" 更新购物车商品数量成功！");
    }

    @PostMapping("/deleteShoppingCart")
    public StoreResult deleteShoppingCart(@RequestBody Shoppingcart shoppingcart) {
        List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(shoppingcart);

        shoppingcartService.deleteShoppingcartById(list.get(0).getId());

        return StoreResult.success(" 删除购物车成功成功！");
    }

    @PostMapping("/addShoppingCart")
    public StoreResult addShoppingCart(@RequestBody Shoppingcart shoppingcart) {
        ArrayList hashMaps = new ArrayList<Category>();

        List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(shoppingcart);

        if ( list.size()>0) {
            list.get(0).setNum(list.get(0).getNum() + 1);
            shoppingcartService.updateShoppingcart(list.get(0));
        }
        else
        { shoppingcart.setNum(Long.valueOf(1));
            shoppingcartService.insertShoppingcart(shoppingcart);
        }

        List<Shoppingcart> list2 = shoppingcartService.selectShoppingcartList(shoppingcart);

        for (Shoppingcart collect1 : list2) {

            Product product1 = productService.selectProductById(collect1.getProduct_id());
            hashMaps.add(new WebshoppingCart(collect1.getId(), collect1.getProduct_id(),
                    product1.getProductName(),
                    product1.getProductPicture(),
                    product1.getProductPrice(), collect1.getNum(),
                    product1.getProductNum(), false));

        }

        return StoreResult.success(" 插入购物车信息成功！","shoppingCartData", hashMaps);
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
