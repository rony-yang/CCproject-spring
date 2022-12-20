package com.example.domain;

import java.sql.*;

import lombok.Data;

@Data
public class StudyDTO {
	private String studyCode;
	private String studyCourse;
	private String studyContent;
	private Date studyStartDate;
	private Date studyEndDate;
	private String studyStartTime; 
	private String studyEndTime;
	private String studyTeacher;
	private int studyPrice;
	private String studyImage;
	
	
}
