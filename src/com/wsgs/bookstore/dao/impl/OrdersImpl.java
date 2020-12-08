package com.wsgs.bookstore.dao.impl;

import com.wsgs.bookstore.dao.OrdersDao;
import com.wsgs.bookstore.entity.Orders;
import com.wsgs.bookstore.utils.JDBCUtils;
import com.wsgs.bookstore.utils.PageBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdersImpl implements OrdersDao {

    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Orders order) {
        String sql =" INSERT orders(orderId, userID, orderTime, orderStatus) VALUES(?,?,?,?)";
        try {
            queryRunner.update(sql, order.getOrderId(), order.getUserId(), order.getOrderTime(), order.getOrderStatus());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Orders order) {
        String sql =" update Order set orderStatus=? " +
                "where orderID = ?";
        try {
            queryRunner.update(sql, order.getOrderStatus(), order.getOrderId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void querysAll(PageBean<Orders> pb) {
        //总记录数到pb中
        int totalCount = this.getCount(pb.getCondition());
        pb.setTotalCount(totalCount);

        /**
         * 如果当前页 <= 0;       当前页设置当前页为1;
         * 如果当前页 > 最大页数；  当前页设置为最大页数;
         */

        if (pb.getCurrentPage() <= 0) {
            pb.setCurrentPage(1);
        } else if (pb.getCurrentPage() > pb.getTotalPage()) {
            pb.setCurrentPage(pb.getTotalPage());
        }

        // 获取当前页： 计算查询的起始行、返回的行数
        int currentPage = pb.getCurrentPage();
        int index = (currentPage - 1) * pb.getPageCount(); // 查询的起始行
        int count = pb.getPageCount(); // 查询返回的行数

        StringBuilder sb = new StringBuilder();
        sb.append(" select orders.orderID, orders.userID, orders.orderTime, orderStatus ,SUM(price*number) as totalAmount  " +
                "from OrderDetail,book,orders  " +
                "where book.bookID=orderdetail.bookID AND orders.orderID=orderdetail.orderID  " +
                "GROUP BY orders.orderID");
        sb.append(" limit ?,? ");
        List<Object> list = new ArrayList<Object>();
        list.add(index);
        list.add(count);

        try {
            // 根据当前页，查询当前页数据(一页数据)
            if (index >= 0) {
                List<Orders> pageData = queryRunner.query(sb.toString(),
                        new BeanListHandler<Orders>(Orders.class), list.toArray());
                // 设置到pb对象中
                pb.setPageData(pageData);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getCount(String condition) {
        String sql = "select count(*) From orders";
        try {

            if (condition != null){
                sql += condition;
            }
            Long count =  queryRunner.query(sql, new ScalarHandler<Long>());
            return count.intValue();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
