package com.ames.MySpringBootDemo.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "AMES_ORDER_PRODUCT")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class OrderProduct {
    @Id
    private int id;
    @Column
    private int qty;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.DETACH)
    private Order order;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.DETACH)
    private Product product;

}
