package com.store.system.service;

import java.util.List;
import com.store.system.domain.Shoppingcart;

/**
 * 个人购物车Service接口
 * 
 * @author store
 * @date 2020-11-05
 */
public interface IShoppingcartService 
{
    /**
     * 查询个人购物车
     * 
     * @param id 个人购物车ID
     * @return 个人购物车
     */
    public Shoppingcart selectShoppingcartById(Long id);

    /**
     * 查询个人购物车列表
     * 
     * @param shoppingcart 个人购物车
     * @return 个人购物车集合
     */
    public List<Shoppingcart> selectShoppingcartList(Shoppingcart shoppingcart);

    /**
     * 新增个人购物车
     * 
     * @param shoppingcart 个人购物车
     * @return 结果
     */
    public int insertShoppingcart(Shoppingcart shoppingcart);

    /**
     * 修改个人购物车
     * 
     * @param shoppingcart 个人购物车
     * @return 结果
     */
    public int updateShoppingcart(Shoppingcart shoppingcart);

    /**
     * 批量删除个人购物车
     * 
     * @param ids 需要删除的个人购物车ID
     * @return 结果
     */
    public int deleteShoppingcartByIds(Long[] ids);

    /**
     * 删除个人购物车信息
     * 
     * @param id 个人购物车ID
     * @return 结果
     */
    public int deleteShoppingcartById(Long id);
}
