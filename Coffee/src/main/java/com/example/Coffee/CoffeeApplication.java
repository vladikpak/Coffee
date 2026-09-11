package com.example.Coffee;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
//@EnableRabbit
public class CoffeeApplication {
	public static void main(String[] args) {
		SpringApplication.run(CoffeeApplication.class, args);
	}
}
