package com.bc.chaeum.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.member.service.UserService;
import com.bc.chaeum.member.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		
	}

	@Override
	public UserVO loginUser(UserVO vo) {
		
		return userDAO.loginUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		
		userDAO.insertUser(vo);
	}

	

	
	
}
