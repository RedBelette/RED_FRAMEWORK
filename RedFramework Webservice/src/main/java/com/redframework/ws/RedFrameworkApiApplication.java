package com.redframework.ws;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Run this main class to deploy the web service every where.
 * Thanks to spring boot ;-)
 * 
 * @author RedBelette
 * @since 1.0.0.
 */
@SpringBootApplication
public class RedFrameworkApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(RedFrameworkApiApplication.class, args);
	}
}
