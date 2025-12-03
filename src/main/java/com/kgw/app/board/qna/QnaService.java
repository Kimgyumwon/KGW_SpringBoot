package com.kgw.app.board.qna;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kgw.app.board.BoardDTO;
import com.kgw.app.board.BoardFileDTO;
import com.kgw.app.board.BoardService;
import com.kgw.app.files.FileManager;
import com.kgw.app.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.qna}")
	private String path;
	
	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		return qnaDAO.detail(boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return qnaDAO.update(boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		return qnaDAO.delete(boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO, MultipartFile[] attach) throws Exception {
		// 글번호 필요
		int result = qnaDAO.add(boardDTO);
		
		if (attach == null) {
			return result;
		}
		
		File file = new File(path);

		
		for (MultipartFile f : attach) {
			
			if (f == null || f.isEmpty() || f.getSize() == 0) {
				continue;
			}
			
			String fileName = fileManager.fileSave(file, f);
			
			
			
			BoardFileDTO boardFileDTO = new QnaFileDTO();
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setFileOrigin(f.getOriginalFilename());
			qnaDAO.fileAdd(boardFileDTO);
		}
		
		
		return qnaDAO.refUpdate(boardDTO);
	}

	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		
		Long totalCount = qnaDAO.count(pager);
		pager.pageing(totalCount);
		
		return qnaDAO.list(pager);
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception {
		//1. 부모의 정보를 조회
		QnaDTO parent = (QnaDTO)qnaDAO.detail(qnaDTO);
		//2. 부모의 정보를 이용해서 step을 업데이트 
		int result = qnaDAO.stepUpdate(parent);
		//3. 부모의 정보를 이용해서 ref, step, depth를 세팅
		qnaDTO.setBoardRef(parent.getBoardRef());
		qnaDTO.setBoardStep(parent.getBoardStep()+1);
		qnaDTO.setBoardDepth(parent.getBoardDepth()+1);
		//4. insert 진행
		result = qnaDAO.insertQna(qnaDTO);
		return result;
	}
	
	@Override
	public BoardFileDTO fileDetail(BoardFileDTO boardFileDTO) throws Exception {
		return qnaDAO.fileDetail(boardFileDTO);
	}
	
	
}