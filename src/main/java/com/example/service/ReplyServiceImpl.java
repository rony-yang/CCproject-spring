package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.Criteria;
import com.example.domain.ReplyPageDTO;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register......"+vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get......"+ rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("get......"+ vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("get......"+ rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get......"+ bno);
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno),mapper.getListWithPaging(cri, bno));
		// 각각의 매퍼를 이용하여 덧글의 갯수와 덧글의 목록 추출.
		// ReplyPageDTO(게시물별 덧글 총갯수, 게시물별 10개씩 덧글 목록
	}

}
