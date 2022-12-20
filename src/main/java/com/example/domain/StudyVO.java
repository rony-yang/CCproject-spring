package com.example.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class StudyVO {
	private String studyCode;
	private String studyCourse;
	private String studyContent;
	private Date studyStartDate;
	private Date studyEndDate;
	private Date studyStartTime;
	private Date studyEndTime;
	private String studyTeacher;
	private int studyPrice;
	private String studyImage;
	private String studyStarthour;
	private String studyEndhour;
	private String studyPricedot;
}
