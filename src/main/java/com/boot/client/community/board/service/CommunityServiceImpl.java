package com.boot.client.community.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.community.board.dao.CommunityDao;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;

	@Override
	public List<CommunityVO> postList(CommunityVO cvo) {
		List<CommunityVO> list = null;
		list = communityDao.postList(cvo);
		return list;
	}

	@Override
	public CommunityVO postDetail(CommunityVO cvo) {
		CommunityVO detail = null;
		
		communityDao.c_readcnt(cvo);

		detail = communityDao.postDetail(cvo);
		if (detail != null) {
			detail.setC_comment(detail.getC_comment().toString().replaceAll("\n", "<br />"));
		}

		return detail;
	}

	@Override
	public CommunityVO updateForm(CommunityVO cvo) {
		CommunityVO update = null;

		update = communityDao.updateForm(cvo);

		return update;
	}

	@Override
	public int postUpdate(CommunityVO cvo) {
		int update = 0;

		update = communityDao.postUpdate(cvo);

		return update;
	}

	@Override
	public int postDelete(CommunityVO cvo) {
		int delete = 0;

		delete = communityDao.postDelete(cvo);

		return delete;
	}

	@Override
	public MemberVO insertForm(MemberVO mvo) {
		MemberVO result = null;

		result = communityDao.insertForm(mvo);

		return result;
	}

	@Override
	public int postInsert(CommunityVO cvo) {
		int insert = 0;
	  
		insert = communityDao.postInsert(cvo);
	
		return insert;
	}

	@Override
	public int comListCnt(CommunityVO cvo) {
		int listCnt = 0;
		
		listCnt = communityDao.comListCnt(cvo);
		
		return listCnt;
	}
	

}
