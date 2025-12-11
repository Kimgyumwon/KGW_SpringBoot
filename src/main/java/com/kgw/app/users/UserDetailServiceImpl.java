package com.kgw.app.users;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserDetailServiceImpl extends DefaultOAuth2UserService implements UserDetailsService {
	
	@Autowired
	private UsersDAO userDAO;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		
		String sns = userRequest.getClientRegistration().getClientName();
		log.info(sns);
		UsersDTO user = null;
		if(sns.toUpperCase().equals("KAKAO")) {
			user =  this.useKakao(userRequest);
			user.setSns(sns);
		}
		
		return user;
	}
	
	private UsersDTO useKakao(OAuth2UserRequest auth2UserRequest) {
		OAuth2User user = super.loadUser(auth2UserRequest);
		log.info("name : {} " , user.getName());
		log.info("attr : {} " , user.getAttributes());
		log.info("auth : {} " , user.getAuthorities());
		Map<String, Object> attr = user.getAttribute("properties");
		
		UsersDTO userDTO = new UsersDTO();
		userDTO.setUsername(user.getName());
		try {
			userDTO = userDAO.detail(userDTO);
			if (userDTO == null) {
				userDTO = new UsersDTO();
				userDTO.setUsername(user.getName());
				userDTO.setPassword("kakao");
				userDTO.setName(attr.get("nickname").toString());
				userDAO.register(userDTO);
				UsersFileDTO usersFileDTO = new UsersFileDTO();
				usersFileDTO.setFileName(attr.get("profile_image").toString());
				usersFileDTO.setUsername(user.getName());
				userDAO.userFileAdd(usersFileDTO);
				userDTO.setUsersFileDTO(usersFileDTO);
				userDAO.roleAdd(userDTO);
				
				userDTO = userDAO.detail(userDTO);
			}
			//로그인성공 또는 가입 후 공통 진행
			userDTO.setAttributes(attr);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userDTO;
		
	}
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersDTO userDTO = new UsersDTO();
		userDTO.setUsername(username);
		UserDetails userDetails;
		try {
			userDetails = userDAO.detail(userDTO);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException(username);
		}
		return userDetails;
	}

}