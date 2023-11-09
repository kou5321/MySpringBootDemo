package com.ames.MySpringBootDemo.bean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "AMES_PRODUCT")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class Product {
    @Id
    private int id;
    @Column
    private String name;
    @Column
    private String brand;
    @Column
    private int price;
    @Column
    private int stock;
    @Column
    private String image;
}
