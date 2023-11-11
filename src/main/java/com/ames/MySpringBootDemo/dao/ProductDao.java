package com.ames.MySpringBootDemo.dao;

import java.util.List;
import com.ames.MySpringBootDemo.bean.Product;
import org.springframework.cache.annotation.CachePut;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RestResource;

public interface ProductDao extends JpaRepository<Product, Integer> {

    public Product findByName(String name);

    public List<Product> findByBrand(String brand);

    @Query("select p from Product p where p.price = :price")
    public Product getByPrice(@Param("price") int price);

}
