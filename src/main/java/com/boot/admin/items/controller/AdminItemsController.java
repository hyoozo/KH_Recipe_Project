package com.boot.admin.items.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.common.vo.PageDTO;
import com.boot.store.items.service.ItemsService;
import com.boot.store.items.vo.ItemsVO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/store/")
public class AdminItemsController {
	
	@Setter(onMethod_ = @Autowired)
	private ItemsService itemsService;
	
	@GetMapping("/itemsList")
	public String getItemsList(@ModelAttribute ItemsVO ivo, Model model, HttpSession session) {
		//log.info(ivo.toString());
		
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		List<ItemsVO> list = itemsService.itemsList(ivo);
		
		int cnt = itemsService.itemsCnt();
		
		model.addAttribute("items", list);
		
		model.addAttribute("pageMaker", new PageDTO(ivo, cnt));
		
		return "admin/store/itemsList";
	}
	
	@GetMapping("/insertForm")
	public String insertForm(HttpSession session) {
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		return "admin/store/insertForm";
	}
	
	@PostMapping("/insertItem")
	public String insertItem(ItemsVO ivo) throws Exception{
		
		itemsService.insertItem(ivo);
		
		return "redirect:/admin/store/itemsList";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(ItemsVO ivo, Model model, HttpSession session) {
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		ItemsVO item = itemsService.itemsDetail(ivo);
		
		model.addAttribute("item", item);
		
		return "admin/store/updateForm";
	}
	
	@PostMapping("/itemUpdate")
	public String itemUpdate(ItemsVO ivo) throws Exception{
		
		itemsService.updateItem(ivo);
		
		return "redirect:/admin/store/itemsList";
	}
	
	@GetMapping("/deleteItem")
	@ResponseBody
	public String deleteItem(ItemsVO ivo) throws Exception {
		String response = "";
		
		int result = itemsService.deleteItem(ivo);
		
		if(result != 0) {
			response="성공";
		} else {
			response="실패";
		}
		
		return response;
	}
}
