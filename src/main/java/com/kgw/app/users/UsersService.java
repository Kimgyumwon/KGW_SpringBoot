package com.kgw.app.users;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.kgw.app.files.FileManager;

@Service
public class UsersService {
	
	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.users}")
	private String uploadPath;
	
	// 회원가입
	public int resgister(UsersDTO usersDTO, MultipartFile attach) throws Exception {
		File file = new File(uploadPath);
		
		int result = usersDAO.register(usersDTO);
		
		if (attach == null || attach.isEmpty()) {
			return result;
		}
		
		String fileName = fileManager.fileSave(file, attach);
		UsersFileDTO usersFileDTO = new UsersFileDTO();
		usersFileDTO.setFileName(fileName);
		usersFileDTO.setFileOrigin(attach.getOriginalFilename());
		usersFileDTO.setUsername(usersDTO.getUsername());
		usersDAO.userFileAdd(usersFileDTO);
		
		return result;
	}
	
	// 로그인
	public UsersDTO login(UsersDTO usersDTO) throws Exception {
		return usersDAO.login(usersDTO);
	}
	
	
	
	// 마이페이지
	public UsersDTO detail(UsersDTO usersDTO) throws Exception {
		return usersDAO.detail(usersDTO);
	}
	
	public boolean getError(UsersDTO usersDTO , BindingResult bindingResult) throws Exception {
		// check : true -> 검증 실패 , error 존재
		// check : false -> 검증 성공 , error 존재 X
		//1. annotation 검증 결과
		boolean check = bindingResult.hasErrors();
		
		//2. password 일치 하는지 검증
		if (!usersDTO.getPassword().equals(usersDTO.getPasswordCheck())) {
			check = true;
			//bindingResult.rejectValue("passwordCheck", "properties의 키값");
			bindingResult.rejectValue("passwordCheck", "user.password.equal");
		}
		
		//3. Id 중복 체크
		if (usersDTO.getUsername() != null) {
			if( usersDAO.detail(usersDTO) != null ) {
				check = true;
				bindingResult.rejectValue("username", "user.id.check");
			}
		}
		return check;
	}
	
	public int update(UsersDTO usersDTO) throws Exception {
		return usersDAO.update(usersDTO);
	}
	
	
}
