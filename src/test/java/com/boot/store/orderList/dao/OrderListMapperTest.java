package com.boot.store.orderList.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.orderList.vo.OrderListVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class OrderListMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private OrderListDao orderListDao;
	
	@Test
	public void orderListTest() {
		List<OrderListVO> list = null;
		
		MemberVO mvo = new MemberVO();
		mvo.setM_num(1);
		
		list = orderListDao.orderList(mvo);
		
		log.info(list.toString());
	}
}
