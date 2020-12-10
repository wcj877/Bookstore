package com.wsgs.bookstore.entity;

public class Favorites {
    private int favoritesID;
    private int bookID;
    private String userID;

    public Favorites() {
    }

    public int getFavoritesID() {
        return favoritesID;
    }

    public void setFavoritesID(int favoritesID) {
        this.favoritesID = favoritesID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "Favorites{" +
                "favoritesID=" + favoritesID +
                ", bookID=" + bookID +
                ", userID='" + userID + '\'' +
                '}';
    }
}
