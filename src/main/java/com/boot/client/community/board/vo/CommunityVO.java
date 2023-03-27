package com.boot.client.community.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.boot.client.refrigerator.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class CommunityVO extends CommonVO{
	private int c_no; // 게시글 번호
	private String c_title; // 제목
	private String c_category; // 카테고리
	private String c_writer; // 작성자
	private String c_comment; // 내용
	private MultipartFile file; //파일 업로드를 위한 필드
	private String c_img; // 이미지
	private String c_readcnt; // 조회수
	private String c_reg_date; // 등록일자
	private int m_num; //회원번호
}
