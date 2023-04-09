package com.boot.client.community.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.client.community.board.service.Commu_YtbService;
import com.boot.client.community.board.service.CommunityService;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.community.youtube.vo.Commu_YtbVO;
import com.boot.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@Controller
@Slf4j
public class Commu_YtbController {
	
	@Setter(onMethod_ = @Autowired)
	private Commu_YtbService commu_YtbService;
	
	
	@GetMapping(value="/ComYtb", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<Commu_YtbVO> ytb() {	
		
		List<Commu_YtbVO> resultYtb = commu_YtbService.Ytb();
		
		return resultYtb;
	}
}
