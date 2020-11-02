package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.ProductMapper;
import com.store.system.domain.Product;
import com.store.system.service.IProductService;

/**
 * 商品管理Service业务层处理
 *
 * @author store
 * @date 2020-10-27
 */
@Service
public class ProductServiceImpl implements IProductService
{
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询商品管理
     *
     * @param productId 商品管理ID
     * @return 商品管理
     */
    @Override
    public Product selectProductById(Long productId)
    {
        return productMapper.selectProductById(productId);
    }

    /**
     * 查询商品管理列表
     *
     * @param product 商品管理
     * @return 商品管理
     */
    @Override
    public List<Product> selectProductList(Product product)
    {
        return productMapper.selectProductList(product);
    }

    /**
     * 新增商品管理
     *
     * @param product 商品管理
     * @return 结果
     */
    @Override
    public int insertProduct(Product product)
    {
        return productMapper.insertProduct(product);
    }

    /**
     * 修改商品管理
     *
     * @param product 商品管理
     * @return 结果
     */
    @Override
    public int updateProduct(Product product)
    {
        return productMapper.updateProduct(product);
    }

    /**
     * 批量删除商品管理
     *
     * @param productIds 需要删除的商品管理ID
     * @return 结果
     */
    @Override
    public int deleteProductByIds(Long[] productIds)
    {
        return productMapper.deleteProductByIds(productIds);
    }

    /**
     * 删除商品管理信息
     *
     * @param productId 商品管理ID
     * @return 结果
     */
    @Override
    public int deleteProductById(Long productId)
    {
        return productMapper.deleteProductById(productId);
    }
}
