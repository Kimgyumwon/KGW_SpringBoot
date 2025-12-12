package com.kgw.app.home;

import java.security.Principal;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kgw.app.users.UsersDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@GetMapping("/")
	public String home() throws Exception {
		
		return "index";
	}
	
	
	
	public String index5(@AuthenticationPrincipal UsersDTO userDTO) throws Exception {
		//Spring boot 3.2 이상 부터 가능
		System.out.println(userDTO);
		return "index";
	}
	
	
	
	public String index4(Principal principal) throws Exception {
		UsersDTO userDTO = (UsersDTO)principal;
		System.out.println(userDTO);
		return "index";
	}
	
	
	
	
	public String index3(Authentication authentication) throws Exception {
		UsersDTO userDTO = (UsersDTO)authentication.getPrincipal();
		System.out.println(userDTO);
		return "index";
		
	}
	
	
	
	
	public String index2() throws Exception{
		Object obj = SecurityContextHolder.getContext().getAuthentication();
		
		Authentication authentication = (Authentication)obj;
		
		UsersDTO userDTO = (UsersDTO)authentication.getPrincipal();
		
		
		return "index";
	}
	
	
	
	
	public String home(HttpSession session) throws Exception {
		//1. 
		SecurityContextImpl contextImpl  = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = contextImpl.getAuthentication();
		
		UsersDTO userDTO = (UsersDTO) authentication.getPrincipal();
		System.out.println(userDTO.getUsername());
		System.out.println(authentication.getName());
		
		return "index";
	}
	
}
