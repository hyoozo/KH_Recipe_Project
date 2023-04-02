package com.boot.client.ingredient.controller;

import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.dao.FridgeDAO;
import com.boot.client.refrigerator.service.FridgeService;
import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value = "/igr")
@Slf4j
public class IngredientController {
	@Setter(onMethod_=@Autowired)
	private FridgeService fridgeService;

	/* 추천 레시피 검색 후 리스트 호출 */
//	@GetMapping(value = "/rcpList" )
//	public List<RecipeVO> rcpList(@RequestParam(value="arr[]") List<String> arr ) throws Exception{
//		log.info("rcpList()호출");
//		
//		
//		//String[] arr = igr_name.split(",");
//		//List<RecipeVO> list = fridgeService.selectRecommend(arr);
//		return null;
//	}

	
	/* 재료 리스트 호출 */
	@GetMapping(value = "/igrList", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<IngredientVO> igrList(){
		log.info("igrList()호출");
		List<IngredientVO> ingredient = fridgeService.igrList();
		log.info(ingredient.toString());
		return ingredient;
	}
	
	/* 재료 검색 */
	@GetMapping(value = "/searchIgr/{igr_name}")
	public List<IngredientVO> searchIgr(@PathVariable("igr_name") String igr_name){
		log.info("searchIgr()호출");
		List<IngredientVO> ingredient = fridgeService.searchIgr(igr_name);
		log.info(ingredient.toString());
		return ingredient;
	}
}
