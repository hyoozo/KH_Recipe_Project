package com.boot.store.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.service.OrderService;
import com.boot.store.order.vo.OrderVO;
import com.boot.store.orderList.service.OrderListService;
import com.boot.store.orderList.vo.OrderListVO;

import lombok.Setter;

@SessionAttributes("")
@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private OrderListService orderListService;
	
	@ModelAttribute
	public MemberVO member() {
		return new MemberVO();
	}
	
	@GetMapping("/addOneOrder")
	public String addOneOrder(MemberVO mvo, @ModelAttribute ItemsVO ivo, int ol_quan) {
		String url = "";
		
		OrderVO ovo = new OrderVO();
		ovo.setM_num(mvo.getM_num());
		
		int result = 0;
		result = orderService.addOrder(ovo);
		
		OrderListVO olvo = new OrderListVO();
		olvo.setM_num(mvo.getM_num());
		olvo.setI_num(ivo.getI_num());
		olvo.setOl_quan(ol_quan);
		
		if(result != 0) {
			url = "redirect:/store/itemsDetail?i_num="+ivo.getI_num();
			orderListService.addOrderList(olvo);
		} else if(result == 0) {
			url = "/error/";
		}
		
		return url;
	}
	
	@PostMapping("/addOrders")
	@ResponseBody
	public String addOrder(@ModelAttribute OrderListVO olvo) {
		String str = "";
		
		OrderVO ovo = new OrderVO();
		ovo.setM_num(olvo.getM_num());
		
		int result = 0;
		result = orderService.addOrder(ovo);
		
		result += orderListService.addOrderList(olvo);
		
		if(result != 0) {
			str = "성공";
		} else if(result == 0) {
			str = "실패";
		}
		
		return str;
	}
}
