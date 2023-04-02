package com.boot.store.order.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.dao.OrderDao;
import com.boot.store.order.vo.OrderVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderDao orderDao;
	
	@Override
	public String getToken() throws Exception{
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		Map<String, Object> map = new HashMap<>();
		map.put("imp_key", "4745308074114718");
		map.put("imp_secret", "Wi0lks8AW1caGsn6ZICALicexXeeCVFp4COl0RQYJCpfspjKkfnDSAZAHJNvlMlStl5eQSMl9dF6TJ1u");
		
		JSONObject body = new JSONObject(map);
		//log.info("json 생성");
		
		HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
		ResponseEntity<JSONObject> token = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", entity, JSONObject.class);
		log.info("토큰 발급");
		
		JSONParser jsonParser = new JSONParser();
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(token.getBody().get("response"));
		JSONObject response = (JSONObject) jsonParser.parse(jsonStr);
		
		String access_token = (String)response.get("access_token");
		
		log.info(access_token);
		
		return access_token;
	}
	
	@Override
	public String getItemPrice(ItemsVO ivo) {
		String result = "";
		result = orderDao.getItemPrice(ivo);
		return result;
	}
	
	@Override
	public int addOrder(OrderVO vo) {
		int result = 0;
		result = orderDao.addOrder(vo);
		
		return result;
	}
	
}
