package com.boot.store.order.service;

import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.vo.OrderVO;

public interface OrderService {
	public String getToken() throws Exception;
	public String getItemPrice(ItemsVO ivo);
	
	public int addOrder(OrderVO vo);
	
}
