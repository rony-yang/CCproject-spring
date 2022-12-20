package com.example.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.AttendanceDTO;
import com.example.domain.AttendanceVO;
import com.example.domain.Criteria;
import com.example.domain.UsersDTO;
import com.example.service.CCService;
import com.example.service.UserInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/check/*")
@Controller
@Log4j
@AllArgsConstructor
public class CheckController {
	private CCService ccService;
	
	@GetMapping(value="/info/")
	public void mainInfo(HttpSession session, Model model) {
		Criteria cri = new Criteria(1,5);
				
		String userId = (String)session.getAttribute("sessionId");
		
//		List<AttendanceVO> check = ccService.getCheckList(userId, cri); 
		List<AttendanceDTO> list = ccService.getAllStudy(userId, cri);		
		// 이 녀석을 순차적으로 좌르륵 VO에 담는 형태로 변환시켜줄 것.
		// 우선 이 녀석을 조금 깔끔한 형태로 만드는 것부터 하자.
		
		
		model.addAttribute("list", list);
//		model.addAttribute("check", check);
		log.info(list);
//		log.info(check);
	}
	
	@GetMapping(value="/info/{studyCode}/{page}")
	@ResponseBody
	public List<AttendanceVO> pagenation (@PathVariable("studyCode") String studyCode, @PathVariable("page") int page, HttpSession session) {
		String userId = (String)session.getAttribute("sessionId");
		Criteria cri = new Criteria(page, 5); //임시로 amount는 5로 두겠음.
		
		log.info("studyCode : " + studyCode);
		log.info("page : " + page);
		
		List<AttendanceVO> check = ccService.getPagedCheckList(userId, studyCode, cri);
		
		log.info(check);
		
		return check;
		
	}
	
	
	@GetMapping(value="/join/{studyCode}")
	public String join(@PathVariable("studyCode") String studyCode, HttpSession session) {
		String userId = (String)session.getAttribute("sessionId");
		
		log.info("studyCode : " +studyCode);
		log.info("userId : " +userId);
		
		int result = ccService.joinAttendance(userId, studyCode); // 성공하면 1, 실패하면 0
		log.info(result);
		
		return "redirect:/check/info/";
	}
	
	@GetMapping(value="/exit/{studyCode}")
	public String exit(@PathVariable("studyCode") String studyCode, HttpSession session, RedirectAttributes rttr) {
		String userId = (String)session.getAttribute("sessionId");
		
		log.info("studyCode : " +studyCode);
		log.info("userId : " +userId);
		
		int result = ccService.exitAttendance(userId, studyCode); // 성공하면 1, 실패하면 0
		
		if(result==0) {
			rttr.addFlashAttribute("result", "failed");
		}
		
		log.info(result);
		
		return "redirect:/check/info/";
		
	}
	
}
