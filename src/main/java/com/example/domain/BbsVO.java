package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BbsVO {

	private long bbs_seq; //게시물 넘버
	
	private long bbsID;		  //게시판 아이디 
	private String bbsTitle;	  //게시물 이름
	private String bbsContent;	  //게시물 내용
	private String userId;		//유저에서 가져오기, 관리자아이디에는 권한 획득
	private Date bbsDate;		  //게시판 날짜	
	// https://galid1.tistory.com/566 참고
	private String studyCode;   //스터디에서 가져오기
	
	//보드 이름은 Bbs
}