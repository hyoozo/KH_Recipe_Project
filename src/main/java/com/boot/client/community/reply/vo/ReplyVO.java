package com.boot.client.community.reply.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int cr_no; // 게시글 댓글 번호
	private String cr_writer; // 작성자
	private String cr_content; // 내용
	private String c_no; // 게시글 번호
}
