package com.bc.chaeum.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.member.service.MemberVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println(">> UserDAO() 객체 생성");
		
	}

	public MemberVO loginUser(MemberVO vo) {
		System.out.println("===> MyBatis로 loginUser() 실행");
		return mybatis.selectOne("userDAO.loginUser", vo);
	}

	public void insertUser(MemberVO vo) {
		System.out.println("===> MyBatis로 insertUser() 실행");
		mybatis.insert("userDAO.insertUser", vo);
	}

	public int checkName(String nickname) {
		System.out.println("====> checkName() 실행");
		
		return mybatis.selectOne("userDAO.checkName", nickname);
		
	}

	public int checkEmail(String email) {
		System.out.println("====> checkEmail() 실행");
		return mybatis.selectOne("userDAO.checkEmail", email);
	}
}	
