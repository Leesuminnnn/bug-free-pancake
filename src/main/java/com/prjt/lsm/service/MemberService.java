package com.prjt.lsm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prjt.lsm.dao.MemberDao;
import com.prjt.lsm.vo.MemberVo;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void joinProcess(MemberVo vo) {
		
		memberDao.joinProcess(vo);
	}

	public String login(MemberVo vo) {
		
		return memberDao.login(vo);
	}

	
		
}
