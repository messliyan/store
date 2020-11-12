package com.store.system.controller;

import com.store.system.domain.Product;
import com.store.system.domain.WebProductPicture;
import com.store.system.service.IProductService;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
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
import com.store.system.domain.ProductPicture;
import com.store.system.service.IProductPictureService;
import com.store.common.utils.poi.ExcelUtil;
import com.store.common.core.page.TableDataInfo;

/**
 * 产品详细管理Controller
 *
 * @author store
 * @date 2020-11-02
 */
@RestController
@RequestMapping("/system/picture")
public class ProductPictureController extends BaseController
{
    @Value("${server.port}")
    private int port;
    @Autowired
    private IProductService productService;

    @Autowired
    private IProductPictureService productPictureService;

    /**
     * 查询产品详细管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:picture:list')")
    @GetMapping("/list")
    public TableDataInfo list( ProductPicture productPicture) throws UnknownHostException {
        List<WebProductPicture> list2=new ArrayList<>();
        startPage();
        List<ProductPicture> list = productPictureService.selectProductPictureList(productPicture);

        String IP = InetAddress.getLocalHost().getHostAddress();
        TableDataInfo tableDataInfo=getDataTable(list);
        for (ProductPicture pro:list
        ) {
            list2.add(new WebProductPicture(){{
                setId(pro.getId());
                setProductId(productService.selectProductById(pro.getProductId()).getProductName());
                setProductPicture("http://"+IP+":"+port+"/"+pro.getProductPicture());
                setIntro(pro.getIntro());
            }});
        }
        tableDataInfo.setRows(list2);
        return tableDataInfo;
    }

    /**
     * 导出产品详细管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:picture:export')")
    @Log(title = "产品详细管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProductPicture productPicture)
    {
        List<ProductPicture> list = productPictureService.selectProductPictureList(productPicture);
        ExcelUtil<ProductPicture> util = new ExcelUtil<ProductPicture>(ProductPicture.class);
        return util.exportExcel(list, "picture");
    }

    /**
     * 获取产品详细管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:picture:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(productPictureService.selectProductPictureById(id));
    }

    /**
     * 新增产品详细管理
     */
    @PreAuthorize("@ss.hasPermi('system:picture:add')")
    @Log(title = "产品详细管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductPicture productPicture)
    {
        return toAjax(productPictureService.insertProductPicture(productPicture));
    }

    /**
     * 修改产品详细管理
     */
    @PreAuthorize("@ss.hasPermi('system:picture:edit')")
    @Log(title = "产品详细管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductPicture productPicture)
    {
        return toAjax(productPictureService.updateProductPicture(productPicture));
    }

    /**
     * 删除产品详细管理
     */
    @PreAuthorize("@ss.hasPermi('system:picture:remove')")
    @Log(title = "产品详细管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(productPictureService.deleteProductPictureByIds(ids));
    }
}
