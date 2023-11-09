package com.ames.MySpringBootDemo.dao;

import com.ames.MySpringBootDemo.bean.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDao extends JpaRepository<Order, Integer> {
}
