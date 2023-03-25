package com.boot.store.items.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.store.items.dao.ItemsDao;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;

@Service
public class ItemsServiceImpl implements ItemsService {
	
	@Setter(onMethod_ = @Autowired)
	private ItemsDao itemsDao;
	
	@Override
	public List<ItemsVO> itemsList(ItemsVO vo){
		
		List<ItemsVO> page = itemsDao.itemsList(vo);
		
		return page;
	}
	
	@Override
	public ItemsVO itemsDetail(ItemsVO vo) {
		
		ItemsVO detail = itemsDao.itemsDetail(vo);
		
		return detail;
	}
}
