package com.boot.store.items.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class ItemsMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private ItemsDao itemsDao;
	
	/*
	 * @Test public void itemsListTest() { log.info("itmesList 메서드 실행");
	 * 
	 * List<ItemsVO> list = itemsDao.itemsList();
	 * 
	 * for(ItemsVO vo : list) { log.info(vo.toString()); }
	 * 
	 * }
	 */
	
	@Test
	public void itemsDetailTest() {
		
		ItemsVO vo = new ItemsVO();
		vo.setI_num(200);
		
		ItemsVO detail = itemsDao.itemsDetail(vo);
		
		log.info(detail.toString());
	}
}
