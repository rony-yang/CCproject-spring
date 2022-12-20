package com.example.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.UsersDTO;
import com.example.service.UserInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/userinfo/*")
@Controller
@Log4j
@AllArgsConstructor
public class UserInfoContoller {
	private UserInfoService uiService;
	
	@GetMapping(value="/mainInfo")
	public String mainInfo() {
		return "redirect:/study/welcome/";
	}
	
	@GetMapping(value="/success")
	public void loginSuccess(Model model) {
		
		log.info(model);
	}
	
	@GetMapping(value="/login")
	public void login() {
		
	}
	
	@PostMapping(value="/login")
	public String processLogin(UsersDTO usersDTO, HttpSession session, Model model) {
		log.info(usersDTO);
		UsersDTO sessionId = uiService.readID(usersDTO);
		
		log.info(sessionId);
		
		if(sessionId!=null) {
			session.setAttribute("sessionId", sessionId.getUserId());
			session.setAttribute("userName", sessionId.getUserName());
			log.info(sessionId.getUserId());
			model.addAttribute("resultValue", "로그인");
			model.addAttribute("result", "login");
			return "redirect:/userinfo/success";
			
		}else{
			model.addAttribute("error", "error"); // 이 녀석 request 객체에 달려감.
			return "redirect:/userinfo/login";
		}
	}

	@GetMapping("/join")
	public void join(){
		log.info("join 진입");
	}
	
	@PostMapping("/join")
	public String processJoin(UsersDTO dto, Model model) {
		log.info("join 처리 진입");
		int check = uiService.insertID(dto);
		log.info(check);
		if(check == 1) {
			model.addAttribute("resultValue", "회원가입");	
			model.addAttribute("result", "register");
			return "redirect:/userinfo/success"; // 성공 시에는 이쪽으로
		}else {
			return "redirect:/study/welcome/"; // 실패했을 경우에는 이쪽으로 
		}
	}
	
	@GetMapping("/updateUser")
	public void updateUser(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sessionId");
		UsersDTO userInfo = uiService.checkUser(id);
		model.addAttribute("userInfo", userInfo);
	
		log.info("updateUser 진입");
	}
		
	@PostMapping("/updateUser")
	public String processUpdateUser(UsersDTO dto) {
		log.info(dto);
		log.info("processUpdateUser......");
		uiService.updateID(dto);
		return "redirect:/userinfo/mainInfo";
	}
	
	@GetMapping("/deleteUser")
	public String delete (UsersDTO dto, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sessionId");
		dto.setUserId(id);		
		log.info(dto);
		log.info("process Delete......");
		if(uiService.deleteID(dto)==1) {
			session.invalidate();
			model.addAttribute("resultValue", "회원 탈퇴");
			model.addAttribute("result", "delete");
		};
		return "redirect:/userinfo/success";
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/study/welcome/";
	}
	
	@RequestMapping(value="/idCheck/{userId}", method = RequestMethod.POST, produces = "application/text; charset=UTF-8" )
	public @ResponseBody String idCheck(@PathVariable("userId") String userId) {
		
		String result = uiService.checkID(userId);
			
		return result;
	}

}
