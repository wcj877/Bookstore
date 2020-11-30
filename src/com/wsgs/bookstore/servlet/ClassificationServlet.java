package com.wsgs.bookstore.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ClassificationServlet" , urlPatterns = "/ClassificationServlet")
public class ClassificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if ("add".equals(method)){
            this.add(request,response);
        } else if ("update".equals(method)){
            this.update(request,response);
        } else if ("querysAll".equals(method)){
            this.querysAll(request, response);
        } else if ("getBook".equals(method)){
            this.getBook(request, response);
        } else if ("delete".equals(method)){
            this.delete(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {

    }

    private void getBook(HttpServletRequest request, HttpServletResponse response) {

    }

    private void querysAll(HttpServletRequest request, HttpServletResponse response) {

    }

    private void update(HttpServletRequest request, HttpServletResponse response) {

    }

    private void add(HttpServletRequest request, HttpServletResponse response) {

    }


}
