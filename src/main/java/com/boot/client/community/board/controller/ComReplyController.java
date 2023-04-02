package com.boot.client.community.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.client.community.board.service.ComReplyService;
import com.boot.client.community.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value="/comReply")
@Controller
@Slf4j
public class ComReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ComReplyService comReplyService;
	
	@GetMapping(value="/replyList/{c_no}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("c_no") Integer c_no) {
		log.info("replyList 성공");
		
		List<ReplyVO> result = comReplyService.replyList(c_no);
		
		return result;
	}
	
	@PostMapping(value="/replyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyInsert(@RequestBody  ReplyVO rvo) {
		log.info("replyInsert 호출 성공");
		
		int result = comReplyService.replyInsert(rvo);
		
		return (result == 1) ? "SUCCESS": "FAILURE";
	}
	
	
	@PostMapping(value="/replyUpdate", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyUpdate(@RequestBody ReplyVO rvo) {
		log.info("수정 폼 호출");
		
		int result = comReplyService.replyUpdate(rvo);

		return (result == 1) ? "SUCCESS": "FAILURE";
	}
	
	@DeleteMapping(value = "/replyDelete/{cr_no}")
	public String replyDelete(@PathVariable("cr_no") int cr_no) {
		log.info("댓글 삭제 호출");
		log.info("cr_no : " + cr_no);
		
		int result = comReplyService.replyDelete(cr_no);
		
		log.info("후 : " + result);
		
		return (result == 1) ? "SUCCESS": "FAILURE";
	}
	
	
	
}
