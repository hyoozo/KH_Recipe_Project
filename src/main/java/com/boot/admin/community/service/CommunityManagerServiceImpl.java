package com.boot.admin.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.admin.community.dao.CommunityManagerDao;
import com.boot.admin.community.vo.CommunityManagerVO;
import com.boot.admin.vo.ManagerVO;
import com.boot.client.member.vo.MemberVO;
import com.boot.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommunityManagerServiceImpl implements CommunityManagerService {

	@Setter(onMethod_ = @Autowired)
	private CommunityManagerDao communityManagerDao;
	

	@Override
	public List<CommunityManagerVO> mngPostList(CommunityManagerVO cmvo) {
		List<CommunityManagerVO> list = null;
		list = communityManagerDao.mngPostList(cmvo);
		return list;
	}
	@Override
	public List<CommunityManagerVO> mngList(CommunityManagerVO cmvo) {
		List<CommunityManagerVO> list = null;
		list = communityManagerDao.mngList(cmvo);
		return list;
	}

	@Override
	public CommunityManagerVO mngPostDetail(CommunityManagerVO cmvo) {
		CommunityManagerVO detail = null;
		
		communityManagerDao.mngCm_readcnt(cmvo);
		
		log.info("error : "  + cmvo);

		detail = communityManagerDao.mngPostDetail(cmvo);
		log.info("error2 : "  + detail);
		if (detail != null) {
			detail.setCm_comment(detail.getCm_comment().toString().replaceAll("\n", "<br />"));
		}

		return detail;
	}

	@Override
	public CommunityManagerVO mngUpdateForm(CommunityManagerVO cmvo) {
		CommunityManagerVO update = null;

		update = communityManagerDao.mngUpdateForm(cmvo);

		return update;
	}

	@Override
	public int mngPostUpdate(CommunityManagerVO cmvo) throws Exception {
		int update = 0;
		
		if(!cmvo.getFile().isEmpty()) { 
			if(!cmvo.getCm_img().isEmpty()) {
				FileUploadUtil.fileDelete(cmvo.getCm_img());
			}
			
			String fileName = FileUploadUtil.fileUpload(cmvo.getFile(), "board");
			cmvo.setCm_img(fileName);
		}

		update = communityManagerDao.mngPostUpdate(cmvo);

		return update;
	}

	@Override
	public int mngPostDelete(CommunityManagerVO cmvo) throws Exception {
		int delete = 0;
		
		if(!cmvo.getCm_img().isEmpty()) {
			FileUploadUtil.fileDelete(cmvo.getCm_img());
		}

		delete = communityManagerDao.mngPostDelete(cmvo);

		return delete;
	}

	@Override
	public ManagerVO mngInsertForm(ManagerVO mvo) {
		ManagerVO result = null;

		result = communityManagerDao.mngInsertForm(mvo);

		return result;
	}

	@Override
	public int mngPostInsert(CommunityManagerVO cmvo) throws Exception{
		int insert = 0;
		
		if(!cmvo.getFile().isEmpty()) { 
			if(!cmvo.getCm_img().isEmpty()) {
				FileUploadUtil.fileDelete(cmvo.getCm_img());
			}
			
			String fileName = FileUploadUtil.fileUpload(cmvo.getFile(), "board");
			cmvo.setCm_img(fileName);
		}
	  
		insert = communityManagerDao.mngPostInsert(cmvo);	
		
		return insert;
	}

	@Override
	public int mngComListCnt(CommunityManagerVO cmvo) {
		int result = 0;
		
		result = communityManagerDao.mngComListCnt(cmvo);
		
		return result;
	}
	
	
	
}
