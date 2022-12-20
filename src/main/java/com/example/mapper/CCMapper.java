package com.example.mapper;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AttendanceVO;

public interface CCMapper {
	public String getTotalDate(@Param("startDate") String startDate, @Param("endDate") String endDate);
	public String getCurrentDate(@Param("startDate") String startDate, @Param("endDate") String endDate);
	public String getCheckDate(@Param("userId") String userId, @Param("studyCode") String studyCode);
	
	public Date getStartDate(String course);
	public Date getEndDate(String course);
	
	public Time getStartTime(@Param("studyCode") String studyCode);
	public Time getEndTime(@Param("studyCode") String studyCode);

	public int insertJoinAttendance(@Param("userId") String userId, @Param("studyCode") String studyCode);
	public int updateJoinAttendance(@Param("userId") String userId, @Param("studyCode") String studyCode);
	public int updateExitAttendance(@Param("userId") String userId, @Param("studyCode") String studyCode);
	public int selectTodayCheck(@Param("userId") String userId, @Param("studyCode") String studyCode);
	
	public List<String> getStudyCode(@Param("userId") String userId);
	public List<AttendanceVO> getCheckList(@Param("userId") String userId, @Param("studyCode")String studyCode, @Param("a")int a, @Param("b")int b);
	
	public int getTotalPage(@Param("userId") String userId, @Param("studyCode")String studyCode);
	public List<AttendanceVO> getPagedCheckList(@Param("userId") String userId, @Param("studyCode") String studyCode, @Param("a")int a, @Param("b")int b);
	
}
