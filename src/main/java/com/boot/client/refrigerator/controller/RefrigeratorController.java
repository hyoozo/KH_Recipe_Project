package com.boot.client.refrigerator.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.service.FridgeService;
import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.client.refrigerator.vo.IgrNumVO;
import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/refrigerator/*")
public class RefrigeratorController {
	
	@Setter(onMethod_=@Autowired)
	private FridgeService fridgeService; 
	
	@GetMapping("/refrigeratorView")
	public String refrigeratorView() {
		return "refrigerator/refrigeratorView";
	}

	@PostMapping("/insert")
	@ResponseBody
	public ResponseEntity<String> fridgeIgrInsert(@Param("m_num")int m_num, @Param("igr_num") int igr_num) {
		
		ResponseEntity<String> entity = null;
		int result = 0;
		result = fridgeService.fridgeIgrInsert(m_num, igr_num);
		
		log.info("fridgeIgrInsert result======" + result);
		
		
		entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		
		return entity;
	}

	@GetMapping("/memberIgrList")
	@ResponseBody
	public List<FridgeVO> memberIgrList(MemberVO member) {
		List<FridgeVO> list = null;
		list = fridgeService.memberIgrList(member);
		return list;
	}
	
	@GetMapping("/memberIgrDelete")
	@ResponseBody
	public int memberIgrList(int igr_num, int m_num) {
		int result = 0;
		result = fridgeService.memberIgrDelete(igr_num, m_num);
		return result;
	}
	
	@GetMapping("/fridgeSelect")
	@ResponseBody
	public int fridgeSelect(int igr_num, int m_num) {
		System.out.println("fridgeSelect 호출 m_num ="+ m_num);
		int result = 0;
		result = fridgeService.fridgeSelect(igr_num, m_num);
		System.out.println("fridgeSelect 호출 ="+ result);
		return result;
	}
	
	@PostMapping("/recomView")
	public String recomView(Model model, IgrNumVO listIgrNum) {
		log.info("--->"+listIgrNum.getListIgrNum());
		log.info("recomView 화면 호출");
		
		model.addAttribute("detail", listIgrNum);
		
		return "refrigerator/refrigerator_recipe"; 
	}
	
	/* 서버(Controller)단 : 뷰단에서 넘어온 데이터를 Controller에서 받기위해
	 * HttpServletRequest의 getParameterValues로 선언한 값 받기.
	 * */
	@ResponseBody
	@RequestMapping(value = "selectRecommend", method = RequestMethod.POST)
	//public List<RecipeVO> selectRecommend(@RequestParam(value="arr") String[] array) {
	public List<RecipeVO> selectRecommend(@RequestParam(value="arr") String[] arr, Model model){
		System.out.println("selectRecommend 컨트롤러 실행 =========");
		
		//ArrayList<String> stringArr = igrlist.getListIgrNum();
		//log.info("recomView 화면 호출 후 =>"+stringArr);
		ArrayList<Integer> integetArr = new ArrayList<>();
		
		for(int i = 0; i < arr.length; i++) {
			integetArr.add(Integer.parseInt(arr[i]));
		}
		System.out.println(integetArr);
		
		List<RecipeVO> list = fridgeService.selectRecommend(integetArr);
		model.addAttribute("list", list);
		
		System.out.println("selectRecommend 컨트롤러 실행 후 =========>>>");
		return list;
	}
}
