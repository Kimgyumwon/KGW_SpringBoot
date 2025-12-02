package com.kgw.app.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	
	
	@GetMapping("register")
	public void register() {}
	
	@PostMapping("register")
	public String register(UsersDTO usersDTO,MultipartFile attach, Model model) throws Exception {
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
	public void detail(UsersDTO usersDTO,Model model) throws Exception {
		usersDTO =  usersService.detail(usersDTO);
		model.addAttribute("user", usersDTO);
	}
	
	
	
}
