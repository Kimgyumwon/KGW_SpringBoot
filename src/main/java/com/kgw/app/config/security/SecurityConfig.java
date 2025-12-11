package com.kgw.app.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.kgw.app.users.UserDetailServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	@Autowired
	private LoginFailHandler loginFailHandler;
	
	@Autowired
	private LogoutSucess logoutSucess;
	
	@Autowired
	private Logout logout;
	
	@Autowired
	private UserDetailServiceImpl detailServiceImpl;
	
	// 정적자원들을 Security에서 제외
	@Bean
	WebSecurityCustomizer customizer() {
		
		return web -> {
			web
				.ignoring()
					.requestMatchers("/css/**")
					.requestMatchers("/images/**" , "/img/**" , "/js/**" , "/vendor/**");
		};
		
	}
	
	// 인증과 인가에 관한 설정
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity security) throws Exception {
		
		security
			.cors( (cors)->{cors.disable();} )
			.csrf( (csrf) -> {csrf.disable();} )
			
			//인가에 관한 설정
			.authorizeHttpRequests((auth)->{
				auth
					.requestMatchers("/notice/add" , "/notice/update" , "/notice/delete")
					.hasRole("ADMIN")
					.requestMatchers("/product/add" , "/product/update" , "/product/delete")
					.hasAnyRole("MANAGER","ADMIN")
					.requestMatchers("/product/**")
					.authenticated()
					.requestMatchers("/users/detail" , "/users/change" , "/users/logout")
					.authenticated()
					.anyRequest()
					.permitAll();
			})
			//Login form과 그외 관련 설정
			.formLogin((form) -> {
				form
					//로그인폼 jsp 경로와 로그인 처리 url 작성
					.loginPage("/users/login")
					//.usernameParameter(null)
					//.passwordParameter(null)
					.successHandler(loginSuccessHandler)
					//.defaultSuccessUrl("/")
					//.failureUrl("/")
					.failureHandler(loginFailHandler)
					;
			})
			
			.logout((logout)->{
				logout
					.logoutUrl("/users/logout")
					//.logoutSuccessUrl("/")
					.addLogoutHandler(this.logout)
					.logoutSuccessHandler(logoutSucess)
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID")
					;
			})
			.rememberMe(remember->{
				remember
					.rememberMeParameter("rememberme")
					.tokenValiditySeconds(60)
					.key("rememberkey")
					.userDetailsService(detailServiceImpl)
					.authenticationSuccessHandler(loginSuccessHandler)
					.useSecureCookie(true)
					;
			})
			.sessionManagement(session->{
				session
					.invalidSessionUrl("/")
					.maximumSessions(1)
					.maxSessionsPreventsLogin(true)
					;
			})
			.oauth2Login(t->{
				t.userInfoEndpoint(s->{
					s.userService(detailServiceImpl);
				});
				
			})
			
			
			
			;
			
		return security.build();
	}
	
	@Bean
	PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}
