package com.kgw.app.users;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UsersDTO implements UserDetails, OAuth2User{
	
	@Size(max = 10, min = 5 , groups = {RegisterGroup.class})
	private String username;
	@Pattern(regexp = "^(?=(.*[A-Z]){0,})(?=(.*[a-z]){0,})(?=(.*\\d){0,})(?=(.*[\\W_]){0,})(?=(?:.*[A-Z].*[a-z]|.*[A-Z].*\\d|.*[A-Z].*[\\W_]|.*[a-z].*\\d|.*[a-z].*[\\W_]|.*\\d.*[\\W_]).*).{8,}$"
			, groups = {RegisterGroup.class , PasswordGroup.class})
	private String password;
	
	private String passwordCheck;
	
	
	@NotBlank(groups = {RegisterGroup.class , UpdateGroup.class})
	private String name;
	@Email(groups = {RegisterGroup.class , UpdateGroup.class})
	@NotBlank(groups = {RegisterGroup.class})
	private String email;
	@NotBlank(groups = {RegisterGroup.class , UpdateGroup.class})
	private String phone;
	@Past(groups = {RegisterGroup.class , UpdateGroup.class})
	private LocalDate birth;
	
	private List<RoleDTO> roleDTOs;
	
	private UsersFileDTO usersFileDTO;
	
	//UserDetail
	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;
	private boolean enabled;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> list = new ArrayList<>();
		for (int i = 0; i < roleDTOs.size(); i++) {
			GrantedAuthority g = new SimpleGrantedAuthority(roleDTOs.get(i).getRoleName());
			list.add(g);
		}
		
		return list;
	}





	// OAuth2User
	private Map<String, Object> attributes;
	private String sns;
	
	
	
}
