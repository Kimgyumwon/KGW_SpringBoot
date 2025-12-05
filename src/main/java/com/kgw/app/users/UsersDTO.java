package com.kgw.app.users;

import java.time.LocalDate;

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
public class UsersDTO {
	
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
	
	private UsersFileDTO usersFileDTO;
	
	
}
