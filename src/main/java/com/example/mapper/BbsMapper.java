package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BbsVO;
import com.example.domain.BoardVO;


public interface BbsMapper {

//	@Select("select * from bbs where bbsid > 0")
// 페이지 게시물 리스트 가져오기
	public List<BbsVO> getList();

//	public List<BbsVO> getListWithPaging(Criteria cri);
	
	//게시물 등록
	public void insert(BbsVO board);
	public void insertSelectKey(BbsVO board);
	
	//읽기
	public BbsVO read(@Param("bbsID")Long bbsID);
	//지우기
	public int delete(Long bbsID);
	//수정하기
	public int update(BbsVO board);

	//개인게시판 가져오기					
	public List<BbsVO> getlist_persnal(@Param ("userId") String userId);

	//반 게시판 가져오기
	public List<BbsVO> getlist_study(@Param ("userId") String userId, @Param ("studyCode") String studyCode);
	
	public List<BoardVO> getStudyName(@Param ("userId") String userId);
	public List<BoardVO> getAllStudyName();

}
