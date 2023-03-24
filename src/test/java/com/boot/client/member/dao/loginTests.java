package com.boot.client.member.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.client.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@SpringBootTest
@Slf4j
public class loginTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberDao memberDao;
	
	/*
	@Test
	public void testloginProcess() {

		
		MemberVO mvo = new MemberVO();
		mvo.setM_id("홍길동");
		mvo.setM_pwd("1234");
		log.info("mvo:"+mvo);
		MemberVO result = memberDao.loginProcess(mvo);
		log.info("mvo:"+mvo);
		log.info("입력결과 : " + result);
	}
	
	
	@Test
	public void testjoinProcess() {
		MemberVO mvo = new MemberVO();
		
		mvo.setM_name("길동홍");
		mvo.setM_id("길동홍");
		mvo.setM_pwd("1234");
		mvo.setM_phone("010");
		mvo.setM_email("길동@");
		mvo.setM_address("길동시");
		
		int result = memberDao.joinProcess(mvo);
		
		log.info("입력결과 수 : " + result);
		
	}
	
	*/
	
	@Test
	public void testmyPage() {
		
		MemberVO mvo = new MemberVO();
		mvo.setM_num(23);
		MemberVO result = memberDao.myPage(mvo);
		
		log.info("result: " + result);
	}

}
