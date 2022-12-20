package com.example.mapper;

import com.example.domain.UsersDTO;

public interface UserInfoMapper {

	public UsersDTO readID(UsersDTO dto);
	public int checkID(String id);
	public UsersDTO checkUser(String id);
	public int insertID(UsersDTO dto);
	public int updateID(UsersDTO dto);
	public int deleteID(UsersDTO dto);
	
}
