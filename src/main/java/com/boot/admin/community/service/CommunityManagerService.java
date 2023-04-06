package com.boot.admin.community.service;

import java.util.List;

import com.boot.admin.community.vo.CommunityManagerVO;
import com.boot.admin.vo.ManagerVO;

public interface CommunityManagerService {

	public List<CommunityManagerVO> mngPostList(CommunityManagerVO cmvo);
	public List<CommunityManagerVO> mngList(CommunityManagerVO cmvo);
	
	public CommunityManagerVO mngPostDetail(CommunityManagerVO cmvo);
	
	public CommunityManagerVO mngUpdateForm(CommunityManagerVO cmvo);
	
	public int mngPostUpdate(CommunityManagerVO cmvo) throws Exception;
	
	public int mngPostDelete(CommunityManagerVO cmvo) throws Exception;
	
	public ManagerVO mngInsertForm(ManagerVO mvo);
	
	public int mngPostInsert(CommunityManagerVO cmvo) throws Exception;
	
	public int mngComListCnt(CommunityManagerVO cmvo);
}
