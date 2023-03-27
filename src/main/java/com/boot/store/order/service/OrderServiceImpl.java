package com.boot.store.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.store.order.dao.OrderDao;
import com.boot.store.order.vo.OrderVO;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderDao orderDao;
	
	@Override
	public int addOrder(OrderVO vo) {
		int result = 0;
		result = orderDao.addOrder(vo);
		
		return result;
	}

}
