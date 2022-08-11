package com.prjt.lsm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prjt.lsm.dao.BoardDao;
import com.prjt.lsm.vo.BoardVo;
import com.prjt.lsm.vo.CriteriaBoard;

@Service
public class BoardService {

	private BoardDao boardDao;

	@Autowired
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public List<BoardVo> list() {

		return boardDao.list();
	}

	public int BoardListCnt(CriteriaBoard cri) {
		return boardDao.BoardListCnt(cri);
	}

	public List<Map<String, Object>> Boardlist(CriteriaBoard cri) {
		return boardDao.Boardlist(cri);
	}

	public int insert(BoardVo vo) {
		int result = 0; // 글쓰기 실패

		result = boardDao.insert(vo);

		return result;
	}

	// 글상세페이지보기
	public BoardVo View(BoardVo vo) {
		return boardDao.View(vo);
	}
	
	//글수정
	public void update(BoardVo vo) {
		boardDao.update(vo);
	}
	public String file_info(int bidx) {
		return boardDao.file_info(bidx);
	}
	public void delete(Integer bidx) {
		boardDao.delete(bidx);
	}
}
