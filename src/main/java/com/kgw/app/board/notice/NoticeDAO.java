package com.kgw.app.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	
	
	//조회
	public NoticeDTO detail(NoticeDTO noticeDTO) throws Exception;
	
	//리스트
	public List<NoticeDTO> list() throws Exception;
	//수정
	public int update(NoticeDTO noticeDTO) throws Exception;
	//삭제
	public int delete(NoticeDTO noticeDTO) throws Exception;
	//추가
	public int add(NoticeDTO noticeDTO) throws Exception;
	
	
}
