package com.example.mapper;

import java.util.List;

import com.example.domain.StudyDTO;
import com.example.domain.StudyVO;


public interface StudyMapper {
	//@Select("select * from tbl_board where bno > 0")
	//리스트 조회
	public List<StudyVO> getList() ;
	
	//강의 조회	
	public StudyVO read(String studyCode);
	
	public int insert(StudyDTO dto);
	
	//강의 삭제
	public int delete (String studyCode);
	

	
}
