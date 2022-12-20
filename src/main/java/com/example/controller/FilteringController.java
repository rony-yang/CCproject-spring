package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.CCService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/fc/*")
@Controller
@Log4j
@AllArgsConstructor
public class FilteringController {
	
	@GetMapping("/userinfo/login/")
	public String userinfoLogin(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			log.info("nulltest success");
			return "redirect:/userinfo/login/";
		}else {	
			return "redirect:/study/welcome/";
		}
	}
	
	@GetMapping("/userinfo/join/")
	public String userinfoJoin(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			log.info("nulltest success");
			return "redirect:/userinfo/join/";
		}	else {		
			return "redirect:/study/welcome/";	
		}
	}
	
	@GetMapping("/userinfo/updateUser/")
	public String userinfoUpdate(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			log.info("nulltest success");
			return "redirect:/userinfo/updateUser/";
		}	else {		
			return "redirect:/study/welcome/";	
		}
	}
	

	@GetMapping("/check/info/")
	public String checkInfo(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			log.info("nulltest success");
			return "redirect:/check/info/";
		}	else {		
			return "redirect:/study/welcome/";	
		}	
	}
	
	@GetMapping("/course/list/")
	public String courseList(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			log.info("nulltest success");
			return "redirect:/course/list/";
		}	else {		
			return "redirect:/study/welcome/";	
		}
	}
	
}
