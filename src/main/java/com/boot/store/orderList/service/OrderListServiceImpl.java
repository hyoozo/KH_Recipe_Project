package com.boot.store.orderList.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.store.orderList.dao.OrderListDao;
import com.boot.store.orderList.vo.OrderListVO;

import lombok.Setter;

@Service
public class OrderListServiceImpl implements OrderListService {

	@Setter(onMethod_ = @Autowired)
	private OrderListDao orderListDao;
	
	
	@Override
	public int addOrderList(OrderListVO olvo) {
		int result = 0;
		
		result = orderListDao.addOrderList(olvo);
		
		return result;
	}

}
