package com.store.system.mapper;

import java.util.List;
import com.store.system.domain.ProductPicture;

/**
 * 产品详细管理Mapper接口
 * 
 * @author store
 * @date 2020-11-02
 */
public interface ProductPictureMapper 
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
     * 删除产品详细管理
     * 
     * @param id 产品详细管理ID
     * @return 结果
     */
    public int deleteProductPictureById(Long id);

    /**
     * 批量删除产品详细管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteProductPictureByIds(Long[] ids);
}
