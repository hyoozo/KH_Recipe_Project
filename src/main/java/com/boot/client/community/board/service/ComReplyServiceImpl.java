package com.boot.client.community.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.community.board.dao.ComReplyDao;
import com.boot.client.community.reply.vo.ReplyVO;

import lombok.Setter;

@Service
public class ComReplyServiceImpl implements ComReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ComReplyDao comReplyDao;

	@Override
	public List<ReplyVO> replyList(Integer c_no) {
		List<ReplyVO> reply = null;
		
		reply = comReplyDao.replyList(c_no);
		
		return reply;
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		int reply = 0;
		
		reply = comReplyDao.replyInsert(rvo);
		
		return reply;
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		int reply = 0;
		
		reply = comReplyDao.replyUpdate(rvo);
		
		return reply;
	}

	@Override
	public int replyDelete(Integer cr_no) {
		int reply = comReplyDao.replyDelete(cr_no);
		
		return reply;
	}
	
	
	
	

}
