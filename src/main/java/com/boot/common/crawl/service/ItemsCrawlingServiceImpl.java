package com.boot.common.crawl.service;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.store.items.dao.ItemsDao;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;

@Service
public class ItemsCrawlingServiceImpl implements ItemsCrawlingService {
	private static String url = "https://wtable.co.kr/products?category_id=";
	
	@Setter(onMethod_ = @Autowired)
	private ItemsDao itemsDao;
	
	@Override
	public List<ItemsVO> getItemList(String id) {
		List<ItemsVO> list = null;
		System.out.println("서비스 getItemList");
		try {
			list = new ArrayList<>();
			
			/*
			 * 가전제품:1636
			 */
			url += id;
			
			Document document = Jsoup.connect(url).get();
			//System.out.println(document);
			
			Elements elements = document.select("div.ProductItemstyle__Layout-c02zkf-0");
			
			for(Element element : elements) {
				
				ItemsVO vo = ItemsVO.builder()
						.i_name(element.select("div.desc > p.name").text())
						.i_parts("")
						.i_price(element.select("div.desc > p.origin_price").text())
						.i_img(element.select("div.main_image > img").attr("abs:src"))
						.i_quan(100)
						.build();
				
				System.out.println(vo.toString());	
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int insertItem(String id) {
		int result = 0;
		try {
			
			/*
			 * 가전제품:1636
			 * 간편식·조리식품 : 101
			 * 그릇·컵 : 66
			 * 수산·해산·건어물 : 153
			 * 프라이팬·냄비 : 68
			 */
			url += id;
			
			Document document = Jsoup.connect(url).get();
			//System.out.println(document);
			
			Elements elements = document.select("div.ProductItemstyle__Layout-c02zkf-0");
			
			
			for(Element element : elements) {
				
				ItemsVO vo = ItemsVO.builder()
						.i_name(element.select("div.desc > p.name").text())
						.i_parts("프라이팬·냄비")
						.i_price(element.select("div.desc > p.origin_price").text())
						.i_img(element.select("div.main_image > img").attr("abs:src"))
						.i_quan(100)
						.build();
				
				System.out.println(vo.toString());	
				
				result += itemsDao.insertItems(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
