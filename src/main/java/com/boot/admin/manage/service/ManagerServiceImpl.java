package com.boot.admin.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.admin.manage.dao.ManagerDao;
import com.boot.admin.vo.ManagerVO;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class ManagerServiceImpl implements ManagerService {


	@Setter(onMethod_ = @Autowired)
	private ManagerDao managerDao;
	
	@Override
	public ManagerVO loginProcess(ManagerVO login) {
		ManagerVO adminLogin = managerDao.loginProcess(login);
		return adminLogin;
	}
	
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
	
	@Override
	public ManagerVO idCheck(ManagerVO mvo) {
		return managerDao.idCheck(mvo);
	}

	@Override
	public int insertAdmin(ManagerVO mvo) {
		int result = 0;
		result = managerDao.insertAdmin(mvo);
		return result;
	}

	@Override
	public int adminDelete(ManagerVO mvo) {
		int result = 0;
		result = managerDao.adminDelete(mvo);
		return result;
	}

	@Override
	public List<MemberVO> userList(MemberVO mvo) {
		List<MemberVO> list = null;
		list = managerDao.userList(mvo);
		return list;
	}

	@Override
	public int memberCnt(MemberVO mvo) {
		return managerDao.memberCnt(mvo);
	}

	@Override
	public int userDelete(MemberVO mvo) {
		int result = 0;
		result = managerDao.userDelete(mvo);
		return result;
	}
	
	

}
