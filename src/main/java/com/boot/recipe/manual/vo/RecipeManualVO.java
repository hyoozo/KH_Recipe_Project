package com.boot.recipe.manual.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecipeManualVO {
	private int rcp_seq;
	private MultipartFile file; //파일 업로드를 위한 필드
	private String manual01;
	private String manual_img01;
	private String manual02;
	private String manual_img02;
	private String manual03;
	private String manual_img03;
	private String manual04;
	private String manual_img04;
	private String manual05;
	private String manual_img05;
	private String manual06;
	private String manual_img06;
	private String manual07;
	private String manual_img07;
	private String manual08;
	private String manual_img08;
	private String manual09;
	private String manual_img09;
	private String manual10;
	private String manual_img10;
}
