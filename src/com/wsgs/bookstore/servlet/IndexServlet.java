package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.data.Book;
import com.wsgs.bookstore.utils.PageBean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init();


        PageBean<Book> pageBean = new PageBean<>();
        pageBean.setPageCount(8);//设置显示数据数
        pageBean.setCondition(" where isRecommend=1");

        BookDao bookDao = new BookImpl();
        bookDao.querysAll(pageBean);
        List<Book> recommendList = pageBean.getPageData();
        config.getServletContext().setAttribute("recommendList",recommendList);

        pageBean.setCondition(" ORDER BY  putTime DESC");
        bookDao.querysAll(pageBean);
        List<Book> putTimeList = pageBean.getPageData();
        config.getServletContext().setAttribute("putTimeList",putTimeList);
    }
}