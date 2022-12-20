package com.example.service;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.AttendanceDTO;
import com.example.domain.AttendanceVO;
import com.example.domain.Criteria;
import com.example.mapper.CCMapper;
import com.example.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CCServiceImpl implements CCService{
	@Setter(onMethod_ = @Autowired)
	private CCMapper mapper;
	
	
	
	@Override
	public AttendanceDTO getAllDate(String userId, String studyCode) {
		AttendanceDTO dto = new AttendanceDTO();
		
		Date startDateData = mapper.getStartDate(studyCode);
		Date endDateData = mapper.getEndDate(studyCode); //study 테이블의 일자를 조회해서 사용함.
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String startDate = sdf.format(startDateData);
		String endDate = sdf.format(endDateData);
		
		
		//총 수업일수 구하기.
		dto.setTotalDate(mapper.getTotalDate(startDate, endDate));
		
		//현재 진행일 수 구하기.
		dto.setCurrentDate(mapper.getCurrentDate(startDate, endDate));
		//총 출석일 수 구하기. -- 이 녀석을 고쳐야함.
		dto.setCheckDate(mapper.getCheckDate(userId, studyCode));
		//과정명 설정.
		dto.setStudyCode(studyCode);
		
		//수업 시간 구하기.
		dto.setStartTime(mapper.getStartTime(studyCode));
		dto.setEndTime(mapper.getEndTime(studyCode));
		
		return dto;
	}

	@Override
	public List<AttendanceDTO> getAllStudy(String userId, Criteria cri) {
		List<AttendanceDTO> dtoList = new ArrayList<>();
		List<String> codeList = mapper.getStudyCode(userId); // 스터디 코드의 list
		
		//list는 userId에서 뽑아낸 studyCode이다. 이를 넣어서 
		
		for(int i=0;i<codeList.size();i++) {
			String studyCode = codeList.get(i); // 스터디 코드.
			//여기서부터 출석관련 날짜 데이터가 전부 들어감.
			AttendanceDTO data = getAllDate(userId, studyCode); 
			
			// 여기서 페이지 네이션 관련 정보가 들어감.
			data.setTotalPage(getTotalPage(userId, studyCode, cri));
			dtoList.add(data);
		}

		return dtoList;
	}

	@Override
	public List<AttendanceVO> getCheckList(String userId, Criteria cri) {
		//1. 유저 id로 스터디 코드를 모두 조회.
		//2. 그렇게 조회한 스터디 코드들을 모두 써서 list에 반환.		
		
		List<AttendanceVO> list = new ArrayList<>();	
		
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		
		int a = amount*(pageNum-1)+1;
		int b = a+amount-1;
		
		log.info("a :"+a);
		log.info("b :"+b);
		
		List<String> codeList = mapper.getStudyCode(userId); // 여기에 있는 스터디 코드를 써서 반복문을 굴리자.
		
		for(int i=0;i<codeList.size();i++) {
			String studyCode = codeList.get(i);			
			list.addAll(mapper.getCheckList(userId, studyCode, a, b)); // 여기서도 스터디 코드 써야 함.
		}		
		
		return list;
	}

	@Override
	public int joinAttendance(String userId, String studyCode) {
		int today = mapper.selectTodayCheck(userId,studyCode);
		
		log.info("studyCode : " +studyCode);
		log.info("userId : " +userId);
		
		if(today!=0) {
			return mapper.updateJoinAttendance(userId, studyCode);
		}else {
			return mapper.insertJoinAttendance(userId, studyCode);
		}
	}

	@Override
	public int exitAttendance(String userId, String studyCode) {
		int today = mapper.selectTodayCheck(userId,studyCode);
		
		if(today!=0) {
			return mapper.updateExitAttendance(userId, studyCode);
		}else {
			return 0;
		}
	
	}

	@Override
	public List<AttendanceVO> getPagedCheckList(String userId, String studyCode, Criteria cri) {
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		
		int a = amount*(pageNum-1)+1;
		int b = a+amount-1;
		
		List<AttendanceVO> list = mapper.getPagedCheckList(userId, studyCode, a, b);
	
		for(int i=0;i<list.size();i++) {
			AttendanceVO vo= list.get(i);
			
			Time startTime = mapper.getStartTime(studyCode);
			Time endTime = mapper.getEndTime(studyCode);
			
			Time attStartTime = vo.getAttendanceJoin();
			Time attEndTime = vo.getAttendanceExit();
			if(attEndTime==null) {
				vo.setAttendanceResult("무단");
			}else if(attStartTime.after(startTime)) {
				vo.setAttendanceResult("지각");
			}else if(attEndTime.before(endTime)) {
				vo.setAttendanceResult("조퇴");
			}else{
				vo.setAttendanceResult("");
			}
		}	
		
		return list;
	}

	@Override
	public int getTotalPage(String userId, String studyCode, Criteria cri) {
		int totalPage = mapper.getTotalPage(userId, studyCode);
		int amount = cri.getAmount();
		int realTotal = (int)Math.ceil((double)totalPage/amount);
		
		log.info(realTotal);
		
		return realTotal;
	}

	@Override
	public void get1() {
//		List<AttendanceVO> check = ccService.getCheckList(userId, cri); 
//		List<AttendanceDTO> list = ccService.getAllStudy(userId, cri);	
	}

	
	
	
}
