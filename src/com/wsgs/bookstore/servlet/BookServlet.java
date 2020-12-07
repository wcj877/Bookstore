package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.entity.Book;
import com.wsgs.bookstore.entity.ShoppingCart;
import com.wsgs.bookstore.utils.PageBean;
import com.wsgs.bookstore.utils.SaveShoppingCartUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/BookServlet")
public class BookServlet extends HttpServlet {

    private BookDao dao = new BookImpl();

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
        } else if ("show".equals(method)){
            this.show(request, response);
        } else if ("addToCart".equals(method)){
            this.addToCart(request, response);
        }


    }


    //添加图书至购物车
    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("bookId");
        if (id != null){
            ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
            shoppingCart.addBook(dao.getBook(id));
            request.getSession().setAttribute("shoppingCart", shoppingCart);
        }
    }



    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book book = dao.getBook(request.getParameter("bookId"));

        request.setAttribute("book", book);
        request.getRequestDispatcher("/commons/details.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dao.delete(Integer.parseInt(request.getParameter("bookId")));
        this.querysAll(request, response);
    }

    private void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Book book = dao.getBook(request.getParameter("bookId"));
        session.setAttribute("book", book);
        request.getRequestDispatcher("/admin/book/updatebook.jsp").forward(request, response);
    }

    private void querysAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取“当前页”参数； (第一次访问当前页为null)
        String currPage = request.getParameter("currentPage");
        // 判断
        if (currPage == null || "".equals(currPage.trim())) {
            currPage = "1"; // 第一次访问，设置当前页为1;
        }
        // 转换
        int currentPage = Integer.parseInt(currPage);

        // 创建PageBean对象，设置当前页参数； 传入service方法参数
        PageBean<Book> pageBean = new PageBean<Book>();
        pageBean.setCurrentPage(currentPage);

        String condition = request.getParameter("condition");
        if("".equals(condition) || condition == null){

        } else {
            condition = " where " + condition;
            pageBean.setCondition(condition);
            dao.querysAll(pageBean);
            request.setAttribute("pageBean", pageBean);
            request.getRequestDispatcher("/commons/classification.jsp").forward(request, response);
        }

        dao.querysAll(pageBean); // 【pageBean已经被dao填充了数据】
        // 保存pageBean对象，到request域中

        List<Book> bookList = pageBean.getPageData();

        request.setAttribute("pageBean", pageBean);
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/admin/book/book.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Book book = (Book) session.getAttribute("book");

        book.setWriter(request.getParameter("writer"));
        book.setPrice(Double.parseDouble(request.getParameter("price")));
        book.setIntro(request.getParameter("intro"));
        book.setClassificationId(Integer.parseInt(request.getParameter("classificationId")));
        book.setBookName(request.getParameter("bookName"));
        book.setPutTime(Date.valueOf(request.getParameter("putTime")));
        book.setOutTime(Date.valueOf(request.getParameter("outTime")));

        dao.update(book);
        this.querysAll(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        Book book = new Book();

        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(10 * 1024 * 1024); // 单个文件大小限制
            upload.setSizeMax(50 * 1024 * 1024); // 总文件大小限制
            upload.setHeaderEncoding("UTF-8"); // 对中文文件编码处理

            //用于判断是普通表单，还是带文件上传的表单
            if (upload.isMultipartContent(request)) {

                //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
                List<FileItem> list = upload.parseRequest(request);
                for (FileItem item : list) {

                    if (item.isFormField()) {// 普通本文内容
                        String name = item.getFieldName();
                        // 获取值
                        String value = item.getString();
                        value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                        BeanUtils.setProperty(book, name, value);
                    } else {// 上传内容
                        String fieldName = item.getFieldName();
                        String path = getServletContext().getRealPath("/upload");
                        File f = new File(path);
                        if (!f.exists()) {
                            f.mkdir();
                        }
                        // 全部绝对路径
                        String name = item.getName();

                        BeanUtils.setProperty(book, fieldName, "upload/" + name);

                        // 拼接文件名
                        File file = new File(path, name);
                        // 上传
                        if (!file.isDirectory()) {
                            item.write(file);
                        }
                        item.delete(); // 删除组件运行时产生的临时文件
                    }
                }

                book.setIsRecommend(0);
                book.setSellNumber(0);

                dao.add(book);
                this.querysAll(request, response);
            } else {

            }
            querysAll(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
