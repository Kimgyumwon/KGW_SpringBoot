package com.kgw.app.board.notice;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;

	@GetMapping("list")
	public void list(Pager pager, Model model) throws Exception {
		List<BoardDTO> list = noticeService.list(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
	}
	
	@GetMapping("add")
	public void add() {}
	
	@PostMapping("add")
	public String add(NoticeDTO noticeDTO, Model model) throws Exception {
		int result = noticeService.add(noticeDTO);
		String msg = "실패했습니다 ㅠㅠ";
		if (result == 0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/notice/list");
			return "commons/result";
		}
		return "redirect:/notice/list";
	}
	
	@GetMapping("detail")
	public String detail(BoardDTO boardDTO, Model model) throws Exception {
		boardDTO = noticeService.detail(boardDTO);
		String msg = "조회된 글이 없습니다 ㅠㅠ;;";
		if (boardDTO == null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/notice/list");
			return "commons/result";
		}
		model.addAttribute("notice", boardDTO);
		return "notice/detail";
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
	
	
	
	
}
