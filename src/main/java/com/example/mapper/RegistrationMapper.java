package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.RegistrationConfirmDTO;
import com.example.domain.RegistrationDTO;

public interface RegistrationMapper {

	/* 수강신청(장바구니 추가) */
	public int Course_regist(String studyCode) throws Exception;
	
	/* 수강삭제(장바구니 삭제) */
	public int Course_delete(@Param("userId") String userId,@Param("studyCode") String studyCode);
	
	/* 수강수정(장바구니 수정) */
	public int Course_fix(String userId, String studyCode);	
	
	/* 수강목록(장바구니 리스트) */
	public List<RegistrationConfirmDTO> Course_list(String userId);
	
	public List<RegistrationConfirmDTO> entire_list();
	
	/* 매개변수 여러개 한번에 객체로 받기 */
	public int Course_regist(RegistrationDTO registration);
	public int Course_delete(RegistrationDTO registration);
	public int Course_fix(RegistrationDTO registration);
	
	public int update(@Param("userId") String userId, @Param("studyCode") String studyCode, @Param("status") int status);
	
}


