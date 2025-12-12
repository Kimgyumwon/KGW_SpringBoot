package com.kgw.app.board.qna;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.board.BoardFileDTO;
import com.kgw.app.board.notice.NoticeDTO;
import com.kgw.app.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Value("${category.board.qna}")
	private String category;
	
	@ModelAttribute("category")
	public String getCategory() {
		return this.category;
	}
	
	
	
	
	
	
	
	@GetMapping("list")
	public String list(Model model, Pager pager) throws Exception {
		List<BoardDTO> list =  qnaService.list(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "board/list";
	}
	
	@GetMapping("detail")
	public String detail(Model model,QnaDTO qnaDTO) throws Exception {
		BoardDTO boardDTO = qnaService.detail(qnaDTO);
		model.addAttribute("board", boardDTO);
		return "board/detail";
	}
	
	@GetMapping("add")
	public String add(Model model) throws Exception {
		model.addAttribute("kind", "ADD");

		return "board/add";
	}
	
	
	@PostMapping("add")
	public String add(QnaDTO qnaDTO , MultipartFile[] attach) throws Exception {
		qnaDTO.setBoardRef(0L);
		qnaDTO.setBoardStep(0L);
		qnaDTO.setBoardDepth(0L);
		int result = qnaService.add(qnaDTO, attach);
		return "redirect:./list";
	}
	
	
	@GetMapping("reply")
	public String reply(QnaDTO qnaDTO, Model model) throws Exception {
		model.addAttribute("board", qnaDTO);
		model.addAttribute("kind", "Reply");
		return "board/add";
	}
	
	@PostMapping("reply")
	public String reply(QnaDTO qnaDTO) throws Exception {
		int result = qnaService.reply(qnaDTO);
		
		return "redirect:./list";
	}
	
	
	
	@GetMapping("update")
	public String update(QnaDTO qnaDTO, Model model) throws Exception {
		BoardDTO boardDTO = qnaService.detail(qnaDTO);
		model.addAttribute("board", boardDTO);
		model.addAttribute("kind", "UPDATE");
		return "board/add";
	
	}
	
	@PostMapping("update")
	public String update(QnaDTO qnaDTO) throws Exception {
		qnaService.update(qnaDTO);
		
		return "redirect:./list";
	}
	
	
	@PostMapping("delete")
	public String delete(QnaDTO qnaDTO, Model model) throws Exception {
		int result = qnaService.delete(qnaDTO);
		String msg = "삭제 실패 ㅠㅠ";
		if (result == 0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "./list");
			return "commons/result";
		}
		return "redirect:./list";
	}
	
	@GetMapping("fileDown")
	public void fileDown(BoardFileDTO boardFileDTO) throws Exception {
		boardFileDTO = qnaService.fileDetail(boardFileDTO);
	}
	
	
	//예외 처리 전문 메서드
	@ExceptionHandler(NullPointerException.class)
	public String exc1(Model model) {
		return "error/error_page";
	}
	
	
	
	
}
