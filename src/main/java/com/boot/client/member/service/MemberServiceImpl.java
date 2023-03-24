package com.boot.client.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.member.dao.MemberDao;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberDao memberDao;
	
	@Override
	public MemberVO loginProcess(MemberVO mvo) {
		MemberVO login = memberDao.loginProcess(mvo);
		return login;
	}

	@Override
	public int joinProcess(MemberVO mvo) {
		int join = 0;
		join = memberDao.joinProcess(mvo);
		return join;
	}

	@Override
	public MemberVO myPage(MemberVO mvo) {
		MemberVO page = null;
		page = memberDao.myPage(mvo);
		return page;
	}

	@Override
	public int updatePwdConfirm(MemberVO mvo) {
		int result = 0;
		result = memberDao.updatePwdConfirm(mvo);
		return result;
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = 0;
		result = memberDao.memberUpdate(mvo);
		return result;
	}
	
	
}