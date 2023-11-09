package com.ames.MySpringBootDemo.service;

import com.ames.MySpringBootDemo.bean.Order;
import com.ames.MySpringBootDemo.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    public Order getOrder(int id) {
        return orderDao.findById(id).get();
    }
}
