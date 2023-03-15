package com.boot.store.items.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ItemsVO {
	private int i_num; // 제품번호
	private String i_parts; // 제품분류
	private String i_name; // 제품명
	private String i_price; // 가격
	private int i_quan; //재고량
	private MultipartFile file; //파일 업로드를 위한 필드
	private String i_img; // 제품 이미지
}
