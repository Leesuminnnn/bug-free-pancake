package com.prjt.lsm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prjt.lsm.vo.MemberVo;

@Repository
public class MemberDao {

	
	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "member";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void joinProcess(MemberVo vo) {
		sqlSession.insert(MAPPER+".insert",vo);		
	}

	public String login(MemberVo vo){
		return sqlSession.selectOne(MAPPER+".login",vo);
	}
	
	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}
}
