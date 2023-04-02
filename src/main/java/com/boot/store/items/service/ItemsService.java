package com.boot.store.items.service;


import java.util.List;

import com.boot.store.items.vo.ItemsVO;

public interface ItemsService {
	public List<ItemsVO> itemsList(ItemsVO vo);
	public ItemsVO itemsDetail(ItemsVO vo);
	public int updateItemsQuan(ItemsVO vo);
}
