package com.boot.client.community.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.community.youtube.vo.Commu_YtbVO;

@Mapper
public interface Commu_YtbDao {
	public List<Commu_YtbVO> Ytb();
}
