package com.ames.MySpringBootDemo.controller;

import com.ames.MySpringBootDemo.bean.Order;
import com.ames.MySpringBootDemo.http.Response;
import com.ames.MySpringBootDemo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;

//    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @GetMapping
    public List<Order> getAll() {
        return orderService.getAll();
    }

    @GetMapping("/{id}")
    public Order getById(@PathVariable int id) {
        return orderService.getOrderById(id);
    }

    @PostMapping
    public Response save(@RequestBody Order order) {
        return orderService.save(order);
    }

    @PutMapping
    public Response update(@RequestBody Order order) {
        return orderService.edit(order);
    }

    @DeleteMapping("/{id}")
    public Response delete(@PathVariable int id) {
        System.out.println("Order: " + id + " is fake deleted!");
        return new Response(true, "Order: " + id + " is fake deleted!");
    }
}
