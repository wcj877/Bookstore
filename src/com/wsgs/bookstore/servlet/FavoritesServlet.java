package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.FavoritesDao;
import com.wsgs.bookstore.dao.impl.FavoritesImpl;
import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.entity.Favorites;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FavoritesServlet", urlPatterns = "/FavoritesServlet")
public class FavoritesServlet extends HttpServlet {
    FavoritesDao dao = new FavoritesImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("addFavorites".equals(method)){
            this.addFavorites(request, response);
        } else if ("querysAll".equals(method)){
            quersAll(request, response);
        }
    }

    /**
     * 获取收藏的图书
     * @param request
     * @param response
     */
    private void quersAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("userId");
        String id = "u_1111";
        List<Book> favoritesBook = dao.querysAll(id);

        request.setAttribute("favoritesBook", favoritesBook);
        request.getRequestDispatcher("/commons/collect.jsp").forward(request, response);
    }

    //增加图书至收藏
    private void addFavorites(HttpServletRequest request, HttpServletResponse response) {
        dao.add(request.getParameter("bookId"), "u_1111");
    }
}
