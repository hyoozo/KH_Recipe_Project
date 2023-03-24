package com.boot.common.crawl.service;

import java.util.List;

import com.boot.store.items.vo.ItemsVO;

public interface ItemsCrawlingService {
	public List<ItemsVO> getItemList(String id);
	
	public int insertItem(String id);
}
