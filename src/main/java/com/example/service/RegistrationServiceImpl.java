package com.example.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.domain.RegistrationConfirmDTO;
import com.example.domain.RegistrationDTO;
import com.example.mapper.RegistrationMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	private RegistrationMapper registrationMapper;
	
	// 수강신청 목록조회
	@Override
	public List<RegistrationConfirmDTO> Course_list(String userId) {
		List<RegistrationConfirmDTO> registrationList 
		= (List<RegistrationConfirmDTO>) registrationMapper.Course_list(userId);
		
		return registrationList;
	}
	
	
	
	@Override
	public List<RegistrationConfirmDTO> Course_allList() {

		return registrationMapper.entire_list();
	}



	@Override
	public int update(String userid, String studyCode, String status) {
		int studyAllow =1;
		
		log.info(status);
		if(status.equals("승인")) {
			
		}
		else {
			studyAllow =0;
		}
		
		return registrationMapper.update(userid, studyCode, studyAllow);
	}



	// 수강신청 성공 : 1 & 에러 시 0 반환
	@Override  
	public int Course_regist(RegistrationDTO registration) {
		
		// 예외상황 추가해야함
		try {
			return registrationMapper.Course_regist(registration);
		} catch (Exception e) {
			return 0;
		}			
	} 

	@Override
	public int Course_regist(String studyCode) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 수강취소 (장바구니 삭제) 
	@Override
	public int Course_delete(String userId, String studyCode) {
		
		log.info("Service delete......");
		
		return registrationMapper.Course_delete(userId, studyCode);
	}

	@Override
	public int Course_delete(RegistrationDTO registration) {
		// 수강취소 성공 : 2 & 에러 시 0 반환
		try {
			return registrationMapper.Course_delete(registration);
		} catch (Exception e) {
			return 0;
		}	
	}
	
	// 수강수정(장바구니 수정)
	@Override
	public int Course_fix(String userId, String studyCode) {
		return 0;
	}
	
	@Override
	public int Course_fix(RegistrationDTO registration) {
		try {
			return registrationMapper.Course_fix(registration);
		} catch (Exception e) {
			return 0;
		}	
	}






	
	
}
