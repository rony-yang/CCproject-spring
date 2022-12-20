package com.example.domain;

import java.util.Date;

import lombok.Data;

// 수강신청하면(장바구니) 볼수있는 정보

@Data
public class RegistrationConfirmDTO {
	private String userId;			// 사용자 아이디
	private String studyCode;		// 수강과정코드
	private String studyCourse;		// 수강과정명
	private Date studyStartDate;	// 교육시작일
	private int studyPrice;			// 수강료
	private String status;
}
