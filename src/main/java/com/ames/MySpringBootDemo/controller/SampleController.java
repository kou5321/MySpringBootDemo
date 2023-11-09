package com.ames.MySpringBootDemo.controller;

import com.ames.MySpringBootDemo.bean.Sample;
import com.ames.MySpringBootDemo.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/samples")
public class SampleController {
    @Autowired
    private SampleService sampleService;

    @GetMapping("/{name}")
    public Sample getSample(@PathVariable String name) {
        return sampleService.getSample(name);
    }
}
