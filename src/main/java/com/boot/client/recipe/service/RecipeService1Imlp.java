package com.boot.client.recipe.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.recipe.dao.RecipeDao1;
import com.boot.common.file.FileUploadUtil;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

import lombok.Setter;

@Service
public class RecipeService1Imlp implements RecipeService1 {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao1 recipeDao1;

	@Override
	public List<RecipeVO> recipeList(RecipeVO rvo) {
		List<RecipeVO> list = null;
		list = recipeDao1.recipeList(rvo);
		return list;
	}

	@Override
	public int recipeCnt(RecipeVO rvo) {
		return recipeDao1.recipeCnt(rvo);
	}

	@Override
	public RecipeVO recipeDetail(RecipeVO rvo) {
		RecipeVO detail = null;
		detail = recipeDao1.recipeDetail(rvo);
		return detail;
	}

	@Override
	public RecLikeVO findLike(RecLikeVO lvo) {
		return recipeDao1.findLike(lvo);
	}

	@Override
	public int insertLike(RecLikeVO lvo) {
		return recipeDao1.insertLike(lvo);
	}
	
	@Override
	public int updateLike(RecLikeVO lvo) {
		return recipeDao1.updateLike(lvo);
	}

	@Override
	public int cancleLike(RecLikeVO lvo) {
		return recipeDao1.cancleLike(lvo);
	}

	@Override
	public int likeCnt(RecipeVO rvo) {
		return recipeDao1.likeCnt(rvo);
	}
	
	@Override
	public int recipeInsert(RecipeVO rvo, RecipeManualVO cvo) throws Exception {
		int result = 0;
	    
	    if (rvo.getFile().getSize() > 0) {
	        String imgUrl = FileUploadUtil.fileUpload(rvo.getFile(), "recipe");
	        rvo.setAtt_file_no_mk(imgUrl); // imgUrl을 att_file_no_mk 필드에 저장
	    }
	    
	    result = recipeDao1.recipeInsert(rvo); // RecipeVO 데이터 삽입
	    
	    if (cvo.getFile01().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile01(), "manual");
	        cvo.setManual_img01(manualUrl);
	    }
	    if (cvo.getFile02().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile02(), "manual");
	        cvo.setManual_img02(manualUrl);
	    }
	    if (cvo.getFile03().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile03(), "manual");
	        cvo.setManual_img03(manualUrl);
	    }
	    if (cvo.getFile04().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile04(), "manual");
	        cvo.setManual_img04(manualUrl);
	    }
	    if (cvo.getFile05().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile05(), "manual");
	        cvo.setManual_img05(manualUrl);
	    }
	    if (cvo.getFile06().getSize() > 0) {
	        String manualUrl = FileUploadUtil.fileUpload(cvo.getFile06(), "manual");
	        cvo.setManual_img06(manualUrl);
	    }
	    result = recipeDao1.recipeManualInsert(cvo);
	    return result;
	}

	@Override
	public int recipeUpdate(RecipeVO rvo, RecipeManualVO cvo) throws Exception {
		int result = 0;
		
		if(!rvo.getFile().isEmpty()) {//등록한 이미지가 있다면
			if(!rvo.getAtt_file_no_mk().isEmpty()) { // 기존에 이미지가 있다면
				FileUploadUtil.fileDelete(rvo.getAtt_file_no_mk()); // 기존의 이미지를 삭제
			}
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "recipe"); //등록한 이미지를 생성해서 recipe폴더에 저장
			rvo.setAtt_file_no_mk(fileName); // 그 이미지를 rvo에 이미지값으로 저장
		}

		result = recipeDao1.recipeUpdate(rvo);
		
		if(!cvo.getFile01().isEmpty()) {
			if(!cvo.getManual_img01().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img01());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile01(), "manual");
			cvo.setManual_img01(fileName);
		}
		if(!cvo.getFile02().isEmpty()) {
			if(!cvo.getManual_img02().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img02());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile02(), "manual");
			cvo.setManual_img02(fileName);
		}
		if(!cvo.getFile03().isEmpty()) {
			if(!cvo.getManual_img03().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img03());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile03(), "manual");
			cvo.setManual_img03(fileName);
		}
		if(!cvo.getFile04().isEmpty()) {
			if(!cvo.getManual_img04().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img04());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile04(), "manual");
			cvo.setManual_img04(fileName);
		}
		if(!cvo.getFile05().isEmpty()) {
			if(!cvo.getManual_img05().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img05());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile05(), "manual");
			cvo.setManual_img05(fileName);
		}
		if(!cvo.getFile06().isEmpty()) {
			if(!cvo.getManual_img06().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getManual_img06());
			}
			String fileName = FileUploadUtil.fileUpload(cvo.getFile06(), "manual");
			cvo.setManual_img06(fileName);
		}
		
		result = recipeDao1.recipeManualUpdate(cvo);
		return result;
	}

	@Override
	public int recipeDelete(RecipeVO rvo, RecipeManualVO cvo) throws Exception {
		int result = 0;
		FileUploadUtil.fileDelete(rvo.getAtt_file_no_mk());
		FileUploadUtil.fileDelete(cvo.getManual_img01());
		FileUploadUtil.fileDelete(cvo.getManual_img02());
		FileUploadUtil.fileDelete(cvo.getManual_img03());
		FileUploadUtil.fileDelete(cvo.getManual_img04());
		FileUploadUtil.fileDelete(cvo.getManual_img05());
		FileUploadUtil.fileDelete(cvo.getManual_img06());
		
		
		result = recipeDao1.recipeManualDelete(cvo);
		result += recipeDao1.recipeDelete(rvo);
		result += recipeDao1.recipeLikeDelete(rvo);
		
		return result ;
	}	
	
}
