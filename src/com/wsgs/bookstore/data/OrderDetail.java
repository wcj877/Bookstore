package com.wsgs.bookstore.data;

public class OrderDetail {
    int detailID;
    int orderID;
    int bookID;
    int number;

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
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
