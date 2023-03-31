package com.boot.admin.manage.service;

import java.util.List;

import com.boot.admin.vo.ManagerVO;

public interface ManagerService {

	public List<ManagerVO> adminList(ManagerVO mvo);

	public int adminCnt(ManagerVO mvo);

}
