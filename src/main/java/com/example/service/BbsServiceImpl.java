package com.example.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BbsVO;
import com.example.domain.BoardVO;
import com.example.mapper.BbsMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BbsServiceImpl implements BbsService {

	@Setter(onMethod_ = @Autowired)
	private BbsMapper mapper;
	
	@Override
	public List<BbsVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}
	
	@Override
	public void register(BbsVO board) {
		log.info("register....." + board);
		mapper.insertSelectKey(board);
	}
	
	@Override
	public BbsVO get(Long bbsID) {
		log.info("get...." + bbsID);
		return mapper.read(bbsID);
	}
	
	@Override
	public boolean remove(Long bbsID) {
		log.info("remove..." + bbsID);
		return mapper.delete(bbsID) == 1;
	}

	@Override
	public boolean modify(BbsVO board) {
		log.info("modify....." + board);
		return mapper.update(board) == 1;
	}
	
	//개인 게시판 불러오기
	@Override
	public List<BbsVO> getlist_persnal(String userId) {
//	public List<BbsVO> getlist_persnal() {
		log.info("getList_persnal.....");
		return mapper.getlist_persnal(userId);
	}

	//반 게시판 불러오기
	@Override
	public List<BbsVO> getlist_study(String userId, String studyCode) {
		log.info("getlist_study.....");
		return mapper.getlist_study(userId, studyCode);
	}

	@Override
	public List<BoardVO> getStudy(String userId) {
		if(userId.equals("admin")) {
			return mapper.getAllStudyName();
		}else {
			return mapper.getStudyName(userId);
		}
		
	}
	

}
