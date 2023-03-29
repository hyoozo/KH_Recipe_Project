package com.boot.store.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.service.OrderService;
import com.boot.store.order.vo.OrderVO;
import com.boot.store.orderList.service.OrderListService;
import com.boot.store.orderList.vo.OrderListVO;

import lombok.Setter;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private OrderListService orderListService;
	
	
	@GetMapping("/addOneOrder")
	public String addOneOrder(@SessionAttribute(name="login", required=false) MemberVO mvo, 
			OrderListVO olvo) {
		String url = "";
		
		OrderVO ovo = new OrderVO();
		ovo.setMvo(mvo);
		
		int result = 0;
		result = orderService.addOrder(ovo);
		
		if(result != 0) {
			int maxNum = orderListService.maxOrderNum(mvo);
			ovo = new OrderVO();
			ovo.setO_num(maxNum);
			olvo.setMvo(mvo);
			olvo.setOvo(ovo);
			url = "redirect:/store/itemsDetail?i_num="+olvo.getIvo().getI_num();
			orderListService.addOrderList(olvo);
		} else if(result == 0) {
			url = "/error/";
		}
		
		return url;
	}
	
	@PostMapping("/addOrder")
	@ResponseBody
	public String addOrder(@SessionAttribute(name="login", required=false) MemberVO mvo,
			@ModelAttribute OrderVO vo) {
		String str = "";
		
		int result = 0;
		
		vo.setMvo(mvo);
		
		result = orderService.addOrder(vo);
		
		if(result != 0) {
			str = "성공";
		} else if(result == 0) {
			str = "실패";
		}
		
		return str;
	}
	
	@PostMapping("/addOrders")
	@ResponseBody
	public String addOrders(@SessionAttribute(name="login", required=false) MemberVO mvo, 
		@ModelAttribute ItemsVO ivo,
		@ModelAttribute OrderListVO olvo) {
		
		olvo.setIvo(ivo);
		olvo.setMvo(mvo);
		
		String str = "";
		
		int result = 0;
		
		int maxNum = orderListService.maxOrderNum(mvo);
		OrderVO ovo = new OrderVO();
		ovo.setO_num(maxNum);
		olvo.setMvo(mvo);
		olvo.setOvo(ovo);
		
		result += orderListService.addOrderList(olvo);
		
		if(result != 0) {
			str = "성공";
		} else if(result == 0) {
			str = "실패";
		}
		
		return str;
	}
	
	@GetMapping("/orderList")
	public String getOrderList(@SessionAttribute(name="login", required=false) MemberVO mvo,
			Model model) {
		List<OrderListVO> list = null;
		
		list = orderListService.orderList(mvo);
		model.addAttribute("order", list);
		
		return "member/orderList";
	}
}
