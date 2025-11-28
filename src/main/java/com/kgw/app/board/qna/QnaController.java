package com.kgw.app.board.qna;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public void list(Model model, Pager pager) throws Exception {
		List<BoardDTO> list =  qnaService.list(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
	}
	
	
	
	@GetMapping("add")
	public void add() throws Exception {}
	
	
	
	@PostMapping("add")
	public String add(QnaDTO qnaDTO) throws Exception {
		int result = qnaService.add(qnaDTO);
		return "redirect:/qna/list";
	}
	
	
}
