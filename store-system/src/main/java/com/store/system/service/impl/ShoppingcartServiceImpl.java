package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.ShoppingcartMapper;
import com.store.system.domain.Shoppingcart;
import com.store.system.service.IShoppingcartService;

/**
 * 个人购物车Service业务层处理
 *
 * @author store
 * @date 2020-11-05
 */
@Service
public class ShoppingcartServiceImpl implements IShoppingcartService
{
    @Autowired
    private ShoppingcartMapper shoppingcartMapper;

    /**
     * 查询个人购物车
     *
     * @param id 个人购物车ID
     * @return 个人购物车
     */
    @Override
    public Shoppingcart selectShoppingcartById(Long id)
    {
        return shoppingcartMapper.selectShoppingcartById(id);
    }

    /**
     * 查询个人购物车列表
     *
     * @param shoppingcart 个人购物车
     * @return 个人购物车
     */
    @Override
    public List<Shoppingcart> selectShoppingcartList(Shoppingcart shoppingcart)
    {
        return shoppingcartMapper.selectShoppingcartList(shoppingcart);
    }

    /**
     * 新增个人购物车
     *
     * @param shoppingcart 个人购物车
     * @return 结果
     */
    @Override
    public int insertShoppingcart(Shoppingcart shoppingcart)
    {
        return shoppingcartMapper.insertShoppingcart(shoppingcart);
    }

    /**
     * 修改个人购物车
     *
     * @param shoppingcart 个人购物车
     * @return 结果
     */
    @Override
    public int updateShoppingcart(Shoppingcart shoppingcart)
    {
        return shoppingcartMapper.updateShoppingcart(shoppingcart);
    }

    /**
     * 批量删除个人购物车
     *
     * @param ids 需要删除的个人购物车ID
     * @return 结果
     */
    @Override
    public int deleteShoppingcartByIds(Long[] ids)
    {
        return shoppingcartMapper.deleteShoppingcartByIds(ids);
    }

    /**
     * 删除个人购物车信息
     *
     * @param id 个人购物车ID
     * @return 结果
     */
    @Override
    public int deleteShoppingcartById(Long id)
    {
        return shoppingcartMapper.deleteShoppingcartById(id);
    }
}
