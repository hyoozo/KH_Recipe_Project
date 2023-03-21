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
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value = "/igr")
@Slf4j
public class IngredientController {
	
	
	@Setter(onMethod_=@Autowired)
	private FridgeService fridgeService;

//	@GetMapping("/igrList")
//	public String igrList(@ModelAttribute IngredientVO ivo, Model model){
//		List<IngredientVO> igrList = fridgeService.igrList(ivo);
//		model.addAttribute("igrList",igrList);
//		return "refrigerator/refrigeratorView";
//	}
	
	/* 재료 리스트 호출 */
	@GetMapping(value = "/igrList", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<IngredientVO> igrList(){
		log.info("igrList()호출");
		List<IngredientVO> ingredient = fridgeService.igrList();
		return ingredient;
	}
	
	/* 추천 레시피 검색 후 리스트 호출 */
	@GetMapping(value = "/rcpList/{igr_name}" )
	public List<IngredientVO> rcpList(@PathVariable("igr_name") String igr_name) throws Exception{
		log.info("rcpList()호출");
		List<IngredientVO> rcpList = fridgeService.recommendRecipe(igr_name);
		return rcpList;
		
	}
}
