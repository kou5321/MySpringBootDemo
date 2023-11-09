package com.ames.MySpringBootDemo;

import lombok.Data;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@SpringBootApplication
@EnableCaching
@EntityScan
public class MySpringBootDemoApplication {

	@RequestMapping("/")
	String home() {
		return "hello world";
	}

	public static void main(String[] args) {
		SpringApplication.run(MySpringBootDemoApplication.class, args);
	}


}
