package com.ames.MySpringBootDemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    @RequestMapping("/foo")
    @ResponseBody
    public void foo() {
        System.out.println("foo");
    }
}
