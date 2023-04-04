package com.boot.admin.manage.service;

import java.util.List;

import com.boot.admin.vo.ManagerVO;
import com.boot.client.member.vo.MemberVO;

public interface ManagerService {

	public ManagerVO loginProcess(ManagerVO login);
	
	public List<ManagerVO> adminList(ManagerVO mvo);

	public int adminCnt(ManagerVO mvo);
	public ManagerVO idCheck(ManagerVO mvo);
	public int insertAdmin(ManagerVO mvo);
	public int adminDelete(ManagerVO mvo);

	public List<MemberVO> userList(MemberVO mvo);
	public int memberCnt(MemberVO mvo);
	public int userDelete(MemberVO mvo);
	

}
