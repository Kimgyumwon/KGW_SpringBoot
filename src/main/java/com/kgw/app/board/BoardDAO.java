package com.kgw.app.board;

import java.util.List;

import com.kgw.app.util.Pager;

public interface BoardDAO {
	//조회
	public BoardDTO detail(BoardDTO boardDTO) throws Exception;
	
	//리스트
	public List<BoardDTO> list(Pager pager) throws Exception;
	
	//수정
	public int update(BoardDTO boardDTO) throws Exception;
	
	//삭제
	public int delete(BoardDTO boardDTO) throws Exception;
	
	//추가
	public int add(BoardDTO boardDTO) throws Exception;
	
	//리스트 개수
	public Long count(Pager pager) throws Exception;
	
	//파일 추가
	public int fileAdd(BoardFileDTO boardFileDTO) throws Exception; 
}
