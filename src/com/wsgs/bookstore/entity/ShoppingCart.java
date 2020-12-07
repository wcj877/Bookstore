package com.wsgs.bookstore.entity;

import com.wsgs.bookstore.servlet.ShoppingCartList;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

    private Map<Integer, ShoppingCartList> cartListMap = new HashMap<>();

    /**
     * 增加一件商品
     * 若商品存在则增加数量
     * 若商铺不存在则新增
     * @param book
     */
    public void addBook(Book book){
        ShoppingCartList shoppingCartList = cartListMap.get(book.getBookId());

        if (shoppingCartList != null){
            shoppingCartList.increment();
        } else {
            shoppingCartList = new ShoppingCartList(book);
            cartListMap.put(book.getBookId(), shoppingCartList);
        }
    }

    /**
     * 返回购物车中的图书总数
     * @return
     */
    public int getBookTotal(){
        int total= 0;
        for (ShoppingCartList shoppingCartList: cartListMap.values()){
            total += shoppingCartList.getNum();
        }
        return total;
    }

    /**
     * 购物车是否为空
     * @return
     */
    public boolean isEmpty(){
        return cartListMap.isEmpty();
    }

    /**
     * 清空购物车
     */
    public void clear(){
        cartListMap.clear();
    }

    /**
     * 获取总钱数
     * @return
     */
    public double getBookSum(){
        double sum= 0;
        for (ShoppingCartList shoppingCartList: cartListMap.values()){
            sum += shoppingCartList.getMoney();
        }
        return sum;
    }

    /**
     * 修改商品数量
     * @param num
     * @param id
     */
    public void updateNum(int num, int id){
        ShoppingCartList shoppingCartList = cartListMap.get(id);
        shoppingCartList.setNum(num);

    }

    /**
     * 移出一种商品
     * @param id
     */
    public void removeBook(int id){
        cartListMap.remove(id);
    }

    /**
     * 获取购物车中的所有的 ShoppingCartList 组成的集合
     * @return
     */
    public Collection<ShoppingCartList> getItems(){
        return cartListMap.values();
    }

    public Map<Integer, ShoppingCartList> getCartListMap() {
        return cartListMap;
    }

    public void setCartListMap(Map<Integer, ShoppingCartList> cartListMap) {
        this.cartListMap = cartListMap;
    }
}
