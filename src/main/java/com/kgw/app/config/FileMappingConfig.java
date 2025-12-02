package com.kgw.app.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class FileMappingConfig implements WebMvcConfigurer {
	
	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.upload.url}")
	private String urlPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
			.addResourceHandler(urlPath)
			.addResourceLocations(uploadPath);
	}
	
	
	
//	@Bean
//	FileManager getFileManager() {
//		return new FileManager();
//	}
	
}
