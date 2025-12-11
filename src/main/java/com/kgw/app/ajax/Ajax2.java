package com.kgw.app.ajax;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Ajax2 {
	
	
	private WebClient client;
	
	
	public Ajax2() {
		 client = WebClient
				.builder()
				.baseUrl("https://jsonplaceholder.typicode.com/")
				.build()
				;
	}
	
	public void t3() throws Exception {
		List<PostDTO> list = client
					.get()
					.uri("posts")
					.retrieve()
					.bodyToFlux(PostDTO.class)
					.collectList()
					.block()
					;
		
//		Iterator<PostDTO> it = list.iterator();
//		while (it.hasNext()) {
//			log.info("{}" , it.next());
//			
//			
//		}
		
		
		
	}
	
	public void t2() throws Exception {
	PostDTO dto = client
				.get()
				.uri("posts/2")
				.retrieve()
				.bodyToMono(PostDTO.class)
				.block();
	log.info("{}" , dto);

		
	}
	
	
	public void t1() throws Exception {
	PostDTO dto =	client
					.get()
					.uri("posts/1")
					.retrieve()
					.bodyToMono(PostDTO.class)
					.block()
					;
			
		log.info("{}" , dto);
	}
	
	
	
}
