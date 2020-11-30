package com.wsgs.bookstore.data;

import java.sql.Date;

public class Book {
    private int bookId;
    private int classificationId;
    private String bookName;
    private String writer;
    private String intro;
    private double price;
    private Date putTime;
    private Date outTime;
    private String url;
    private int sellNumber;
    private int isRecommend;

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getClassificationId() {
        return classificationId;
    }

    public void setClassificationId(int classificationId) {
        this.classificationId = classificationId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getPutTime() {
        return putTime;
    }

    public void setPutTime(Date putTime) {
        this.putTime = putTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getSellNumber() {
        return sellNumber;
    }

    public void setSellNumber(int sellNumber) {
        this.sellNumber = sellNumber;
    }

    public int getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(int isRecommend) {
        this.isRecommend = isRecommend;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", classificationId=" + classificationId +
                ", bookName='" + bookName + '\'' +
                ", writer='" + writer + '\'' +
                ", intro='" + intro + '\'' +
                ", price=" + price +
                ", putTime=" + putTime +
                ", outTime=" + outTime +
                ", url='" + url + '\'' +
                ", sellNumber=" + sellNumber +
                ", isRecommend=" + isRecommend +
                '}';
    }
}
