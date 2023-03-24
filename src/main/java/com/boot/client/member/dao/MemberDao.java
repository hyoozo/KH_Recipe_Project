package com.boot.client.member.dao;



import org.apache.ibatis.annotations.Mapper;

import com.boot.client.member.vo.MemberVO;

@Mapper
public interface MemberDao {
	public MemberVO loginProcess(MemberVO mvo);
	
	public int joinProcess(MemberVO mvo);
	
	public MemberVO myPage(MemberVO mvo);
	
	public int updatePwdConfirm(MemberVO mvo);
	
	public int memberUpdate(MemberVO mvo);

}
