package com.boot.client.member.service;


import com.boot.client.member.vo.MemberVO;

public interface MemberService {
	public MemberVO loginProcess(MemberVO mvo);
	
	public int idChk(MemberVO mvo);
	
	public int joinProcess(MemberVO mvo);
	
	public MemberVO myPage(MemberVO mvo);
	
	public int updatePwdConfirm(MemberVO mvo);
	
	public int memberUpdate(MemberVO mvo);
}
