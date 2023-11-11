package com.ames.MySpringBootDemo.dao;

import com.ames.MySpringBootDemo.bean.OrderProduct;
import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderProductDao extends JpaRepository<OrderProduct, Integer>{

}
