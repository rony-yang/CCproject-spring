package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.UsersDTO;
import com.example.mapper.ReplyMapper;
import com.example.mapper.UserInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserInfoServiceImpl implements UserInfoService{
	@Setter(onMethod_ = @Autowired)
	UserInfoMapper uiMapper;	
	
	@Override
	public UsersDTO readID(UsersDTO dto) {
//		log.info(uiMapper.readID(dto)); //제대로 데이터베이스가 실행되는지 디버그용 
		return uiMapper.readID(dto);
	}

	@Override
	public int insertID(UsersDTO dto) {
		
		return uiMapper.insertID(dto);
	}

	@Override
	public int updateID(UsersDTO dto) {
		// TODO Auto-generated method stub
		return uiMapper.updateID(dto);
	}

	@Override
	public int deleteID(UsersDTO dto) {
		// TODO Auto-generated method stub
		return uiMapper.deleteID(dto);
	}

	@Override
	public String checkID(String id) {
		String result ="가능";
		
		if(uiMapper.checkID(id)==0) {
			return result;
		}else {
			return "불가";
		}
		

	}

	@Override
	public UsersDTO checkUser(String id) {
		log.info("check user... : " + id);
		return uiMapper.checkUser(id);
	}

}
