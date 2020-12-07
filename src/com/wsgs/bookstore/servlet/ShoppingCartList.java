package com.wsgs.bookstore.servlet;

import com.wsgs.bookstore.entity.Book;

public class ShoppingCartList {
    private Book book;
    private int num ;

    public double getMoney(){
        return book.getPrice();
    }
    public ShoppingCartList(Book book) {
        this.book = book;
        this.num = 1;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void increment(){
        num++;
    }

    @Override
    public String toString() {
        return "ShoppingCartList{" +
                "book=" + book +
                ", num=" + num +
                '}';
    }
}
