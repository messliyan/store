package com.store.system.domain;

import com.store.common.annotation.Excel;
import com.store.common.core.domain.BaseEntity;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 订单管理对象 orders
 *
 * @author store
 * @date 2020-11-02
 */
public class AddOrders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单表示符 */
    private Long user_id;
    private ArrayList products;
}
