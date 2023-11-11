package com.ames.MySpringBootDemo.bean;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "AMES_ORDER")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
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

}
