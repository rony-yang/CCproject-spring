package com.example.service;

import java.util.List;

import com.example.domain.StudyDTO;
import com.example.domain.StudyVO;

public interface StudyService {

//	강의목록
	public List<StudyVO> getList();
	
	//강의 조회
	public StudyVO get(String studyCode);
	
	//강의 추가.
	public int insert(StudyDTO dto);

}
