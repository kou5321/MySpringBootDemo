package com.ames.MySpringBootDemo.service;

import com.ames.MySpringBootDemo.bean.Order;
import com.ames.MySpringBootDemo.bean.OrderProduct;
import com.ames.MySpringBootDemo.bean.Product;
import com.ames.MySpringBootDemo.dao.OrderDao;
import com.ames.MySpringBootDemo.dao.OrderProductDao;
import com.ames.MySpringBootDemo.dao.ProductDao;
import com.ames.MySpringBootDemo.http.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class OrderService {
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private ProductDao productDao;

    @Autowired
    private OrderProductDao orderProductDao;

    public List<Order> getAll(){
        return orderDao.findAll();
    }

    public Order getOrderById(Integer id) {
        return orderDao.findById(id).get();
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public Response save(Order order) {
        // Spring transaction will automatically roll back if exception out.
        try {
            List<OrderProduct> purchases = order.getPurchases();
            purchases.forEach((orderProduct) -> {
                // enrich the product object
                Product product = (Product) productDao.findById(orderProduct.getProduct().getId()).get();
                orderProduct.setProduct(product);

                orderProduct.setOrder(order);
            });

            //orderHistoryDao.save(order);
            orderDao.save(order);

            return new Response(true);
        } catch (Exception e) {
            return new Response(false);
        }
    }

    public Response edit(Order order) {
        try {
            Order o = (Order) orderDao.findById(order.getId()).get();

            List<OrderProduct> purchasesToRemove = o.getPurchases();

            List<OrderProduct> purchases = order.getPurchases();
            // handled update and add products in order
            purchases.forEach((orderProduct) -> {
                Product product = (Product) productDao.findById(orderProduct.getProduct().getId()).get();
                orderProduct.setProduct(product);
                orderProduct.setOrder(o);
            });

            // handle remove products in order
            if(purchases.size() > 0) {
                purchasesToRemove = purchasesToRemove.stream().filter((orderProduct) -> {
                    return !purchases.contains(orderProduct);
                }).collect(Collectors.toList());
            }

            o.setPurchases(purchases);

            orderDao.save(o);

            deleteOrderProducts(purchasesToRemove);

            return new Response(true);
        } catch (Exception e) {
            System.out.println(e);
            return new Response(false);
        }
    }

    public void deleteOrderProducts(List<OrderProduct> purchases) {
        orderProductDao.deleteAll(purchases);
    }

}
