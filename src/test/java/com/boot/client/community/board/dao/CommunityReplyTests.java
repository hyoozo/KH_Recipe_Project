package com.boot.client.community.board.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.client.community.reply.vo.ReplyVO;
import com.boot.client.community.youtube.vo.Commu_YtbVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class CommunityReplyTests {
	
	@Setter(onMethod_ = @Autowired)
	private ComReplyDao comReplyDao;
	
	@Setter(onMethod_ = @Autowired)
	private Commu_YtbDao commu_YtbDao;
	
	/*
	@Test
	public void testReplyList() {
	
		List<ReplyVO> reply = comReplyDao.replyList(23);
		  
		 for(ReplyVO result : reply) {
			 log.info("result : " + result); }
	}
	*/
	
	/*
	@Test
	public void testReplyInsert() {
		ReplyVO rvo = new ReplyVO();
		
		rvo.setC_no(22);
		rvo.setCr_writer("하루견과");
		rvo.setCr_content("축하해요");
		
		int result = comReplyDao.replyInsert(rvo);
		
		log.info("삽입:" + result);
	}
	
	
	
	@Test
	public void testReplyUpdate() {
		ReplyVO rvo = new ReplyVO();
		
		rvo.setCr_no(6);
		rvo.setCr_content("수정했어");
		rvo.setC_no(22);
		
		int result = comReplyDao.replyUpdate(rvo);
		
		log.info("수정:" + result);
	}
	
	@Test
	public void testReplyDelete() {

		int result = comReplyDao.replyDelete(49);
		
		log.info("삭제:" + result);
	}
	
	*/
	
	@Test
	public void testYtb() {
	
		List<Commu_YtbVO> result1 = commu_YtbDao.Ytb();
				
		log.info(" 1 : " + result1);

	}
}
