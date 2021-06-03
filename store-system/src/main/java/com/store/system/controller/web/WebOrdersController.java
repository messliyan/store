package com.store.system.controller.web;

import com.store.common.core.domain.entity.SysUser;
import com.store.system.service.IProductService;
import com.store.system.service.ISysUserService;
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
import com.store.system.domain.Orders;
import com.store.system.service.IOrdersService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 订单管理Controller
 *
 * @author store
 * @date 2021-06-03
 */
@RestController
@RequestMapping("/system/orders")
public class WebOrdersController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IProductService productService;
    /**
     * 查询订单管理列表
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:orders:list')")
    @GetMapping("/list")
    public TableDataInfo list(Orders orders)
    {
        startPage();
        if (!orders.getUseName().isEmpty()){
            orders.setUserId(1000000000L);
            SysUser sysUser=userService.selectUserByUserName(orders.getUseName());
            if (sysUser !=null)  orders.setUserId(sysUser.getUserId());
        }
        List<Orders> list = ordersService.selectOrdersList(orders);
        if (list.isEmpty()){
            return getDataTable(list);
        }
        list.forEach(q->{
            q.setUseName(userService.selectUserById(q.getUserId()).getUserName());
            q.setProductName(productService.selectProductById(q.getProductId()).getProductName());
        });
        return getDataTable(list);
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
    @PreAuthorize("@ss.hasPermi('system:orders:add')")
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orders orders)
    {
        return toAjax(ordersService.insertOrders(orders));
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
