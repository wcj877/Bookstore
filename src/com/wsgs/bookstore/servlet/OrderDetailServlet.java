package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.OrderDetailDao;
import com.wsgs.bookstore.dao.OrdersDao;
import com.wsgs.bookstore.dao.impl.OrderDetailImpl;
import com.wsgs.bookstore.dao.impl.OrdersImpl;
import com.wsgs.bookstore.entity.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 顶单详情
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = "/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {
    OrderDetailDao dao = new OrderDetailImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if ("add".equals(method)){
            this.add(request,response);
        } else if ("queryAll".equals(method)){
            this.queryAll(request, response);
        }
    }

    //查询所有订单id为orderId的订单详情
    private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("orderId");
        List<OrderDetail> orderDetailList = dao.querysAll(request.getParameter("orderId"));
        request.setAttribute("orderDetailList", orderDetailList);
        request.getRequestDispatcher("/admin/order/orderDetail.jsp").forward(request, response);
    }

    /**
     * 增加订单详情
     * @param request
     * @param response
     */
    private void add(HttpServletRequest request, HttpServletResponse response) {

    }
}
