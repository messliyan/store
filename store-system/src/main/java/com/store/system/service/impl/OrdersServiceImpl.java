package com.store.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.store.system.mapper.OrdersMapper;
import com.store.system.domain.Orders;
import com.store.system.service.IOrdersService;

/**
 * 订单管理Service业务层处理
 *
 * @author store
 * @date 2020-11-02
 */
@Service
public class OrdersServiceImpl implements IOrdersService
{
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询订单管理
     *
     * @param id 订单管理ID
     * @return 订单管理
     */
    @Override
    public Orders selectOrdersById(Long id)
    {
        return ordersMapper.selectOrdersById(id);
    }

    /**
     * 查询订单管理列表
     *
     * @param orders 订单管理
     * @return 订单管理
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders)
    {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增订单管理
     *
     * @param orders 订单管理
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders)
    {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改订单管理
     *
     * @param orders 订单管理
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders)
    {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除订单管理
     *
     * @param ids 需要删除的订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrdersByIds(Long[] ids)
    {
        return ordersMapper.deleteOrdersByIds(ids);
    }

    /**
     * 删除订单管理信息
     *
     * @param id 订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrdersById(Long id)
    {
        return ordersMapper.deleteOrdersById(id);
    }
}
