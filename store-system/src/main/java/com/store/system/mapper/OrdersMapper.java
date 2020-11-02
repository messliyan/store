package com.store.system.mapper;

import java.util.List;
import com.store.system.domain.Orders;

/**
 * 订单管理Mapper接口
 * 
 * @author store
 * @date 2020-11-02
 */
public interface OrdersMapper 
{
    /**
     * 查询订单管理
     * 
     * @param id 订单管理ID
     * @return 订单管理
     */
    public Orders selectOrdersById(Long id);

    /**
     * 查询订单管理列表
     * 
     * @param orders 订单管理
     * @return 订单管理集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增订单管理
     * 
     * @param orders 订单管理
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改订单管理
     * 
     * @param orders 订单管理
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 删除订单管理
     * 
     * @param id 订单管理ID
     * @return 结果
     */
    public int deleteOrdersById(Long id);

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrdersByIds(Long[] ids);
}
