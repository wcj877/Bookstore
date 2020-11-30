package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.data.Book;
import com.wsgs.bookstore.utils.PageBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet(name = "RankingServlet", urlPatterns = "/RankingServlet")
public class RankingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currPage = request.getParameter("currentPage");

        if (currPage == null || "".equals(currPage.trim())){
            currPage = "1";//第一次访问时页数设为1
        }
        int currentPage = Integer.parseInt(currPage);

        PageBean<Book> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);;

        pageBean.setCondition(" ORDER BY sellNumber DESC ");

        BookDao book = new BookImpl();
        book.querysAll(pageBean);

        List<Book> list = pageBean.getPageData();

        request.setAttribute("list", list);
        request.setAttribute("pageBean", pageBean);

        request.getRequestDispatcher("/commons/ranking.jsp").forward(request,response);
    }
}
