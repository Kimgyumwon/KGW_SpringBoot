package com.kgw.app.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kgw.app.util.Pager;

@Mapper
public interface QnaDAO {
	
	// 추가
	public int add(QnaDTO qnaDTO) throws Exception;
	
	// 목록
	public List<QnaDTO> list(Pager pager) throws Exception;
	
	// 목록의 갯수
	public Long count(Pager pager) throws Exception;
	// ref값을 기본키랑 똑같이 맞춰주는 메서드
	public int refUpdate(QnaDTO qnaDTO) throws Exception;
	
	
}
