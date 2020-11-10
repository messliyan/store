package com.store.system.controller;

import com.store.common.core.domain.StoreResult;
import com.store.system.domain.*;
import com.store.system.service.IProductService;
import java.util.ArrayList;
import java.util.List;

import com.store.system.service.IShoppingcartService;
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
import com.store.system.service.IOrdersService;
import com.store.common.utils.poi.ExcelUtil;

/**
 * 订单管理Controller
 *
 * @author store
 * @date 2020-11-02
 */
@RestController
@RequestMapping("user/order")
public class OrdersController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private IProductService productService;

    @Autowired
    private IShoppingcartService shoppingcartService;
    /**
     *获取用户的所有订单信息
     */
    @PostMapping("/getOrder")
    public StoreResult list(Orders orders) {
        ArrayList hashMaps2 = new ArrayList<WebOrder>();

        List<Orders> list = ordersService.selectOrdersList(orders);

        for (Orders orders1 : list) {
            ArrayList hashMaps = new ArrayList<WebOrder>();
            Product product1 = productService.selectProductById(orders1.getProductId());
            hashMaps.add(new WebOrder(orders1.getId(), orders1.getOrderId(),orders1.getUserId(),
                    orders1.getProductId(),
                    orders1.getProductNum(),
                    orders1.getProductPrice(), orders1.getOrderTime(),
                product1.getProductName(),
                product1.getProductPicture()));
            hashMaps2.add(hashMaps);
        }
        return StoreResult.success(" 获取用户的所有订单信息成功！", "orders", hashMaps2);
    }

    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:orders:export')")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        return util.exportExcel(list, "orders");
    }

    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:orders:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(ordersService.selectOrdersById(id));
    }

    /**
     * 新增订单管理
     */
  @PostMapping("/addOrder")
    public StoreResult addShoppingCart( @RequestBody WebOrd webOrd) {


        for (WebOrders orders:
                webOrd.getProducts()) {
            ordersService.insertOrders(new Orders(){{
                setOrderId(orders.getProductID()+orders.getId()+System.currentTimeMillis());
                setOrderTime(System.currentTimeMillis());
                setProductId(orders.getProductID());
                setProductNum(orders.getNum());
                setProductPrice(orders.getPrice());
                setUserId(webOrd.getUser_id());
            }});

            List<Shoppingcart> list = shoppingcartService.selectShoppingcartList(
                    new Shoppingcart(){{
                        setProduct_id(orders.getProductID());
                        setUser_id(webOrd.getUser_id());
                    }}
            );
            shoppingcartService.deleteShoppingcartById(list.get(0).getId());
        }




        return StoreResult.success(" 购买成功！");
    }

    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('system:orders:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orders orders)
    {
        return toAjax(ordersService.updateOrders(orders));
    }

    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('system:orders:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ordersService.deleteOrdersByIds(ids));
    }
}
