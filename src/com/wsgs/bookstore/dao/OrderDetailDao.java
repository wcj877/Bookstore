package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.entity.OrderDetail;
import com.wsgs.bookstore.entity.ShoppingCartList;

import java.util.Collection;
import java.util.List;

public interface OrderDetailDao {
    /**
     * 增加订单详情
     * @param orderDetails
     * @param orderId
     * @return
     */
    void add(Collection<ShoppingCartList> orderDetails, String orderId);

    /**
     * 获取查询的订单详情
     * @param
     */
    List<OrderDetail> querysAll(String orderId);

}
