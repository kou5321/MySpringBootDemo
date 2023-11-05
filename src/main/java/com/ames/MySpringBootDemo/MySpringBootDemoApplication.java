package com.ames.MySpringBootDemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MySpringBootDemoApplication {

	@RequestMapping("/")
	String home() {
		return "hello, world!";
	}

	public static void main(String[] args) {
		SpringApplication.run(MySpringBootDemoApplication.class, args);
	}

}
