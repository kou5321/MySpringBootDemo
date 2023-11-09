package com.ames.MySpringBootDemo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
public class TestController {
    @Value("${myApp.location}")
    private String location;

    @RequestMapping(value="/foo", method = RequestMethod.GET)
    public String foo() {
        return location;
    }

    @GetMapping("/bar")
    public void bar() {
        System.out.println("bar");
    }

    @GetMapping("/add")
    @Cacheable("abc")
    public int add(@RequestParam int x, @RequestParam int y) {
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return x + y;
    }

    @GetMapping("/mul/{x}/{y}")
    @Cacheable("abcd")
    public int mul(@PathVariable int x, @PathVariable int y) {
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return x * y;
    }



}
