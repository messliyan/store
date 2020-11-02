package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.ProductPictureMapper;
import com.store.system.domain.ProductPicture;
import com.store.system.service.IProductPictureService;

/**
 * 产品详细管理Service业务层处理
 *
 * @author store
 * @date 2020-11-02
 */
@Service
public class ProductPictureServiceImpl implements IProductPictureService
{
    @Autowired
    private ProductPictureMapper productPictureMapper;

    /**
     * 查询产品详细管理
     *
     * @param id 产品详细管理ID
     * @return 产品详细管理
     */
    @Override
    public ProductPicture selectProductPictureById(Long id)
    {
        return productPictureMapper.selectProductPictureById(id);
    }

    /**
     * 查询产品详细管理列表
     *
     * @param productPicture 产品详细管理
     * @return 产品详细管理
     */
    @Override
    public List<ProductPicture> selectProductPictureList(ProductPicture productPicture)
    {
        return productPictureMapper.selectProductPictureList(productPicture);
    }

    /**
     * 新增产品详细管理
     *
     * @param productPicture 产品详细管理
     * @return 结果
     */
    @Override
    public int insertProductPicture(ProductPicture productPicture)
    {
        return productPictureMapper.insertProductPicture(productPicture);
    }

    /**
     * 修改产品详细管理
     *
     * @param productPicture 产品详细管理
     * @return 结果
     */
    @Override
    public int updateProductPicture(ProductPicture productPicture)
    {
        return productPictureMapper.updateProductPicture(productPicture);
    }

    /**
     * 批量删除产品详细管理
     *
     * @param ids 需要删除的产品详细管理ID
     * @return 结果
     */
    @Override
    public int deleteProductPictureByIds(Long[] ids)
    {
        return productPictureMapper.deleteProductPictureByIds(ids);
    }

    /**
     * 删除产品详细管理信息
     *
     * @param id 产品详细管理ID
     * @return 结果
     */
    @Override
    public int deleteProductPictureById(Long id)
    {
        return productPictureMapper.deleteProductPictureById(id);
    }
}
