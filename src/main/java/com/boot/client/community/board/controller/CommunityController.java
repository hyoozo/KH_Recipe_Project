package com.boot.client.community.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.admin.community.service.CommunityManagerService;
import com.boot.admin.community.vo.CommunityManagerVO;
import com.boot.client.community.board.service.CommunityService;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;
import com.boot.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/community/*")
@Slf4j
@Controller
public class CommunityController {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityService communityService;
	
	@Setter(onMethod_ = @Autowired)
	private CommunityManagerService communityManagerService;
	
	@GetMapping("/postList")
	public String postList(@ModelAttribute CommunityVO cvo, @ModelAttribute CommunityManagerVO cmvo, Model model) {
		
		List<CommunityVO> resultList = communityService.postList(cvo);
		model.addAttribute("postList", resultList);
		
		int total = communityService.comListCnt(cvo);
		model.addAttribute("pageMaker",new PageDTO(cvo,total));
		
		List<CommunityManagerVO> result = communityManagerService.mngPostList(cmvo);
		model.addAttribute("MngPostList", result);
		
		return "community/postList";
	}
	
	@GetMapping("/postDetail")
	public String postDetail(@ModelAttribute CommunityVO cvo, Model model) {
		
		CommunityVO postDetail = communityService.postDetail(cvo);
		model.addAttribute("postDetail",postDetail);
		
		return "community/postDetail";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(@ModelAttribute CommunityVO cvo, Model model) {
		
		CommunityVO result = communityService.updateForm(cvo);
		
		model.addAttribute("updateForm",result);
		
		return "community/updateForm";
	}
	
	@PostMapping("/postUpdate")
	public String postUpdate(@ModelAttribute CommunityVO cvo, Model model) throws Exception{
		
		int result = 0;
		String path = "";
		
		result = communityService.postUpdate(cvo);
		
		if(result == 1) {
			path = "/community/postDetail?c_no="+cvo.getC_no();
		} else {
			path = "/community/updateForm?c_no="+cvo.getC_no();
		}
		
		return "redirect:" + path;
	}
	
	@GetMapping("/postDelete")
	public String postDelete(@ModelAttribute CommunityVO cvo, Model model) throws Exception {
		
		int result = 0;
		String path = "";
		
		result = communityService.postDelete(cvo);
		
		if(result == 1) {
			path = "/community/postList";
		} else {
			path = "/community/postDetail?c_no="+cvo.getC_no();
		}
		
		return "redirect:" + path;
	}
	
	@GetMapping("/insertForm")
	public String insertForm(@SessionAttribute(name = "login", required = false)MemberVO mvo,Model model, RedirectAttributes ras) {
		
		String path = "";
		
		if(mvo == null) {
			ras.addFlashAttribute("useAfter","error");
			path = "redirect:/community/postList";
		} else {
			path = "community/insertForm";
		}
		
		return path;
	}
	
	@PostMapping("/postInsert")
	public String postInsert(@ModelAttribute CommunityVO cvo) throws Exception {
		
		int result = 0;
		String path = ""; 
		
		result = communityService.postInsert(cvo); 
		
		if(result == 1) {
			path = "/community/postList";
		} else {
			path = "/community/insertForm";
		}
		
		return "redirect:" + path;
	}	
	
	
	//공지사항
	@GetMapping("/mngPostDetail")
	public String mngPostDetail(@ModelAttribute CommunityManagerVO cmvo, Model model) {
		
		CommunityManagerVO postDetail = communityManagerService.mngPostDetail(cmvo);
		model.addAttribute("mngPostDetail",postDetail);
		
		return "community/mngPostDetail";
	}
}
