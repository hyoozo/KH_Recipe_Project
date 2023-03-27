package com.boot.common.crawl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.common.crawl.service.ItemsCrawlingService;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/craw/*")
@Slf4j
public class CrawlingController {
	
	@Setter(onMethod_ = @Autowired)
	private ItemsCrawlingService service;
	
	@GetMapping("/list")
	public String getItemsList(Model model, @RequestParam("id") String id) {
		
		List<ItemsVO> list = service.getItemList(id);
		
		log.info(list.toString());
		
		model.addAttribute("list", list);
		
		return "craw/main";
	}
	
	@GetMapping("/insert")
	public String insertItems(@RequestParam("id") String id) {
		
		String url = "";
		int result = 0;
		
		result = service.insertItem(id);
		
		if(result != 0) {
			url = "craw/list?id="+id;
		} else {
			url = "recipe/list";
		}
		
		return "redirect:/"+url;
	}
}
