package com.bc.chaeum.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.member.service.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println(">> UserDAO() 객체 생성");
	}

	public UserVO loginUser(UserVO vo) {
		System.out.println("===> MyBatis로 loginUser() 실행");
		return mybatis.selectOne("userDAO.loginUser", vo);
	}

	public void insertUser(UserVO vo) {
		System.out.println("===> MyBatis로 insertUser() 실행");
		mybatis.insert("userDAO.insertUser", vo);
	}
}	
