package com.example.service;

import java.util.List;

import com.example.domain.ReplyVO;
import com.example.domain.Criteria;
import com.example.domain.ReplyPageDTO;
import com.example.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	// 덧글의 목록과 게시물의 갯수.
	
	
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
