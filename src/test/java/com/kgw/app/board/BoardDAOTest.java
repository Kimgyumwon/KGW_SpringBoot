package com.kgw.app.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class BoardDAOTest {
	
	@Autowired
	private BoardDAO boardDAO;
	
//	@Test
//	void testDetail() throws Exception {
//		BoardDTO boardDTO = new BoardDTO();
//		boardDTO.setNum(3L);
//		
//		boardDTO = boardDAO.detail(boardDTO);
//		//log.info(boardDTO.toString());
//		
//		assertNotNull(boardDTO);
//	}

//	@Test
//	void testAdd() throws Exception {
//		BoardDTO boardDTO = new BoardDTO();
//		boardDTO.setWriter("spring");
//		boardDTO.setTitle("boot");
//		boardDTO.setContents("test");
//		
//		int result = boardDAO.add(boardDTO);
//		assertEquals(1,result);
//	}
	
//	@Test
//	void testList() throws Exception {
//		List<BoardDTO> list = boardDAO.list();
//		assertNotEquals(0, list.size());
//	}
	
//		@Test
//		void testDelete() throws Exception {
//			
//			int result = boardDAO.delete(9L);
//			assertNotEquals(0, result);
//		}
	
		@Test
		void testUpdate() throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("t", "update T");
			map.put("c", "update C");
			map.put("n", 796L);
			int result = boardDAO.update(map);
			
			assertEquals(1, result);
		}
	
}
