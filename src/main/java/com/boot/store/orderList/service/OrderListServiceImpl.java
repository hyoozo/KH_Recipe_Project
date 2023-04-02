package com.boot.store.orderList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.member.vo.MemberVO;
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
	
	@Override
	public int maxOrderNum(MemberVO mvo) {
		int result = 0;
		result = orderListDao.maxOrderNum(mvo);
		return result;
	}
	
	@Override
	public List<OrderListVO> orderList(OrderListVO olvo){
		
		return orderListDao.orderList(olvo);
	}
	
	@Override
	public int orderListCnt(MemberVO mvo) {
		int result = 0;
		result = orderListDao.orderListCnt(mvo);
		
		return result;
	}
	
	@Override
	public int updateState(OrderListVO olvo) {
		int result = 0;
		result = orderListDao.updateState(olvo);
		
		return result;
	}
}
