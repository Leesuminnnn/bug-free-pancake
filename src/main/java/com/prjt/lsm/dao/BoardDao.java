package com.prjt.lsm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prjt.lsm.vo.BoardVo;
import com.prjt.lsm.vo.CriteriaBoard;

@Repository
public class BoardDao {

	
	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "board";
	
	@Autowired
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<BoardVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	public int BoardListCnt(CriteriaBoard cri){
		return sqlSession.selectOne(MAPPER+".BoardListCnt", cri);
	}
	public List<Map<String, Object>> Boardlist(CriteriaBoard cri){
		return sqlSession.selectList(MAPPER+".Boardlist",cri);
	}
	public int insert(BoardVo vo) {
		return sqlSession.insert(MAPPER+".insert",vo);
	}
	public BoardVo View(BoardVo vo) {
		return sqlSession.selectOne(MAPPER+".View", vo);
	}
	public void update(BoardVo vo) { 
		 sqlSession.update(MAPPER+".update", vo);
	}
	public String file_info(int bidx) {
		return sqlSession.selectOne(MAPPER+".file_info",bidx);
	}
	public void delete(int bidx) {
		sqlSession.delete(MAPPER+".delete", bidx);
	}
}
