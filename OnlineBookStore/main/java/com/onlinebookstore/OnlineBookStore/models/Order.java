package com.onlinebookstore.OnlineBookStore.models;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderId;
    

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)  // Correct, assuming the column name in DB is user_id
    private User user;

    @Column(name = "order_date", nullable = false)  // Ensure this matches the database column name
    private Date orderDate;

    @Column(name = "total_price", nullable = false)  // Use the correct column name
    private BigDecimal totalPrice;

    @Column(name = "status", nullable = false)
    private String status;

    // Getters and Setters
    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
