package com.wsgs.bookstore.servlet;

import com.google.gson.Gson;
import com.wsgs.bookstore.dao.BookDao;
import com.wsgs.bookstore.dao.FavoritesDao;
import com.wsgs.bookstore.dao.impl.BookImpl;
import com.wsgs.bookstore.dao.impl.FavoritesImpl;
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
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookServlet", urlPatterns = "/BookServlet")
public class BookServlet extends HttpServlet {

    private BookDao dao = new BookImpl();

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

    }

    /**
     * 增加收藏
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void addFavorites(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FavoritesDao favoritesDao = new FavoritesImpl();
        favoritesDao.add(request.getParameter("bookId"), "u_1111");
        show(request, response);
    }

    //修改购物车中的图书
    private void updateCartBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
        if (!shoppingCart.isEmpty()){
            shoppingCart.updateNum(Integer.parseInt(request.getParameter("quantity")), Integer.parseInt(request.getParameter("bookId")));
            request.getSession().setAttribute("shoppingCart", shoppingCart);
            //5. 传回 JSON 数据: computerNumber:xx, totalMoney
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("computerNumber", shoppingCart.getBookTotal());
            result.put("totalMoney", shoppingCart.getBookSum());

            Gson gson = new Gson();
            String jsonStr = gson.toJson(result);
            response.setContentType("text/javascript");
            response.getWriter().print(jsonStr);
        }
    }

    //显示购物车
    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
        if (!shoppingCart.isEmpty()){
            request.getRequestDispatcher("/commons/cart.jsp").forward(request, response);
        } else{
            request.getRequestDispatcher("/commons/cartAir.jsp").forward(request, response);
        }
    }

    //清除购物车
    private void clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
        shoppingCart.clear();
        request.getSession().setAttribute("shoppingCart", shoppingCart);
        request.getRequestDispatcher("/commons/cartAir.jsp").forward(request, response);
    }

    /**
     * 删除购物车中的图书
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void deleteShoppingCartBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("bookId");
        if (id != null){
            ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);
            shoppingCart.removeBook(id);
            request.getSession().setAttribute("shoppingCart", shoppingCart);
        }
        this.showCart(request, response);
    }


    //添加图书至购物车
    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("bookId");
        if (id != null){
            ShoppingCart shoppingCart = SaveShoppingCartUtils.getShoppingCart(request);

            shoppingCart.addBook(dao.getBook(id));
            request.getSession().setAttribute("shoppingCart", shoppingCart);
        }
        show(request, response);
    }

    /**
     * 显示图书详情
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book book = dao.getBook(request.getParameter("bookId"));

        request.setAttribute("book", book);
        request.getRequestDispatcher("/commons/details.jsp").forward(request, response);
    }

    /**
     * 删除图书
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dao.delete(Integer.parseInt(request.getParameter("bookId")));
        this.querysAll(request, response);
    }

    /**
     * 获取图书详情
     * 进入后台的图书详情修改页
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Book book = dao.getBook(request.getParameter("bookId"));
        session.setAttribute("book", book);
        request.getRequestDispatcher("/admin/book/updatebook.jsp").forward(request, response);
    }

    /**
     * 获取查询条件的图书
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
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
            request.getServletContext().setAttribute("classification",condition);

            condition = " where classificationId = " + condition;
            pageBean.setCondition(condition);
            dao.querysAll(pageBean);
            request.setAttribute("pageBean", pageBean);
            request.getRequestDispatcher("/commons/classification.jsp").forward(request, response);
        }

        dao.querysAll(pageBean);
        List<Book> bookList = pageBean.getPageData();

        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/book/book.jsp").forward(request, response);
    }

    /**
     * 修改图书信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
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

    /**
     * 增加图书
     * @param request
     * @param response
     */
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
