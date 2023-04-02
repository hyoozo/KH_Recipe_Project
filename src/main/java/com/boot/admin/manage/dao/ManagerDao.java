package com.boot.admin.manage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.admin.vo.ManagerVO;

@Mapper
public interface ManagerDao {
	public ManagerVO loginProcess(ManagerVO login);
	
	public List<ManagerVO> adminList(ManagerVO mvo);
	public int adminCnt(ManagerVO mvo);

	public ManagerVO idCheck(ManagerVO mvo);

	public int insertAdmin(ManagerVO mvo);

	
}
