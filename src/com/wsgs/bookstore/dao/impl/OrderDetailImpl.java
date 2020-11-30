package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.OrderDetailDao;
import com.wsgs.bookstore.data.Classification;
import com.wsgs.bookstore.data.OrderDetail;
import com.wsgs.bookstore.utils.JDBCUtils;
import com.wsgs.bookstore.utils.PageBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class OrderDetailImpl implements OrderDetailDao {

    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(List<OrderDetail> orderDetails) {
        String sql =" INSERT orderDetail(orderID, bookID, number) VALUES(?,?,?)";
        try {
            for (OrderDetail orderDetail: orderDetails){
                queryRunner.update(sql, orderDetail.getOrderID(), orderDetail.getBookID(), orderDetail.getNumber());
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<OrderDetail> querysAll(int orderID) {
        String sql = "select * from OrderDetail where orderID = ?";
        try {
            return queryRunner.query(sql, new BeanListHandler<OrderDetail>(OrderDetail.class), orderID);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
