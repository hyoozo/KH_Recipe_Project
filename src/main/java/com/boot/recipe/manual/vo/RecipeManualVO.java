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
	
	
	private MultipartFile file01;
	private MultipartFile file02;
	private MultipartFile file03;
	private MultipartFile file04;
	private MultipartFile file05;
	private MultipartFile file06;
}
