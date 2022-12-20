package com.example.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.Criteria;
import com.example.domain.StudyVO;
import com.example.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*study*/")
@AllArgsConstructor
public class StudyController {
	private StudyService service;
	
	@GetMapping(value="/welcome")
	public void welcome() {
		
	}
	
	@GetMapping("/list") //목록조회
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list",service.getList());
	}
	
	@GetMapping("/get") // 상세정보
	public void get(@RequestParam("studyCode") String studyCode, Model model) {
		log.info("/get");
		model.addAttribute("study",service.get(studyCode));
	}
}
