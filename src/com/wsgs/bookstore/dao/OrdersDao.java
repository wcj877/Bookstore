package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.data.Orders;
import com.wsgs.bookstore.utils.PageBean;

import java.util.List;

public interface OrdersDao {
    /**
     * 增加订单
     * @param order
     * @return
     */
    void add(Orders order);

    /**
     * 修改订单
     * @param order
     * @return
     */
    void update(Orders order);


    /**
     * 获取订单
     * @param pb
     */
    void querysAll(PageBean<Orders> pb);

    /**
     * 获取订单数
     * @param condition
     * @return
     */
    int getCount(String condition);
}