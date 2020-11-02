package com.store.system.service;

import java.util.List;
import com.store.system.domain.ProductPicture;

/**
 * 产品详细管理Service接口
 * 
 * @author store
 * @date 2020-11-02
 */
public interface IProductPictureService 
{
    /**
     * 查询产品详细管理
     * 
     * @param id 产品详细管理ID
     * @return 产品详细管理
     */
    public ProductPicture selectProductPictureById(Long id);

    /**
     * 查询产品详细管理列表
     * 
     * @param productPicture 产品详细管理
     * @return 产品详细管理集合
     */
    public List<ProductPicture> selectProductPictureList(ProductPicture productPicture);

    /**
     * 新增产品详细管理
     * 
     * @param productPicture 产品详细管理
     * @return 结果
     */
    public int insertProductPicture(ProductPicture productPicture);

    /**
     * 修改产品详细管理
     * 
     * @param productPicture 产品详细管理
     * @return 结果
     */
    public int updateProductPicture(ProductPicture productPicture);

    /**
     * 批量删除产品详细管理
     * 
     * @param ids 需要删除的产品详细管理ID
     * @return 结果
     */
    public int deleteProductPictureByIds(Long[] ids);

    /**
     * 删除产品详细管理信息
     * 
     * @param id 产品详细管理ID
     * @return 结果
     */
    public int deleteProductPictureById(Long id);
}
