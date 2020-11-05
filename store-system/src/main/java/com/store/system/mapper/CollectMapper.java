package com.store.system.mapper;

import java.util.List;
import com.store.system.domain.Collect;

/**
 * 个人收藏Mapper接口
 * 
 * @author store
 * @date 2020-11-05
 */
public interface CollectMapper 
{
    /**
     * 查询个人收藏
     * 
     * @param id 个人收藏ID
     * @return 个人收藏
     */
    public Collect selectCollectById(Long id);

    /**
     * 查询个人收藏列表
     * 
     * @param collect 个人收藏
     * @return 个人收藏集合
     */
    public List<Collect> selectCollectList(Collect collect);

    /**
     * 新增个人收藏
     * 
     * @param collect 个人收藏
     * @return 结果
     */
    public int insertCollect(Collect collect);

    /**
     * 修改个人收藏
     * 
     * @param collect 个人收藏
     * @return 结果
     */
    public int updateCollect(Collect collect);

    /**
     * 删除个人收藏
     * 
     * @param id 个人收藏ID
     * @return 结果
     */
    public int deleteCollectById(Long id);

    /**
     * 批量删除个人收藏
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCollectByIds(Long[] ids);
}
