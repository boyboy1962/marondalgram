package com.marondalgram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.marondalgram.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")	// http://localhost/images/qwer_160208950293/apple.png
		.addResourceLocations(FileManagerService.FILE_UPLOAD_PATH);	// 실제 파일 저장 위치
	}
}
