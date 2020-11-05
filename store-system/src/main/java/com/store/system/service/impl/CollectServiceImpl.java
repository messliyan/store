package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.CollectMapper;
import com.store.system.domain.Collect;
import com.store.system.service.ICollectService;

/**
 * 个人收藏Service业务层处理
 *
 * @author store
 * @date 2020-11-05
 */
@Service
public class CollectServiceImpl implements ICollectService
{
    @Autowired
    private CollectMapper collectMapper;

    /**
     * 查询个人收藏
     *
     * @param id 个人收藏ID
     * @return 个人收藏
     */
    @Override
    public Collect selectCollectById(Long id)
    {
        return collectMapper.selectCollectById(id);
    }

    /**
     * 查询个人收藏列表
     *
     * @param collect 个人收藏
     * @return 个人收藏
     */
    @Override
    public List<Collect> selectCollectList(Collect collect)
    {
        return collectMapper.selectCollectList(collect);
    }

    /**
     * 新增个人收藏
     *
     * @param collect 个人收藏
     * @return 结果
     */
    @Override
    public int insertCollect(Collect collect)
    {
        return collectMapper.insertCollect(collect);
    }

    /**
     * 修改个人收藏
     *
     * @param collect 个人收藏
     * @return 结果
     */
    @Override
    public int updateCollect(Collect collect)
    {
        return collectMapper.updateCollect(collect);
    }

    /**
     * 批量删除个人收藏
     *
     * @param ids 需要删除的个人收藏ID
     * @return 结果
     */
    @Override
    public int deleteCollectByIds(Long[] ids)
    {
        return collectMapper.deleteCollectByIds(ids);
    }

    /**
     * 删除个人收藏信息
     *
     * @param id 个人收藏ID
     * @return 结果
     */
    @Override
    public int deleteCollectById(Long id)
    {
        return collectMapper.deleteCollectById(id);
    }
}
