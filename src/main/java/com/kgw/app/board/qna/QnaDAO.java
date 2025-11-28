package com.kgw.app.board.qna;



import org.apache.ibatis.annotations.Mapper;

import com.kgw.app.board.BoardDAO;
import com.kgw.app.board.BoardDTO;

@Mapper
public interface QnaDAO extends BoardDAO {
	
	
	
	// ref값을 기본키랑 똑같이 맞춰주는 메서드
	public int refUpdate(BoardDTO boardDTO) throws Exception;
	
	
}
