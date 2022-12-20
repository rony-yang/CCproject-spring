package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BbsVO;
import com.example.service.BbsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BbsController {

	private BbsService service;

	@GetMapping("/list") // 1.공지사항 게시판조회
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/list_entry") // 1.공지사항 게시판조회
	public void entry(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sessionId");
		log.info("list");
		model.addAttribute("list", service.getStudy(id));
	}
	
	@GetMapping("/list_persnal") // 1-1 개인 게시판 조회
	public void list_persnal (HttpSession session, Model model) {
//	public void list_persnal (Model model) {
		String userid = (String)session.getAttribute("sessionId");
		log.info("list_persnal");
		model.addAttribute("list", service.getlist_persnal(userid));
	//	model.addAttribute("list", service.getlist_persnal());

	}
	
	@GetMapping("/list_study")
	public void list_study () {
		
	}
	
	@GetMapping("/list/{studyCode}") // 1-2 반 게시판 조회
	public String list_studyCheck (HttpSession session, RedirectAttributes model, @PathVariable("studyCode")String studyCode) {
		String userId = (String)session.getAttribute("sessionId");
				
		log.info("list_study");
		log.info("studyCode : "+studyCode);
		List<BbsVO> list = service.getlist_study(userId, studyCode);
		
		model.addFlashAttribute("list", list);
		
		log.info(list);
		
		return "redirect:/board/list_study/";
	}
	
	
	//입력창 구현하기 위해서 필요
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register") // 2.입력
	public String register(BbsVO board, RedirectAttributes rttr) {

		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBbsID());
		
		return "redirect:/board/list";
	}


//	조회 처리와 테스트 구현
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bbsID") long bbsID, Model model) {
		log.info("get : " +bbsID);
		model.addAttribute("board", service.get(bbsID));
	}

	// 수정과 삭제는 성공시 result에 success를 담아서 view에 전달하기, 수정과 테스트 구현
	@PostMapping("/modify") 		//@ModelAttribute("cri") 붙여봄
	public String modify(BbsVO board,RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list"; 
	//+ cri.getListLink();
	}

//	@PostMapping("/remove") // 5.삭제
	@GetMapping("/remove") // 5.삭제
//	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public String remove(@RequestParam("bbsID") Long bbsID, RedirectAttributes rttr) {

		log.info("remove..." + bbsID);
		if (service.remove(bbsID)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}

}
