package com.bc.chaeum.member.service;


public interface UserService {
	MemberVO loginUser(MemberVO vo);
	void insertUser(MemberVO vo);
	int checkName(String ninkname);
	int checkEmail(String email);
}
