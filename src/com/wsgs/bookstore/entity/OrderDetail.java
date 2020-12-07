package com.wsgs.bookstore.entity;

public class OrderDetail {
    private int detailID;
    private String orderID;
    private String bookID;
    private String number;
    private String price;
    private String bookName;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public OrderDetail() {
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "detailID=" + detailID +
                ", orderID=" + orderID +
                ", bookID=" + bookID +
                ", number=" + number +
                '}';
    }
}
