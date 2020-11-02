package com.store.system.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
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
import com.store.system.domain.Product;
import com.store.system.service.IProductService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 商品管理Controller
 *
 * @author store
 * @date 2020-10-27
 */
@RestController
@RequestMapping("/system/productTool")
public class ProductController extends BaseController
{
    @Autowired
    private IProductService productService;
    @Value("${server.port}")
    private int port;
    /**
     * 查询商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:list')")
    @GetMapping("/list")
    public TableDataInfo list(Product product) throws UnknownHostException {
        startPage();
        String IP = InetAddress.getLocalHost().getHostAddress();

        List<Product> list = productService.selectProductList(product);
        for (Product pro:list
        ) {
            pro.setProductPicture("http://"+IP+":"+port+"/"+pro.getProductPicture());
        }
        return getDataTable(list);
    }

    /**
     * 导出商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:export')")
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Product product)
    {
        List<Product> list = productService.selectProductList(product);
        ExcelUtil<Product> util = new ExcelUtil<Product>(Product.class);
        return util.exportExcel(list, "productTool");
    }

    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return AjaxResult.success(productService.selectProductById(productId));
    }

    /**
     * 新增商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:add')")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Product product)
    {
        return toAjax(productService.insertProduct(product));
    }

    /**
     * 修改商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:edit')")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Product product)
    {
        return toAjax(productService.updateProduct(product));
    }

    /**
     * 删除商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:productTool:remove')")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(productService.deleteProductByIds(productIds));
    }
}
