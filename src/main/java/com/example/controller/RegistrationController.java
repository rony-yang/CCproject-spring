package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.RegistrationConfirmDTO;
import com.example.domain.RegistrationDTO;
import com.example.service.RegistrationService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/course/*")
@AllArgsConstructor
public class RegistrationController {
	private RegistrationService registrationService;
	
	// 수강신청 확인페이지 이동	
	// http://localhost:8080/ccProject/course/list?userId=park 으로 접속하면 확인가능
	@GetMapping("/list")
	public void registListGET(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("sessionId");
		// 로그인 체크 코드 필요
			
			
		// 데이터 조회
		List<RegistrationConfirmDTO> list = registrationService.Course_list(userId);	
		model.addAttribute("list", list);
		log.info(list);	
	}
	

	// 수강 등록신청 페이지
	@GetMapping("/regist/{studyCode}")
	public String courseRegistGET(HttpSession session, @PathVariable("studyCode") String studyCode) {
		String userId=(String)session.getAttribute("sessionId");
		
		log.info("userId:"+userId);
		log.info("studyCode:"+studyCode);
		
		RegistrationDTO dto = new RegistrationDTO();
		dto.setStudyCode(studyCode);
		dto.setUserId(userId);
		
		if(userId==null) {
			return "redirect:/userinfo/login/";
		}else {
			// 수강 신청
			registrationService.Course_regist(dto);
			return "redirect:/course/list/";
		}
	}
	
//	//수강 등록 절차.
//	@PostMapping("/regist")
//	public String courseRegistPOST(HttpSession session, String studyCode) throws Exception {
//		
//		String userId=(String)session.getAttribute("sessionId");
//		
//		if()
//		
//		
//		// 수강 신청
//		registrationService.Course_regist(registrationDTO);
//		String val = "userId="+registrationDTO.getUserId();
//		return "redirect:/course/list?" + val;
//	}
	
	// 수강신청 취소(삭제)
	@RequestMapping(value="/delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String courseDeletePOST(String userId, String studyCode) {
		
		log.info("delete userId: "+ userId);		
		log.info("delete studyCode: "+ studyCode);
		
		// 로그인 체크 코드 필요
		
		registrationService.Course_delete(userId, studyCode);
		
		return "redirect:/course/list";
	}
	
//	
//	// 수강신청 취소(삭제)
//	@PostMapping("/delete")
//	public String courseDeletePOST(RegistrationDTO registrationDTO) {
//		
//		// 로그인 체크 코드 필요
//		
//		registrationService.Course_delete(registrationDTO);
//		String val = "userId="+registrationDTO.getUserId();
//		return "redirect:/course/list?" + val;
//	}
//	
//	@GetMapping("/delete")
//	public void courseDeleteGET() {
//
//	}

	// 수강 수정 
	@PostMapping("/fix")
	public String courseFixPOST(RegistrationDTO registrationDTO) {
		
		// 로그인 체크 코드 필요
		
		registrationService.Course_fix(registrationDTO);
		String val = "userId="+registrationDTO.getUserId();
		return "redirect:/course/list?" + val;
	}	
	
	@GetMapping("/fix")
	public void courseFixGET() {

	}
	

}
