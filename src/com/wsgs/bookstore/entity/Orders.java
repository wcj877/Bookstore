package com.wsgs.bookstore.entity;

public class Orders {
    private String orderId;
    private String userId;
    private String orderTime;
    private String orderStatus;
    private double totalAmount;//订单总金额（没有在数据库中声明该）
    private int total;

    public Orders() {
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", userId='" + userId + '\'' +
                ", orderTime='" + orderTime + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", totalAmount=" + totalAmount +
                '}';
    }
}
