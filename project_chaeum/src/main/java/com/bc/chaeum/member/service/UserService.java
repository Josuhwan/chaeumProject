package com.bc.chaeum.member.service;


public interface UserService {
	UserVO loginUser(UserVO vo);
	void insertUser(UserVO vo);
}
