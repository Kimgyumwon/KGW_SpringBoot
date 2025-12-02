package com.kgw.app.users;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
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
	
	// 마이페이지
	public UsersDTO detail(UsersDTO usersDTO) throws Exception {
		return usersDAO.detail(usersDTO);
	}
	
	
	
}
