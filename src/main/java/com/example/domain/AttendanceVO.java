package com.example.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class AttendanceVO {
	private String studyCode;
	private String attendanceDate;
	private Time attendanceJoin;
	private Time attendanceExit;
	private String attendanceResult;
}
