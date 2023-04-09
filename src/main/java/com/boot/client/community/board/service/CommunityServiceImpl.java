package com.boot.client.community.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.community.board.dao.CommunityDao;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;
import com.boot.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;
	
	@Override
	public List<CommunityVO> postList(CommunityVO cvo) {
		List<CommunityVO> list = null;
		list = communityDao.postList(cvo);
		return list;
	}

	@Override
	public CommunityVO postDetail(CommunityVO cvo) {
		CommunityVO detail = null;
		
		communityDao.c_readcnt(cvo);

		detail = communityDao.postDetail(cvo);
		if (detail != null) {
			detail.setC_comment(detail.getC_comment().toString().replaceAll("\n", "<br />"));
		}

		return detail;
	}

	@Override
	public CommunityVO updateForm(CommunityVO cvo) {
		CommunityVO update = null;

		update = communityDao.updateForm(cvo);

		return update;
	}

	@Override
	public int postUpdate(CommunityVO cvo) throws Exception {
		int update = 0;
		
		if(!cvo.getFile().isEmpty()) { 
			if(!cvo.getC_img().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getC_img());
			}
			
			String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "board");
			cvo.setC_img(fileName);
		}

		update = communityDao.postUpdate(cvo);

		return update;
	}

	@Override
	public int postDelete(CommunityVO cvo) throws Exception {
		int delete = 0;
		
		if(!cvo.getC_img().isEmpty()) {
			FileUploadUtil.fileDelete(cvo.getC_img());
		}

		delete = communityDao.postDelete(cvo);

		return delete;
	}

	@Override
	public MemberVO insertForm(MemberVO mvo) {
		MemberVO result = null;

		result = communityDao.insertForm(mvo);

		return result;
	}

	@Override
	public int postInsert(CommunityVO cvo) throws Exception{
		int insert = 0;
		if(!cvo.getFile().isEmpty()) {			//새롭게 업로드할 파일이 존재하면
			if(!cvo.getC_img().isEmpty()) {		//기존 파일이 존재하면
				FileUploadUtil.fileDelete(cvo.getC_img());
			}
			
			String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "board");
			cvo.setC_img(fileName);
		}
	  
		insert = communityDao.postInsert(cvo);	
		
		return insert;
	}

	@Override
	public int comListCnt(CommunityVO cvo) {
		int listCnt = 0;
		
		listCnt = communityDao.comListCnt(cvo);
		
		return listCnt;
	}
		

}
