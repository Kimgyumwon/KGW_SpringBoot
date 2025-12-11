package com.kgw.app.ajax;

import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AjaxTest1 {
	
	
	public void t3() throws Exception {
		RestTemplate template = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.APPLICATION_JSON);
		//headers.add("Content-type", "application/json; charset=UTF-8");
		
		PostDTO request = new PostDTO();
    request.setTitle("key");
    request.setBody("key body");
    request.setUserId(5);
		
		
		
		
    HttpEntity<PostDTO> entity = new HttpEntity<>(request, headers);
		
		
		
		PostDTO dto = template.postForObject("https://jsonplaceholder.typicode.com/posts", entity, PostDTO.class);
		log.info("{}" , dto);
		
		
	}
	
	
	
	
	
	
	
	public void t2() throws Exception {
		RestTemplate template = new RestTemplate();
		
		List<PostDTO> list = template.getForObject("https://jsonplaceholder.typicode.com/posts", List.class );
		
		
		for (int i = 0 ; i < list.size() ; i++) {
			log.info("{}" , list.get(i));
		}
	}
	
	
	//1. RestTemplate
	public void t1() throws Exception{
		log.info("Ajax1");
		//1. RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		//2. Header설정
		
		
		//3. parameter설정
		
		
		
//	 ResponseEntity<String> entity =	restTemplate.getForEntity("https://jsonplaceholder.typicode.com/posts/1",String.class);
//	 String body = entity.getBody();

	 PostDTO dto =	restTemplate.getForObject("https://jsonplaceholder.typicode.com/posts/2",PostDTO.class);
	 
	 log.info("{}" ,dto);
		
	}
	
	
}
