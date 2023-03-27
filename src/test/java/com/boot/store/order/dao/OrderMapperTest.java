package com.boot.store.order.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.store.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class OrderMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDao orderDao;
	
	/*
	 * @Test public void addOrderTest() { OrderVO vo = new OrderVO();
	 * vo.setM_num(1);
	 * 
	 * orderDao.addOrder(vo); }
	 */
}
