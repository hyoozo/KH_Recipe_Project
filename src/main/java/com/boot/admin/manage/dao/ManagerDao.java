package com.boot.admin.manage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.admin.vo.ManagerVO;
import com.boot.client.member.vo.MemberVO;

@Mapper
public interface ManagerDao {
	public ManagerVO loginProcess(ManagerVO login);
	
	public List<ManagerVO> adminList(ManagerVO mvo);
	public int adminCnt(ManagerVO mvo);

	public ManagerVO idCheck(ManagerVO mvo);

	public int insertAdmin(ManagerVO mvo);
	public int adminDelete(ManagerVO mvo);

	public List<MemberVO> userList(MemberVO mvo);
	public int memberCnt(MemberVO mvo);
}
