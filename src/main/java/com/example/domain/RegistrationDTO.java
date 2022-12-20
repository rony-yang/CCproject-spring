package com.example.domain;

import lombok.Data;

// 수강신청 

@Data
public class RegistrationDTO {
	private String userId;			// 사용자 아이디
	private String studyCode;		// 수강과정코드
	private Number studyAllow;		// 수강허가
	
}


