package com.boot.store.items.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.common.file.FileUploadUtil;
import com.boot.store.items.dao.ItemsDao;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	@Override
	public int updateItemsQuan(ItemsVO vo) {
		int result = 0;
		result = itemsDao.updateItemsQuan(vo);
		return result;
	}
	
	@Override
	public int itemsCnt() {
		int result = 0;
		result = itemsDao.itemsCnt();
		return result;
	}
	
	@Override
	public int insertItem(ItemsVO ivo) throws Exception {
		int result = 0;
		
		if(ivo.getFile().getSize() > 0) {
			String img = FileUploadUtil.fileUpload(ivo.getFile(), "item");
			ivo.setI_img(img);
		}
		
		result = itemsDao.insertItems(ivo);
		
		return result;
	}
	
	@Override
	public int updateItem(ItemsVO ivo) throws Exception {
		int result = 0;
		
		if(!ivo.getFile().isEmpty()) {
			if(!ivo.getI_img().isEmpty() && !ivo.getI_img().contains("https://")) {
				FileUploadUtil.fileDelete(ivo.getI_img());
			}
			String fileName = FileUploadUtil.fileUpload(ivo.getFile(), "item");
			ivo.setI_img(fileName);
		}
		
		result = itemsDao.updateItem(ivo);
		return result;
	}
	
	@Override
	public int deleteItem(ItemsVO ivo) throws Exception{
		int result = 0;
		if(!ivo.getI_img().isEmpty() && !ivo.getI_img().contains("https://")) {
			FileUploadUtil.fileDelete(ivo.getI_img());
		}
		result = itemsDao.deleteItem(ivo);
		return result;
	}
	
	@Override
	public List<ItemsVO> relatedItems(ItemsVO ivo){
		
		return itemsDao.relatedItems(ivo);
	}
}
