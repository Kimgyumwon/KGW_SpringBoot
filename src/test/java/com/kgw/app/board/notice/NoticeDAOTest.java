package com.kgw.app.board.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NoticeDAOTest {

	@Autowired
	private NoticeDAO noticeDAO;
	
//	@Test
//	void testDetail() throws Exception {
//		NoticeDTO noticeDTO = new NoticeDTO();
//		noticeDTO.setBoardNum(1L);
//		
//		noticeDTO = noticeDAO.detail(noticeDTO);
//		assertNotNull(noticeDTO);
//	}

//		@Test
//		void testList() throws Exception {
//			List<NoticeDTO> list = noticeDAO.list();
//			
//			assertEquals(1, list.size());
//			
//		}
	
//		 @Test
//		 void testAdd() throws Exception {
//			 
//			 for (int i = 0; i < 120; i++) {
//				 NoticeDTO noticeDTO = new NoticeDTO();
//				 noticeDTO.setBoardTitle("title"+i);
//				 noticeDTO.setBoardWriter("writer"+i);
//				 noticeDTO.setBoardContents("contents"+i);
//				 noticeDAO.add(noticeDTO);
//				 if (i%10==0) {
//					 Thread.sleep(500);
//				}
//				 
//			}
//			 
//			 
//		 }
	
//			@Test
//			void testUpdate() throws Exception {
//				NoticeDTO noticeDTO = new NoticeDTO();
//				noticeDTO.setBoardNum(2L);
//				noticeDTO.setBoardTitle("쉬고싶다");
//				noticeDTO.setBoardWriter("피곤하다");
//				noticeDTO.setBoardContents("놀고싶다");
//				
//				int result = noticeDAO.update(noticeDTO);
//				
//				assertEquals(1, result);
//			}
	
//			@Test
//			void testDelete() throws Exception {
//				NoticeDTO noticeDTO = new NoticeDTO();
//				noticeDTO.setBoardNum(1L);
//				
//				int result = noticeDAO.delete(noticeDTO);
//				assertEquals(1, result);
//			}
			
	
	
	
}
