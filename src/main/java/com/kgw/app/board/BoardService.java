package com.kgw.app.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kgw.app.util.Pager;

public interface BoardService {
	
	//조회
	public BoardDTO detail(BoardDTO boardDTO) throws Exception;
	
	//리스트
	public List<BoardDTO> list(Pager pager) throws Exception;
	
	//수정
	public int update(BoardDTO boardDTO) throws Exception;
	
	//삭제
	public int delete(BoardDTO boardDTO) throws Exception;
	
	//추가
	public int add(BoardDTO boardDTO , MultipartFile[] attach) throws Exception;
}
