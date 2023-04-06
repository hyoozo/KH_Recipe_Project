package com.boot.admin.community.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class CommunityManagerVO extends com.boot.common.vo.CommonVO{
	private int cm_no;			//일련
	private String cm_title;	//제목
	private String cm_writer;	//작성자
	private String cm_comment;	//내용
	private String cm_img;		//이미지
	private String cm_readcnt;	//조회수
	private String cm_reg_date;	//등록날짜
	private int mng_num;		//관리자 일련번호
	private MultipartFile file;	//업로드
}
