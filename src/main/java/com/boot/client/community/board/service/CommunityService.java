package com.boot.client.community.board.service;

import java.util.List;

import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;

public interface CommunityService {
	public List<CommunityVO> postList(CommunityVO cvo);
	
	public CommunityVO postDetail(CommunityVO cvo);
	
	public CommunityVO updateForm(CommunityVO cvo);
	
	public int postUpdate(CommunityVO cvo) throws Exception;
	
	public int postDelete(CommunityVO cvo) throws Exception;
	
	public MemberVO insertForm(MemberVO mvo);
	
	public int postInsert(CommunityVO cvo) throws Exception;
	
	public int comListCnt(CommunityVO cvo);
	
}
