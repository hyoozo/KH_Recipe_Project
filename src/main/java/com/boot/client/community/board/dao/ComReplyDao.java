package com.boot.client.community.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.community.reply.vo.ReplyVO;

@Mapper
public interface ComReplyDao {
	public List<ReplyVO> replyList(Integer c_no);
	
	public int replyInsert(ReplyVO rvo);
	
	public int replyUpdate(ReplyVO rvo);
	
	public int replyDelete(Integer cr_no);
}
