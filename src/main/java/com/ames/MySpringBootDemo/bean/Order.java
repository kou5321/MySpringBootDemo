package com.ames.MySpringBootDemo.bean;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "AMES_ORDER")
@Data
public class Order {
    @Id
    @SequenceGenerator(name = "ames_order_seq_gen", sequenceName = "AMES_ORDER_SEQ", allocationSize = 1)
    @GeneratedValue(generator = "ames_order_seq_gen", strategy = GenerationType.AUTO)
    private int id;
    @Column
    private Date purchaseDate;
    @Column
    private int userId;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "order")
    private List<OrderProduct> purchases;

    public Order() {
    }

    public Order(int id, Date purchaseDate, int userId, List<OrderProduct> purchases) {
        this.id = id;
        this.purchaseDate = purchaseDate;
        this.userId = userId;
        this.purchases = purchases;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<OrderProduct> getPurchases() {
        return purchases;
    }

    public void setPurchases(List<OrderProduct> purchases) {
        this.purchases = purchases;
    }
}
