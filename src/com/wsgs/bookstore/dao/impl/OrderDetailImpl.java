package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.OrderDetailDao;
import com.wsgs.bookstore.entity.OrderDetail;
import com.wsgs.bookstore.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
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
    public List<OrderDetail> querysAll(String orderId) {
        System.out.println(orderId);
        String sql = "select detailID, orderID, orderdetail.bookID,number, price, bookName " +
                "from OrderDetail,book " +
                "where book.bookID=orderdetail.bookID AND orderdetail.orderID = " + orderId;
        try {
            return queryRunner.query(sql, new BeanListHandler<OrderDetail>(OrderDetail.class));
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
