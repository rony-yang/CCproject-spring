package com.example.mapper;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AttendanceDTO;
import com.example.domain.AttendanceVO;
import com.example.domain.BbsVO;
import com.example.domain.Criteria;
import com.example.domain.RegistrationDTO;
import com.example.service.BbsService;
import com.example.service.CCService;
import com.example.service.RegistrationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class CCMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private StudyMapper studyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private CCMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private BbsService bbsService;
	
	@Setter(onMethod_ = @Autowired)
	private CCService service;
	
	@Setter(onMethod_ = @Autowired)
	private RegistrationMapper regMapper;
	
	@Setter(onMethod_ = @Autowired)
	private RegistrationService regService;
	
	@Setter(onMethod_ = @Autowired)
	private RegistrationMapper registrationMapper;
	
	@Setter(onMethod_ = @Autowired)
	private RegistrationService registrationService;
	
//	@Test
	public void test() { // 출석해야 하는 일수.
		mapper.getTotalDate("20221101", "20221231");
		
	}
	
//	@Test
	public void test2() { //현재 진행일차.
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        
        log.info(strToday);	
		
		mapper.getCurrentDate("20221101", strToday);
		
	}
	
//	@Test
	public void test3() { // 코스명으로 시작 날짜 구하기.
		
		Date dateData = mapper.getStartDate("test");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(dateData);
		
		log.info(date);
	}
	
//	@Test
	public void test4() { // 코스명으로 종료 날짜 구하기.
		
		Date dateData = mapper.getEndDate("test");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(dateData);
		
		log.info(date);
	}
//	@Test
	public void getAllDate() {
		AttendanceDTO dto = new AttendanceDTO();
		
		String studyCode="test";
		Date startDateData = mapper.getStartDate(studyCode);
		Date endDateData = mapper.getEndDate(studyCode);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String startDate = sdf.format(startDateData);
		String endDate = sdf.format(endDateData);
		
		log.info(startDate);
		log.info(endDate);
		
		//총 수업일수 구하기.
		dto.setTotalDate(mapper.getTotalDate(startDate, endDate));
		//현재 진행일 수 구하기.
		dto.setCurrentDate(mapper.getCurrentDate(startDate, endDate));

		
		log.info(dto);
	}
	
//	@Test
	public void test5() {
		
		mapper.getCheckDate("test", "test");
		
	}
	
//	@Test
	public void test8() { 
		log.info(mapper.getStudyCode("test"));
		
	}
	
//	@Test
	public void test9() {	
		AttendanceDTO dto = service.getAllDate("test", "test");	
		log.info(dto);
	}
	
//	@Test
	public void test10() {	
		AttendanceDTO dto = service.getAllDate("test", "test");	
		
//		List<AttendanceDTO> list = service.getAllStudy("test");	
//		log.info(list);
	}
	
	
//	@Test
	public void test12() {	
		Time time1 = mapper.getStartTime("test");	
		Time time2 = mapper.getEndTime("test");
		
		time1.compareTo(time2);
	}
	
//	@Test
	public void test13() {

		int a = mapper.updateJoinAttendance("test", "test");
		
		log.info(a);	
		
	}
	
//	@Test
	public void serviceTest() {	
		Criteria cri = new Criteria(2,5);
		
//		List<AttendanceVO> list = service.getPagedCheckList("test", "test", cri);
//		log.info(list);
		
		List<AttendanceVO> list= service.getPagedCheckList("test", "test", cri);	
		log.info(list);
		
	}
	
//	@Test
	public void mapperTest() {	
					
		Time startTime = mapper.getStartTime("test");
		Time endTime = mapper.getEndTime("test");
		
		log.info(startTime.after(endTime)); //startTime은 endTime보다 뒤에 있는가?
		
	}
	
	@Test
	public void regTest() {	
//		RegistrationDTO dto = new RegistrationDTO();
//		dto.setStudyCode("test");
//		dto.setUserId("test");
//		
//		regMapper.Course_regist(dto);
		
		BbsVO vo = new BbsVO();
//		bbsID, bbsTitle, bbsContent, userid, bbsdate,studycode
		vo.setUserId("admin");
		vo.setBbsContent("test");
		vo.setBbsTitle("test");
		vo.setStudyCode("0");
		
		bbsService.register(vo);
		
	}
}
