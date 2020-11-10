package com.store.system.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.common.annotation.Log;
import com.store.common.core.controller.BaseController;
import com.store.common.core.domain.AjaxResult;
import com.store.common.core.domain.StoreResult;
import com.store.common.core.domain.entity.SysDictData;
import com.store.common.core.page2.WebPageDomain;
import com.store.common.core.page2.WebTableDataInfo;
import com.store.common.core.page2.WebTableSupport;
import com.store.common.enums.BusinessType;
import com.store.common.utils.StringUtils;
import com.store.common.utils.sql.SqlUtil;
import com.store.system.domain.A;
import com.store.system.domain.B;
import com.store.system.domain.BProductPicture;
import com.store.system.domain.Category;
import com.store.system.domain.Product;
import com.store.system.domain.ProductPicture;
import com.store.system.domain.WebProduct;
import com.store.system.service.IProductPictureService;
import com.store.system.service.IProductService;
import com.store.system.service.ISysDictDataService;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商品管理Controller
 *
 * @author store
 * @date 2020-10-27
 */
@RestController
@RequestMapping("/product")
public class WebProductController extends BaseController
{
    @Autowired
    private IProductService productService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private IProductPictureService productPictureService;

    /**
     * id得到产品细节
     */
    @PostMapping("/getDetailsPicture")
    public StoreResult getDetailsPicture(@RequestBody A a) {
        ArrayList hashMaps=new ArrayList<BProductPicture>();
        ProductPicture productPicture=new ProductPicture();
        productPicture.setProductId(a.getProductID());


        List<ProductPicture> list = productPictureService.selectProductPictureList(productPicture);

        list.forEach(product1 -> {hashMaps.add(new BProductPicture(product1.getId(), product1.getProductId(), product1.getProductPicture(),product1.getIntro()));});


        return StoreResult.success("得到产品细节信息成功！","ProductPicture",hashMaps);
    }


    /**
     * id得到产品细节
     */
    @PostMapping("/getDetails")
    public StoreResult getDetails(@RequestBody A a) {

        ArrayList hashMaps=new ArrayList<Category>();

        Product product1 = productService.selectProductById(a.getProductID());

        hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
            product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
            product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));


        return StoreResult.success("得到产品细节信息成功！","Product",hashMaps);
    }

    /**
     * 分页获取所有的商品信息
     */
    @PostMapping("/getProductBySearch")
    public WebTableDataInfo getProductBySearch(@RequestBody B b) {
        ArrayList hashMaps=new ArrayList<WebProduct>();

        WebPageDomain pageDomain = WebTableSupport.buildPageRequest(b.getCurrentPage(),b.getPageSize());
        Integer pageNum = pageDomain.getCurrentPage();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }

        Product product =new Product();
        product.setSearchValue(b.getSearch());

        List<Product> list = productService.selectProductList(product);

        list.forEach(product1 -> {hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
            product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
            product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));});

        WebTableDataInfo rspData = new WebTableDataInfo();
        rspData.setCode("001");
        rspData.setMsg("查询成功");
        rspData.setProduct(hashMaps);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 分页获取所有的商品信息
     */
    @PostMapping("/getCategory")
    public StoreResult getCategory(@RequestBody B b) {
        ArrayList hashMaps=new ArrayList<Category>();

        SysDictData sysDictData1=new SysDictData();
        sysDictData1.setDictType("web_category_type");
        List<SysDictData>  sysDictDataList=dictDataService.selectDictDataList(sysDictData1);


        sysDictDataList.forEach(sysDictData -> {hashMaps.add(new Category(sysDictData.getDictSort(),sysDictData.getDictLabel()));});


        return StoreResult.success("获取商品成功！","category",hashMaps);
    }


    /**
     * 根据分类id,分页获取商品信息
     */
    @PostMapping("/getProductByCategory")
    public WebTableDataInfo getProductByCategory(@RequestBody B b) {
        ArrayList hashMaps=new ArrayList<WebProduct>();

        WebPageDomain pageDomain = WebTableSupport.buildPageRequest(b.getCurrentPage(),b.getPageSize());
        Integer pageNum = pageDomain.getCurrentPage();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }

        Product product =new Product();
        int[] ints=b.getCategoryID();
        product.setCategoryId( Long.valueOf(ints[0]));
        List<Product> list = productService.selectProductList(product);

        list.forEach(product1 -> {hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
            product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
            product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));});

        WebTableDataInfo rspData = new WebTableDataInfo();
        rspData.setCode("001");
        rspData.setMsg("查询成功");
        rspData.setProduct(hashMaps);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 分页获取所有的商品信息
     */
    @PostMapping("/getAllProduct")
    public WebTableDataInfo getAllProduct(@RequestBody B b) {
        ArrayList hashMaps=new ArrayList<WebProduct>();

        WebPageDomain pageDomain = WebTableSupport.buildPageRequest(b.getCurrentPage(),b.getPageSize());
        Integer pageNum = pageDomain.getCurrentPage();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }

        Product product =new Product();
        List<Product> list = productService.selectProductList(product);

        list.forEach(product1 -> {hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
            product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
            product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));});

        WebTableDataInfo rspData = new WebTableDataInfo();
        rspData.setCode("001");
        rspData.setMsg("查询成功");
        rspData.setProduct(hashMaps);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;

    }
    /**
     * 根据商品分类名称获取首页展示的商品信息 0-7
     */
    @PostMapping("/getPromoProduct")
    public StoreResult getPromoProduct(@RequestBody WebProduct product) {
        ArrayList hashMaps=new ArrayList<WebProduct>();

        SysDictData  sysDictData=dictDataService.selectDictData(product.getCategoryName());
        Product product2 =new Product();
        product2.setCategoryId(sysDictData.getDictSort());
        List<Product> list = productService.selectProductList(product2);


        for (int i=0;i<list.size();i++){
            if (i>=7)
                break;
            Product product1=list.get(i);
            hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
                product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
                product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));

        }
            return StoreResult.success("获取首页展示的商品信息成功！","Product",hashMaps);

    }

    /**
     * 根据商品分类名称获取热门商品信息
     */
    @PostMapping("/getHotProduct")
    public StoreResult getHotProduct(  @RequestBody A a)
    {
        List<WebProduct> hashMaps=new ArrayList<>();
        for (String product:
            a.getCategoryName()) {
            SysDictData  sysDictData=dictDataService.selectDictData(product);

            Product product2 =new Product();
            product2.setCategoryId(sysDictData.getDictSort());
            List<Product> list = productService.selectProductList(product2);
            for (int i=0;i<list.size();i++){

                Product product1=list.get(i);
                hashMaps.add(new WebProduct(product1.getProductId(), product1.getProductName(), product1.getCategoryId(),
                    product1.getProductTitle(), product1.getProductIntro(), product1.getProductPicture(),
                    product1.getProductPrice(), product1.getProductSellingPrice(), product1.getProductNum(), product1.getProductSales()));
            }

        }
        List<WebProduct> hashMaps2=new ArrayList<>();
        for (int i=0;i<hashMaps.size();i++){
            if (i>=7)
                break;
            Random rand = new Random();
            hashMaps2.add(hashMaps.get(rand.nextInt(hashMaps.size()) ));
        }
        return StoreResult.success("获取首页展示的商品信息成功！","Product",hashMaps2);
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
