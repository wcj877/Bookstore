package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.dao.ClassificationDao;
import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.dao.impl.ClassificationImpl;
import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.entity.Classification;
import com.wsgs.bookstore.utils.PageBean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {

    //启动时自动
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init();

        PageBean<Book> pageBean = new PageBean<>();
        pageBean.setPageCount(8);//设置显示数据数
        pageBean.setCondition(" where isRecommend=1");

        BookDao bookDao = new BookImpl();
        bookDao.querysAll(pageBean);
        List<Book> recommendList = pageBean.getPageData();
        config.getServletContext().setAttribute("recommendList",recommendList);//将推荐图书保存在ServletContext中可以由任意处访问

        pageBean.setCondition(" ORDER BY putTime DESC");
        bookDao.querysAll(pageBean);
        List<Book> putTimeList = pageBean.getPageData();
        config.getServletContext().setAttribute("putTimeList",putTimeList);//将最新图书保存在ServletContext中可以由任意处访问

        ClassificationDao dao = new ClassificationImpl();
        List<Classification>  classificationList = dao.getAll();
        int classification = classificationList.get(0).getClassificationID();
        config.getServletContext().setAttribute("classification", classification);//将第一个图书分类保存在ServletContext中可以由任意处访问
        config.getServletContext().setAttribute("classificationList", classificationList);//将全部图书分类保存在ServletContext中可以由任意处访问
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        resp.sendRedirect("/admin/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
    }
}
