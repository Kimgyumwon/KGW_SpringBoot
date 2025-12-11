package com.kgw.app.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Value("${spring.security.oauth2.client.registration.kakao.client-secret}")
	private String adminKey;
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private UserDetailServiceImpl detailServiceImpl;
	
	@GetMapping("register")
	public String register(@ModelAttribute("dto") UsersDTO usersDTO) {
		return "users/register";
	}
	
	@PostMapping("register")
	public String register(@ModelAttribute("dto") @Validated(RegisterGroup.class) UsersDTO usersDTO
			,BindingResult bindingResult
			,MultipartFile attach, Model model) throws Exception {
		
		if (usersService.getError(usersDTO, bindingResult)) {
			return "users/register";
		}
		
		int result = usersService.resgister(usersDTO , attach);
		String msg = "회원가입 완료 ^^";
		if (result == 0) {
			msg = "회원가입 실패 ㅠㅠ";
			model.addAttribute("msg", msg);
			model.addAttribute("path", "/");
			return "commons/result";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/");
		return "commons/result";
		
	}
	
	@GetMapping("detail")
	public void detail(@AuthenticationPrincipal UsersDTO userDTO , Model model) throws Exception {
		model.addAttribute("user", userDTO);
	}
	
	@GetMapping("login")
	public String login(HttpSession session) throws Exception {
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		
		if (obj != null) {
			return "redirect:/";
		}
		return "users/login";
	}
	
	@PostMapping("update")
	public String update(@Validated(UpdateGroup.class) @ModelAttribute UsersDTO usersDTO , BindingResult bindingResult
					, Model model ) throws Exception {
		if (bindingResult.hasErrors()) {
			usersDTO = usersService.detail(usersDTO);
			model.addAttribute("user", usersDTO);
			return "users/detail";
		}
		
		int result = usersService.update(usersDTO);
		if (result > 0) {
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			UserDetails updateUser = detailServiceImpl.loadUserByUsername(usersDTO.getUsername());
			UsernamePasswordAuthenticationToken to = new UsernamePasswordAuthenticationToken(
						updateUser,
						authentication.getCredentials(),
						updateUser.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(to);
			
		}
		
		return "redirect:/";
	}
	
	
	@GetMapping("change")
	public void change(UsersDTO usersDTO) throws Exception {
		
	}
	
	@PostMapping("change")
	public String change(@Validated(PasswordGroup.class) UsersDTO usersDTO, BindingResult bindingResult ,String exist) throws Exception {
		if (usersService.getError(usersDTO, bindingResult)) {
			return "users/change";
		}
		
		return "redirect:./detail";
	}
	
	@GetMapping("delete")
	public String delete(Authentication authentication) throws Exception {
		//1. 일반회원
		
		//로그아웃 진행
		
		//2. 소셜 로그인
		//DB에서 작업
		WebClient client = WebClient.create();
		
		String result = client
						.post()
						.uri("https://kapi.kakao.com/v1/user/unlink")
						.header("Authorization", "KakaoAK "+adminKey)
						.header("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
						.body(
								BodyInserters.fromFormData("target_id_type", "user_id")
									.with("target_id", authentication.getName())
						)
						.retrieve()
						.bodyToMono(String.class)
						.block()
						;
		System.out.println(result);
		return "redirect:./logout";
	}
	
	
}
