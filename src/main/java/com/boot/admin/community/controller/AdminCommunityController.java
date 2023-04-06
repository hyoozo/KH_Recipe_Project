package com.boot.admin.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.admin.community.dao.CommunityManagerDao;
import com.boot.admin.community.service.CommunityManagerService;
import com.boot.admin.community.vo.CommunityManagerVO;
import com.boot.client.community.board.service.CommunityService;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;
import com.boot.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@RequestMapping("/admin/community/*")
@Controller
@Slf4j
public class AdminCommunityController {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityService communityService;
	
	@Setter(onMethod_ = @Autowired)
	private CommunityManagerService communityManagerService;
	
	@GetMapping("/postList")
	public String postList(@ModelAttribute CommunityVO cvo,@ModelAttribute CommunityManagerVO cmvo,Model model) {
		
		List<CommunityVO> resultList = communityService.postList(cvo);
		model.addAttribute("postList", resultList);
		
		int total = communityService.comListCnt(cvo);
		model.addAttribute("pageMaker1",new PageDTO(cvo,total));
		
		List<CommunityManagerVO> result = communityManagerService.mngList(cmvo);
		model.addAttribute("MngList", result);
		
		int cnt = communityManagerService.mngComListCnt(cmvo);
		model.addAttribute("pageMaker2",new PageDTO(cmvo,cnt));
		
		return "admin/community/postList";
	}
	
	
	@GetMapping("/postDetail")
	public String postDetail(@ModelAttribute CommunityVO cvo, Model model) {
		log.info("postDetail 호출 성공");
		
		CommunityVO postDetail = communityService.postDetail(cvo);
		model.addAttribute("postDetail",postDetail);
		
		return "admin/community/postDetail";
	}
	
	@GetMapping("/postDelete")
	public String postDelete(@ModelAttribute CommunityVO cvo, Model model) throws Exception {
		log.info("postDelete 호출 성공");
		
		int result = 0;
		String path = "";
		
		result = communityService.postDelete(cvo);
		log.info("에러 : " + result);
		
		if(result == 1) {
			path = "/admin/community/postList";
		} else {
			path = "/admin/community/postDetail?c_no="+cvo.getC_no();
		}
		
		return "redirect:" + path;
	}
	
	
	
	
	
	//관리자
	@GetMapping("/mngPostDetail")
	public String mngPostDetail(@ModelAttribute CommunityManagerVO cmvo, Model model) {
		log.info("postDetail 호출 성공");
		
		CommunityManagerVO postDetail = communityManagerService.mngPostDetail(cmvo);
		model.addAttribute("mngPostDetail",postDetail);
		
		return "admin/community/mngPostDetail";
	}
	
	@GetMapping("/mngInsertForm")
	public String mngInsertForm(Model model, RedirectAttributes ras) {
		log.info("글쓰기 화면 출력 성공");
		
		return "admin/community/mngInsertForm";
	}
	
	@PostMapping("/mngPostInsert")
	public String mngPostInsert(@ModelAttribute CommunityManagerVO cmvo) throws Exception {
		
		int result = 0;
		String path = "";
		
		result = communityManagerService.mngPostInsert(cmvo);
		
		log.info("error" + cmvo);
		
		if(result == 1) {
			path = "/admin/community/postList";
		} else {
			path = "/admin/community/mngInsertForm";
		}
		
		return "redirect:" + path;
	}	
	
	@GetMapping("/mngUpdateForm")
	public String mngUpdateForm(@ModelAttribute CommunityManagerVO cmvo,Model model) {
		log.info("글쓰기 화면 출력 성공");
		
		CommunityManagerVO result = communityManagerService.mngUpdateForm(cmvo);
		
		model.addAttribute("mngUpdateForm",result);
		
		return "admin/community/mngPostUpdate";
	}
	
	@PostMapping("/mngPostUpdate")
	public String mngPostUpdate(@ModelAttribute CommunityManagerVO cmvo, Model model) throws Exception{
		log.info("postUpdate 호출 성공");
		
		int result = 0;
		String path = "";
		
		result = communityManagerService.mngPostUpdate(cmvo);
		
		if(result == 1) {
			path = "/admin/community/postDetail?c_no="+cmvo.getCm_no();
		} else {
			path = "/admin/community/updateForm?c_no="+cmvo.getCm_no();
		}
		
		return "redirect:" + path;
	}
	
	@GetMapping("/mngPostDelete")
	public String mngPostDelete(@ModelAttribute CommunityManagerVO cmvo, Model model) throws Exception {
		log.info("postDelete 호출 성공");
		
		int result = 0;
		String path = "";
		log.info("error:"  + cmvo); 
		
		result = communityManagerService.mngPostDelete(cmvo);
		
		if(result == 1) {
			path = "/admin/community/postList";
		} else {
			path = "/admin/community/postDetail?c_no="+cmvo.getCm_no();
		}
		
		return "redirect:" + path;
	}
}
