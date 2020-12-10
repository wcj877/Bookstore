package com.wsgs.bookstore.servlet;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import com.wsgs.bookstore.dao.OrderDetailDao;
import com.wsgs.bookstore.dao.OrdersDao;
import com.wsgs.bookstore.dao.impl.OrderDetailImpl;
import com.wsgs.bookstore.dao.impl.OrdersImpl;
import com.wsgs.bookstore.entity.*;
import com.wsgs.bookstore.utils.PageBean;
import com.wsgs.bookstore.utils.SaveShoppingCartUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {

    OrdersDao dao = new OrdersImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String methodName = request.getParameter("method");

        //运用反射获取方法运行
        try {
            //得到该运行时类的methodName方法并设置设置两个形参HttpServletRequest和HttpServletResponse
            Method method1 = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method1.setAccessible(true);
            method1.invoke(this, request, response);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }





//        String method = request.getParameter("method");
//
//        if ("add".equals(method)){
//            this.add(request,response);
//        } else if ("showAll".equals(method)){
//            this.showAll(request, response);
//        } else if ("querysAll".equals(method)){
//            this.querysAll(request, response);
//        }
    }

    //查询全部订单
    private void querysAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId= "u_1111";
        List<Orders> notShipped = dao.getUserOrders(userId, "未发货");//未发货的订单
        List<Orders> shipped = dao.getUserOrders(userId, "已发货");//已发货的订单
        List<Orders> userOrders = dao.getUserOrders(userId, null);//全部订单

        request.setAttribute("notShipped", notShipped);
        request.setAttribute("shipped", shipped);
        request.setAttribute("userOrders", userOrders);

        request.getRequestDispatcher("/commons/orders.jsp").forward(request, response);
    }

    //显示所有订单（分页后）
    private void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currPage = request.getParameter("currentPage");
        // 判断
        if (currPage == null || "".equals(currPage.trim())) {
            currPage = "1"; // 第一次访问，设置当前页为1;
        }
        // 转换
        int currentPage = Integer.parseInt(currPage);

        // 创建PageBean对象，设置当前页参数； 传入service方法参数
        PageBean<Orders> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);

        dao.querysAll(pageBean);

        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/order/orderList.jsp").forward(request, response);

    }

    //增加订单
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = "u_1111";

        SimpleDateFormat formatterId= new SimpleDateFormat("yyyyMMdHHmmss");
        Date dateId = new Date(System.currentTimeMillis());
        String orderId = formatterId.format(dateId);

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());

        String orderTime = formatter.format(date);
        String orderStatus = "未发货";

        Orders orders = new Orders();
        orders.setOrderStatus(orderStatus);
        orders.setOrderTime(orderTime);
        orders.setUserId(userId);
        orders.setOrderId(orderId);

        dao.add(orders);

        ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
        Collection<ShoppingCartList> items = shoppingCart.getItems();

        OrderDetailDao orderDetailDao = new OrderDetailImpl();
        orderDetailDao.add(items, orderId);

        shoppingCart.clear();
        request.getSession().setAttribute("shoppingCart", shoppingCart);
        request.getRequestDispatcher("/commons/cartAir.jsp").forward(request, response);
    }

    //发货
    private void orderShipping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dao.update(request.getParameter("orderId"), "已发货");
        showAll(request, response);
    }

    private void OrderReceipt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dao.update(request.getParameter("orderId"), "已收货");
        showAll(request, response);
    }
}
