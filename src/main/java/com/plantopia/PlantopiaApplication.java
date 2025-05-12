package com.plantopia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

@SpringBootApplication
public class PlantopiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(PlantopiaApplication.class, args);
//		String enc = PasswordEncoderFactories.createDelegatingPasswordEncoder().encode("admin1234");
//		System.out.println(enc);
	}

}
