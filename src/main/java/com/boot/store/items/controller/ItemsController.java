package com.boot.store.items.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.store.items.service.ItemsService;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;

@Controller
@RequestMapping("/store/*")
public class ItemsController {
	
	@Setter(onMethod_ = @Autowired)
	private ItemsService itemsService;
	
	@GetMapping("/itemsList")
	public String itemsList() {
		return "store/itemsList";
	}
	
	@ResponseBody
	@RequestMapping(value="/getList", method=RequestMethod.POST)
	public List<ItemsVO> getItemsList(@ModelAttribute ItemsVO vo) {
		List<ItemsVO> list = itemsService.itemsList(vo);
		
		return list;
	}

	@GetMapping("/itemsDetail")
	public String itemsDetail(@ModelAttribute ItemsVO vo, Model model) {
		
		ItemsVO detail = itemsService.itemsDetail(vo);
		
		model.addAttribute("detail", detail);
		
		List<ItemsVO> relate = itemsService.relatedItems(vo);
		
		model.addAttribute("relate", relate);
		
		return "store/itemsDetail";
	}
	
	@ResponseBody
	@PostMapping("/updateItemQuan")
	public String UpdateItemQuan(ItemsVO ivo) {
		String str = "";
		
		int result = 0;
		result = itemsService.updateItemsQuan(ivo);
		
		if(result!=0) {
			str = "성공";
		} else {
			str = "실패";
		}
		
		return str;
	}
}
