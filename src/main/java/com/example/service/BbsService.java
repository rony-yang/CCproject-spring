package com.example.service;

import java.util.List;

import com.example.domain.BbsVO;
import com.example.domain.BoardVO;


public interface BbsService {

	//페이징 게시물가져오기
	public List<BbsVO> getList();
	
	//게시물 등록
	public void register(BbsVO board);
	//게시물 가져오기
	public BbsVO get(Long bno);
	//게시물 삭제
	public boolean remove(Long bno);
	//게시물 수정하기
	public boolean modify(BbsVO board);

	//개인 게시판 불러오기
	public List<BbsVO> getlist_persnal(String userId);
//	public List<BbsVO> getlist_persnal();

	//반 게시판 불러오기
	public List<BbsVO> getlist_study(String userId, String studyCode);
	public List<BoardVO> getStudy(String userId);
	

	

	
	
	
	
}
