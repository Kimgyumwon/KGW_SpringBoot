package com.kgw.app.board.qna;


import com.kgw.app.board.BoardDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaDTO extends BoardDTO {
	
	private Long boardRef;
	private Long boardStep;
	private Long boardDepth;
	
	
}
