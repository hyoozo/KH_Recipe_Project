package com.boot.admin.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.admin.manage.dao.ManagerDao;
import com.boot.admin.vo.ManagerVO;

import lombok.Setter;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Setter(onMethod_ = @Autowired)
	private ManagerDao managerDao;
	
	@Override
	public List<ManagerVO> adminList(ManagerVO mvo) {
		List<ManagerVO> list = null;
		list = managerDao.adminList(mvo);
		return list;
	}

	@Override
	public int adminCnt(ManagerVO mvo) {
		return managerDao.adminCnt(mvo);
	}

	
	
}
