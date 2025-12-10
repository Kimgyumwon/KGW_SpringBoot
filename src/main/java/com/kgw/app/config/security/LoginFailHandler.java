package com.kgw.app.config.security;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginFailHandler implements AuthenticationFailureHandler{
	
		@Override
		public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
				AuthenticationException exception) throws IOException, ServletException {
			// TODO Auto-generated method stub
			String message = "로그인 실패";
			if (exception instanceof AccountExpiredException) {
				message = "사용자 계정의 유효 기간이 만료 되었습니다.";
			} else if (exception instanceof LockedException) {
				message = "사용자 계정이 잠겨 있습니다.";
			} else if (exception instanceof CredentialsExpiredException) {
				message = "자격 증명 유효 기간이 만료되었습니다.";
			} else if (exception instanceof DisabledException) {
				message = "휴면 계정입니다.";
			} else if (exception instanceof BadCredentialsException) {
				message = "비밀번호가 틀림.";
			} else if (exception instanceof InternalAuthenticationServiceException) {
				message = "아이디가 틀림.";
			}
			
			message = URLEncoder.encode(message , "UTF-8");
			response.sendRedirect("./login?message=" + message);
			
			
		}
	
	
}
