package com.kgw.app.board.notice;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.board.BoardFileDTO;
import com.kgw.app.util.Pager;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;
	
	@Value("${category.board.notice}")
	private String category;
	
	@ModelAttribute("category")
	public String getCategory() {
		return this.category;
	}
	
	
	@GetMapping("list")
	public String list(Pager pager, Model model) throws Exception {
		List<BoardDTO> list = noticeService.list(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "board/list";
	}
	
	@GetMapping("add")
	public String add(Model model,@ModelAttribute("board") NoticeDTO noticeDTO) {
		model.addAttribute("kind", "ADD");
		return "board/add";
	}
	
	@PostMapping("add")
	public String add(@ModelAttribute("board") @Valid NoticeDTO noticeDTO,BindingResult bindingResult , MultipartFile[] attach , Model model) throws Exception {

		if (bindingResult.hasErrors()) {
			return "board/add";
		}
		
		int result = noticeService.add(noticeDTO , attach);
		String msg = "실패했습니다 ㅠㅠ";
		if (result == 0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "./list");
			return "commons/result";
		}
		return "redirect:./list";
	}
	
	@GetMapping("detail")
	public String detail(BoardDTO boardDTO, Model model) throws Exception {
		boardDTO = noticeService.detail(boardDTO);
		String msg = "조회된 글이 없습니다 ㅠㅠ;;";
		if (boardDTO == null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "./list");
			return "commons/result";
		}
		model.addAttribute("board", boardDTO);
		return "board/detail";
	}
	
	@PostMapping("delete")
	public String delete(NoticeDTO noticeDTO, Model model) throws Exception {
		int result = noticeService.delete(noticeDTO);
		String msg = "삭제 실패 ㅠㅠ";
		if (result == 0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/notice/list");
			return "commons/result";
		}
		return "redirect:/notice/list";
	}
	
	@GetMapping("update")
	public String update(NoticeDTO noticeDTO, Model model) throws Exception {
		BoardDTO boardDTO = noticeService.detail(noticeDTO);
		model.addAttribute("board", boardDTO);
		model.addAttribute("kind", "UPDATE");
		return "board/add";
	}
	
	@PostMapping("update")
	public String update(NoticeDTO noticeDTO) throws Exception {
		noticeService.update(noticeDTO);
		
		return "redirect:./list";
	}
	
	@GetMapping("fileDown")
	public String fileDown(BoardFileDTO boardFileDTO, Model model) throws Exception {
		boardFileDTO = noticeService.fileDetail(boardFileDTO);
		model.addAttribute("file", boardFileDTO);
		
		
		return "fileDownView";
	}
	
	
	
	
	
	
	
	
}
