package com.plantopia.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        // /img/store/** 로 들어온 요청을 실제 디스크 경로에 매핑
	        registry.addResourceHandler("/img/store/**")
	                .addResourceLocations("file:///C:/upload/img/store/");  // ← 실제 저장된 경로
	        
	        // plant 이미지
	        registry.addResourceHandler("/img/plant/**") // 상대 경로
	                .addResourceLocations("file:///C:/Springboot/Plantopia/src/main/resources/static/img/plant/"); // 실제 경로

	        // plantClinic 이미지
	        registry.addResourceHandler("/img/plantClinic/**")
	                .addResourceLocations("file:///C:/Springboot/Plantopia/src/main/resources/static/img/plantClinic/");
	 }
}
