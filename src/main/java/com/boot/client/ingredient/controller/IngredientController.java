package com.boot.client.ingredient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.client.refrigerator.service.FridgeService;
import com.boot.client.refrigerator.vo.IngredientVO;

import lombok.Setter;

@RestController
@RequestMapping(value = "/igr")
public class IngredientController {
	
	@Setter(onMethod_=@Autowired)
	private FridgeService fridgeService;
	
	/* 재료 리스트 호출 */
	@GetMapping(value = "/igrList", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<IngredientVO> igrList(){
		List<IngredientVO> ingredient = fridgeService.igrList();
		return ingredient;
	}
	
	/* 재료 검색 */
	@GetMapping(value = "/searchIgr/{igr_name}")
	public List<IngredientVO> searchIgr(@PathVariable("igr_name") String igr_name){
		List<IngredientVO> ingredient = fridgeService.searchIgr(igr_name);
		return ingredient;
	}
}
