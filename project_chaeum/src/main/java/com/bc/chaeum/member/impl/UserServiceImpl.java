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

	@Override
	public void userUpdate(MemberVO vo) {
		userDAO.userUpdate(vo);
		
	}

	@Override
	public void userSignout(String email) {
		userDAO.userSignout(email);
		
	}

	@Override
	public void passFind(MemberVO vo) {
		userDAO.passFind(vo);
		
	}

	

	
	
}
