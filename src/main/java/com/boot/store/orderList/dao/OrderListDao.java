package com.boot.store.orderList.dao;

import org.apache.ibatis.annotations.Mapper;

import com.boot.store.orderList.vo.OrderListVO;

@Mapper
public interface OrderListDao {
	public int addOrderList(OrderListVO olvo);
}
