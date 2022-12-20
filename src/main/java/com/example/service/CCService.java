package com.example.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AttendanceDTO;
import com.example.domain.AttendanceVO;
import com.example.domain.Criteria;

public interface CCService {
	public AttendanceDTO getAllDate(String userId, String studyCode);
	public List<AttendanceDTO> getAllStudy(String userId, Criteria cri);
	
	public List<AttendanceVO> getCheckList(String userId, Criteria cri);
	public int joinAttendance (String userId, String studyCode);
	public int exitAttendance (String userId, String studyCode);
	
	public List<AttendanceVO> getPagedCheckList(String userId, String studyCode, Criteria cri);
	public int getTotalPage(String userId, String studyCode, Criteria cri);
	
	public void get1();
	
}
