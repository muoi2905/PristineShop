package com.devpro.shop16;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication /* phải có */
@EnableTransactionManagement
public class StartServer {

	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);

	}

}
