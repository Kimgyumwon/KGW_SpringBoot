package com.kgw.app.product;

import com.kgw.app.board.CommentDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductCommentDTO extends CommentDTO {
	
	private Long productNum;
	private String username;
	
}
