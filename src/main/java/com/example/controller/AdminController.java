package com.example.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.RegistrationConfirmDTO;
import com.example.domain.RegistrationDTO;
import com.example.domain.StudyDTO;
import com.example.mapper.StudyMapper;
import com.example.service.CCService;
import com.example.service.RegistrationService;
import com.example.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/admin/*")
@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	private StudyService studyService;
	private RegistrationService regService;
	
	@GetMapping(value="/addStudy")
	public void addStudy() {
		
	}	
	
	@PostMapping(value="/addStudy")
	public String addStudy(StudyDTO dto, MultipartFile uploadFile) {
		String uploadFolder = "C:\\Users\\admin\\git\\Academy123123123\\ccProject\\src\\main\\webapp\\resources\\img"; // 경로 설정.		
		String fileName = dto.getStudyCode() + ".jpg";
		
		log.info(dto);		
		dto.setStudyImage(fileName);
		
		studyService.insert(dto);
		
		log.info("result:");	
		
		File saveFile = new File(uploadFolder, fileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}//end catch
		
		return "redirect:/study/list";
		
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		for(MultipartFile multipartFile : uploadFile) {
			log.info("==============");
			log.info("Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("Upload File Size:" + multipartFile.getSize());
			
			String uploadFolder = "c:\\upload\\temp"; // 경로 설정.
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
			
		}
	}
	
	@PostMapping("/uploadAjaxAction")
	public @ResponseBody String uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "c:\\upload\\temp"; // 경로 설정.
		log.info("ajax 전송 컨트롤러 진입.");
		log.info(uploadFile);
		
		String result = "success";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("==============");
			log.info("Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("Upload File Size:" + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
 			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
				result="error";
			}//end catch
		}
		return result;
	}
	
	@GetMapping("/registList")
	public void registListGET(HttpSession session, Model model) {
		
		// 데이터 조회
		List<RegistrationConfirmDTO> list = regService.Course_allList();	
		model.addAttribute("list", list);
		log.info(list);	
	}
	
	// 수강 수락 및 거절(업데이트).
	@PostMapping(value="/update")
	public String courseUpdate(String userId, String studyCode, String status) {
		
		log.info("update userId: "+ userId);		
		log.info("update studyCode: "+ studyCode);
		log.info("update status: "+ status);
		
		// 로그인 체크 코드 필요
		
		regService.update(userId, studyCode, status); // status에는 String이 들어감.
		
		return "redirect:/admin/registList/";
	}
}
