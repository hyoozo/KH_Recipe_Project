package com.boot.store.order.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.boot.client.member.vo.MemberVO;
import com.boot.common.vo.PageDTO;
import com.boot.store.bascket.service.BascketService;
import com.boot.store.bascket.vo.BascketVO;
import com.boot.store.items.service.ItemsService;
import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.service.OrderService;
import com.boot.store.order.vo.OrderVO;
import com.boot.store.orderList.service.OrderListService;
import com.boot.store.orderList.vo.OrderListVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("login")
@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private OrderListService orderListService;
	
	@Setter(onMethod_ = @Autowired)
	private ItemsService itemsService;
	
	@Setter(onMethod_ = @Autowired)
	private BascketService bascketService;
	
	@PostMapping("/paymentVerification")
	@ResponseBody
	public String paymentVerification(String imp_uid, ItemsVO ivo, int cnt) throws Exception {
		String line = "";
		String result = "";
		
		String token = orderService.getToken();
		
		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid + "?_token="+token);
		
		BufferedReader br = 
				new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		
		while((line = br.readLine()) != null) {
			result = result.concat(line);
		}
		
		JSONParser jsonParser = new JSONParser();
		
		JSONObject obj = (JSONObject)jsonParser.parse(result);
		
		JSONObject response = (JSONObject)obj.get("response");
		
		String amount = String.valueOf(response.get("amount"));
		
		int pay = Integer.parseInt(amount);
		
		int i_price = Integer.parseInt(orderService.getItemPrice(ivo));
		
		i_price = i_price * cnt;
		
		log.info(amount);
		log.info(String.valueOf(i_price));
		
		String verification = "111";
		
		if(pay == i_price) {
			verification = "성공";
		} else {
			verification = "실패";
		}
		
		return verification;
	}
	
	@PostMapping("/paymentCancel")
	@ResponseBody
	public String paymentCancel(String imp_uid, String amount) throws Exception {
		String token = orderService.getToken();
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		Map<String, Object> map = new HashMap<>();
		map.put("imp_uid", imp_uid);
		map.put("amount", amount);
		
		JSONObject body = new JSONObject(map);
		
		HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
		ResponseEntity<JSONObject> cancelJson = restTemplate.postForEntity("https://api.iamport.kr/payments/cancel?_token="+token, entity, JSONObject.class);
		
		
		JSONParser jsonParser = new JSONParser();
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(cancelJson.getBody().get("response"));
		JSONObject obj = (JSONObject)jsonParser.parse(jsonStr);
		
		String status = (String)obj.get("status");
		
		String res = "";
		if(status.equals("cancelled")) {
			res="결제 취소";
		} else {
			res="결제 취소 실패";
		}
		
		return res;
	}
	
	
	@PostMapping("/addOneOrder")
	public String addOneOrder(OrderListVO olvo) {
		String url = "";
		
		OrderVO ovo = olvo.getOvo();
		ovo.setMvo(olvo.getMvo());
		
		int result = 0;
		result = orderService.addOrder(ovo);
		
		if(result != 0) {
			url = "redirect:/store/itemsDetail?i_num="+olvo.getIvo().getI_num()+"&i_parts="+olvo.getIvo().getI_parts();
			orderListService.addOrderList(olvo);
			
			ItemsVO ivo = olvo.getIvo();
			ivo.setI_quan(olvo.getOl_quan());
			
			itemsService.updateItemsQuan(ivo); // 수량 변경
			
		} else if(result == 0) {
			url = "/error/";
		}
		
		return url;
	}
	
	@PostMapping("/addOrder")
	@ResponseBody
	public String addOrder(OrderVO ovo,
			@SessionAttribute(name="login", required=false) MemberVO mvo) {
		
		String response = "";
		int result = 0;
		
		ovo.setMvo(mvo);
		result = orderService.addOrder(ovo);
		
		if(result != 0) {
			response="성공";
		} else {
			response="실패";
		}
		return response;
	}
	
	@PostMapping("/addOrders")
	@ResponseBody
	public String addOrders(OrderListVO olvo, OrderVO ovo, BascketVO bvo, ItemsVO ivo,
			@SessionAttribute(name="login", required=false) MemberVO mvo) {
		String response = "";
		
		log.info(mvo.toString());
		
		int result = 0;
		olvo.setMvo(mvo);
		olvo.setOvo(ovo);
		olvo.setIvo(ivo);
		result = orderListService.addOrderList(olvo);
		
		if(result!=0) {
			ivo.setI_quan(olvo.getOl_quan());
			itemsService.updateItemsQuan(ivo);
			
			bascketService.deleteBascket(bvo);
			
			response = "성공";
		} else {
			response = "실패";
		}
		
		return response;
	}
	
	@GetMapping("/orderList")
	public String orderList(@SessionAttribute(name="login", required=false) MemberVO mvo,
			OrderListVO olvo,
			Model model) {
		
		List<OrderListVO> list = null;
		
		if(mvo!=null) {
			olvo.setMvo(mvo);
			list = orderListService.orderList(olvo);
			
			model.addAttribute("order", list);
			
			int total = orderListService.orderListCnt(mvo);
			
			model.addAttribute("pageMaker", new PageDTO(olvo, total));
		}
		
		return "member/orderList";
	}
	
	@GetMapping("/updateState")
	public String updateState(OrderListVO olvo) {
		String url = "";
		
		int result = 0;
		result = orderListService.updateState(olvo);
		
		if(result!=0) {
			url="redirect:/order/orderList";
		}
		
		
		return url;
	}
}
