package com.example.domain;

import java.sql.Time;

import lombok.Data;

@Data
public class AttendanceDTO {
	private String studyCode;
	private String totalDate;
	private String currentDate;
	private String checkDate;
	private Time startTime;
	private Time endTime;
	private int totalPage;
}
