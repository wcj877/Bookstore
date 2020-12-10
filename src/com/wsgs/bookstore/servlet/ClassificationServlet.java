package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.ClassificationDao;
import com.wsgs.bookstore.dao.impl.ClassificationImpl;
import com.wsgs.bookstore.entity.Classification;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

@WebServlet(name = "ClassificationServlet" , urlPatterns = "/ClassificationServlet")
public class ClassificationServlet extends HttpServlet {

    ClassificationDao dao = new ClassificationImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodName = request.getParameter("method");

        try {
            //得到该运行时类的methodName方法并设置设置两个形参HttpServletRequest和HttpServletResponse
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.setAccessible(true);
            method.invoke(this, request, response);

        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }


//        if ("add".equals(method)){
//            this.add(request,response);
//        } else if ("update".equals(method)){
//            this.update(request,response);
//        } else if ("getClassification".equals(method)){
//            this.getClassification(request, response);
//        } else if ("delete".equals(method)){
//            this.delete(request, response);
//        } else if ("showAll".equals(method)){
//            this.showAll(request, response);
//        }
    }

    //显示所有图书分类
    private void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classification> classificationList = dao.getAll();
        request.getServletContext().setAttribute("classificationList", classificationList);
        request.getRequestDispatcher("/admin/classification/classification.jsp").forward(request, response);
    }

    //删除图书分类
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dao.delete(request.getParameter("classificationId"));
        this.showAll(request, response);
    }

    //获取一个图书分类详情
    private void getClassification(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("classification",dao.getClassification(request.getParameter("classificationId")));
        request.getRequestDispatcher("/admin/classification/updateClassification.jsp").forward(request, response);
    }

    //修改一个图书分类
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Classification classification = new Classification();
        classification.setClassificationID(Integer.parseInt(request.getParameter("classificationId")));
        classification.setClassificationName(request.getParameter("classificationName"));
        dao.update(classification);
        this.showAll(request, response);
    }

    //增加一个图书分类
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Classification classification = new Classification();
        classification.setClassificationName(request.getParameter("classificationName"));
        dao.add(classification);
        this.showAll(request, response);
    }


}
