package com.boot.store.items.service;


import java.util.List;

import com.boot.store.items.vo.ItemsVO;

public interface ItemsService {
	public List<ItemsVO> itemsList(ItemsVO vo);
	public ItemsVO itemsDetail(ItemsVO vo);
	public int updateItemsQuan(ItemsVO vo);
	public int itemsCnt();
	public int insertItem(ItemsVO vo) throws Exception;
	public int updateItem(ItemsVO vo) throws Exception;
	public int deleteItem(ItemsVO vo) throws Exception;
}
