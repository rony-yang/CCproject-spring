package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.Criteria;
import com.example.domain.StudyDTO;
import com.example.domain.StudyVO;
import com.example.mapper.StudyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StudyServiceImpl implements StudyService{
	StudyMapper mapper;

	//리스트
	public List<StudyVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}
	
	//상세정보
	public StudyVO get(String studyCode) {
		log.info("get....."+studyCode);
		return mapper.read(studyCode);
	}

	@Override
	public int insert(StudyDTO dto) {
		log.info("insert......" + dto);
		
		return mapper.insert(dto);
	}

	
	
}
