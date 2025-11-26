package com.kgw.app.board.qna;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgw.app.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public void list(Model model, Pager pager) throws Exception {
		List<QnaDTO> list =  qnaService.list(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
	}
	
	
	public void add() throws Exception {
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setBoardTitle("방어");
		qnaDTO.setBoardContents("웨이팅");
		qnaDTO.setBoardWriter("길다");
		qnaDTO.setBoardRef(0L);
		qnaDTO.setBoardStep(0L);
		qnaDTO.setBoardDepth(0L);
		
		qnaService.add(qnaDTO);
	}
	
	
}
