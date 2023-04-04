package com.boot.client.community.board.service;

import java.util.List;

import com.boot.client.community.reply.vo.ReplyVO;

public interface ComReplyService {
	public List<ReplyVO> replyList(Integer c_no);
	
	public int replyInsert(ReplyVO rvo);
	
	public int replyUpdate(ReplyVO rvo);
	
	public int replyDelete(Integer cr_no);
}
