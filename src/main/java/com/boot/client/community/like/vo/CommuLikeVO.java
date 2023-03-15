package com.boot.client.community.like.vo;

import lombok.Data;

@Data
public class CommuLikeVO {
	private int m_num; // 회원 번호
	private int c_no; // 게시글 번호
	private int c_like; // 게시글 좋아요
}
