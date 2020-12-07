package com.wsgs.bookstore.dao;

import com.wsgs.bookstore.dao.impl.OrdersImpl;
import com.wsgs.bookstore.entity.Orders;
import com.wsgs.bookstore.utils.PageBean;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        OrdersDao dao = new OrdersImpl();
        PageBean<Orders> pageBean = new PageBean<>();
        dao.querysAll(pageBean);
        List<Orders> list = pageBean.getPageData();
        for (Orders orders: list){
            System.out.println(orders);
        }
    }
}
