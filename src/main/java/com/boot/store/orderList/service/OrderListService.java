package com.boot.store.orderList.service;

import java.util.List;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.orderList.vo.OrderListVO;

public interface OrderListService {
	public int addOrderList(OrderListVO olvo);
	public int maxOrderNum(MemberVO mvo);
	public List<OrderListVO> orderList(MemberVO mvo);
}
