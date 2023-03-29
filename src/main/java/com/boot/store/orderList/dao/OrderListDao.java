package com.boot.store.orderList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.orderList.vo.OrderListVO;

@Mapper
public interface OrderListDao {
	public int addOrderList(OrderListVO olvo);
	public int maxOrderNum(MemberVO mvo);
	public List<OrderListVO> orderList(MemberVO mvo);
}
