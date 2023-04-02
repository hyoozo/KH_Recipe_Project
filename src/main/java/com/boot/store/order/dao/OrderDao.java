package com.boot.store.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.vo.OrderVO;

@Mapper
public interface OrderDao {
	public int addOrder(OrderVO vo);
	
	public String getItemPrice(ItemsVO ivo);
}
