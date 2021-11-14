package com.bc.chaeum.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.member.service.UserService;
import com.bc.chaeum.member.service.MemberVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		
	}

	@Override
	public MemberVO loginUser(MemberVO vo) {
		
		return userDAO.loginUser(vo);
	}

	@Override
	public void insertUser(MemberVO vo) {	
		userDAO.insertUser(vo);
	}

	@Override
	public int checkName(String nickname) {
	    int result = userDAO.checkName(nickname);
		return result;
	}

	@Override
	public int checkEmail(String email) {
		int result = userDAO.checkEmail(email);
		return result;
	}

	

	
	
}
