package com.example.service;

import com.example.domain.UsersDTO;

public interface UserInfoService {
	public UsersDTO readID(UsersDTO dto);
	public String checkID(String id);
	public UsersDTO checkUser(String id);
	public int insertID(UsersDTO dto);
	public int updateID(UsersDTO dto);
	public int deleteID(UsersDTO dto);
	
}
