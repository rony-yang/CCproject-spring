package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BbsDTO {
	private int bbsID;
	private String bbsTitle; 
	private String bbsContent; 
	private String userId;
	private Date bbsDate; 
	private String studyCode;
}
