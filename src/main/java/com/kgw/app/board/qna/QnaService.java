package com.kgw.app.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.board.BoardService;
import com.kgw.app.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int add(BoardDTO boardDTO) throws Exception {
		qnaDAO.add(boardDTO);
		return qnaDAO.refUpdate(boardDTO);
	}

	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		
		Long totalCount = qnaDAO.count(pager);
		pager.pageing(totalCount);
		
		return qnaDAO.list(pager);
	}
	

	
	
	
}