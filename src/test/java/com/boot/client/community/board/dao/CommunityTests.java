package com.boot.client.community.board.dao;


import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.dao.MemberDao;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class CommunityTests {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;
	
	@Setter(onMethod_ = @Autowired)
	private MemberDao memberDao;
	
	/*
	@Test
	public void postDetail() {
		CommunityVO cvo = new CommunityVO();
		
		cvo.setC_no(1);
		CommunityVO result = communityDao.postDetail(cvo);
		
		log.info("디테일페이지 : " + result);
	}
	
	
	
	@Test
	public void updateForm() {
		CommunityVO cvo = new CommunityVO();
		
		cvo.setC_no(1);
		CommunityVO result = communityDao.updateForm(cvo);
		
		log.info("디테일페이지 : " + result);
	}
	
	
	@Test
	public void postUpdate() {
		CommunityVO cvo = new CommunityVO();
		
		cvo.setC_no(1);
		cvo.setC_title("수정한다");
		cvo.setC_category("잡담");
		cvo.setC_img("2");
		cvo.setC_comment("내용 수정");
		
		int result = communityDao.postUpdate(cvo);
		
		log.info("수정된 행:" + result);
	}
	
	
	
	@Test
	public void postDelete() {
		CommunityVO cvo = new CommunityVO();
		
		cvo.setC_no(7);
		
		int result = communityDao.postDelete(cvo);
		
		log.info("삭제된 행:" + result);
	}
	*/
	
	
	@Test
	public void postInsert() {
		CommunityVO cvo = new CommunityVO();
		
		
		cvo.setC_title("지금");
		cvo.setC_category("팁");
		cvo.setC_writer("돼지");
		cvo.setC_comment("라면먹을시간");
		cvo.setC_img("3");
		
		
		cvo.setM_num(49);
		
		int result = communityDao.postInsert(cvo);
		
		log.info("입력된 행:" + result);
	}

	
}
