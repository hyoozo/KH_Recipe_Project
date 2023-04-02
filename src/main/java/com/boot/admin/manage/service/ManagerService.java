package com.boot.admin.manage.service;

import java.util.List;

import com.boot.admin.vo.ManagerVO;

public interface ManagerService {

	public ManagerVO loginProcess(ManagerVO login);
	
	public List<ManagerVO> adminList(ManagerVO mvo);

	public int adminCnt(ManagerVO mvo);
	public ManagerVO idCheck(ManagerVO mvo);
	public int insertAdmin(ManagerVO mvo);

}
