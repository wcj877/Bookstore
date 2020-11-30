package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.data.OrderDetail;
import com.wsgs.bookstore.utils.PageBean;

import java.util.List;

public interface OrderDetailDao {
    /**
     * 增加订单详情
     * @param orderDetails
     * @return
     */
    void add(List<OrderDetail> orderDetails);

    /**
     * 获取查询的订单详情
     * @param
     */
    List<OrderDetail> querysAll(int orderID);

}
